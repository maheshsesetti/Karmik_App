import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karmik/presentation/pages/utils/image_assets.dart';
import 'package:routemaster/routemaster.dart';

import '../../../routes/route_page.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? _currentAddress;
  Position? _currentPosition;
  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentLocation() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: Container(
            color: Colors.red[700],
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 15.sp, left: 15.sp, right: 15.sp, bottom: 10.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.person_2_outlined,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                          height: 120.sp,
                          child: Image.asset(ImageAssetsPath.logo)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.sp),
                        child: Icon(
                          Icons.notifications_none_sharp,
                          size: 45.sp,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                    Text(' ${_currentAddress ?? ""}',
                        style: const TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 45.sp, right: 45.sp, top: 8.sp, bottom: 4.sp),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.sp, vertical: 0.3.sp),
                          child: TextFormField(
                              onTap: () {
                                Routemaster.of(context)
                                    .push(InitialPageRoutes.search);
                              },
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none,
                                hintText: "Search for Karmik's or service",
                              )))),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 20.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Popular Services",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32.sp),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Flexible(
                child: GridView.builder(
                    itemCount: 7,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 30.0,
                            mainAxisSpacing: 30.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 5.h),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              height: 180.sp,
                              child: Icon(
                                Icons.person,
                                size: 80.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            "Electrician",
                            style: TextStyle(fontSize: 25.sp),
                          )
                        ],
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
