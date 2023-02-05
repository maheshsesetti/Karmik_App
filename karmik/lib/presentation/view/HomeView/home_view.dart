import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karmik/presentation/pages/utils/image_assets.dart';
import 'package:routemaster/routemaster.dart';

import '../../../routes/route_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.h),
        child: Container(
          color: Colors.red,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 25.sp, vertical: 15.sp),
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
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 60.sp, vertical: 8.sp),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
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
    );
  }
}
