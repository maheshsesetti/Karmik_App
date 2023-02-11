import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karmik/routes/route_page.dart';
import 'package:routemaster/routemaster.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.sp, horizontal: 30.sp),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Text(
                "₹250/hr",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Routemaster.of(context).push(InitialPageRoutes.payment);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18))),
            child: const Text("Hire Now"),
          )
        ]),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[100],
                      border: Border.all(color: Colors.white, width: 3),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/3348748/pexels-photo-3348748.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shreya sharma",
                        style: TextStyle(fontSize: 48.sp),
                      ),
                      Text("Home Cleaner", style: TextStyle(fontSize: 34.sp)),
                      Text("Hyderabad",
                          style: TextStyle(
                              fontSize: 26.sp, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      size: 50.sp,
                    ),
                    Text(
                      "4.5/5",
                      style: TextStyle(fontSize: 30.sp),
                    ),
                    Icon(
                      Icons.star,
                      size: 50.sp,
                    ),
                    Text(
                      "4.5/5",
                      style: TextStyle(fontSize: 30.sp),
                    ),
                    Icon(
                      Icons.star,
                      size: 50.sp,
                    ),
                    Text(
                      "4.5/5",
                      style: TextStyle(fontSize: 30.sp),
                    ),
                    Icon(
                      Icons.star,
                      size: 50.sp,
                    ),
                    Text(
                      "4.5/5",
                      style: TextStyle(fontSize: 30.sp),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
              ),
              Container(
                height: 50.h,
                padding:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("About"),
                    SizedBox(
                      height: 5.h,
                    ),
                    const Text(
                      "Cleaning your house with a cloth or a long stick can be a tedious task. A floor mop set is specially designed to make mopping a quick",
                      maxLines: 3,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 50.h,
                padding:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Skills"),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          color: Colors.grey[600],
                          child: const Text('Dust Clean'),
                        )),
                        Expanded(
                            child: Container(
                          color: Colors.grey[600],
                          child: const Text('Dust Clean'),
                        )),
                        Expanded(
                            child: Container(
                          color: Colors.grey[600],
                          child: const Text('Dust Clean'),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 50.h,
                padding:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Language"),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          color: Colors.grey[600],
                          child: const Text('Telugu'),
                        )),
                        Expanded(
                            child: Container(
                          color: Colors.grey[600],
                          child: const Text('Hindi'),
                        )),
                        Expanded(
                            child: Container(
                          color: Colors.grey[600],
                          child: const Text('English'),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 50.h,
                padding:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Rating & Review"),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          color: Colors.grey[600],
                          child: const Text('Telugu'),
                        )),
                        Expanded(
                            child: Container(
                          color: Colors.grey[600],
                          child: const Text('Hindi'),
                        )),
                        Expanded(
                            child: Container(
                          color: Colors.grey[600],
                          child: const Text('English'),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
