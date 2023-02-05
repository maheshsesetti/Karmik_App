import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/utils/image_assets.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.width / 0.7,
            top: 0,
            child:
                Image.asset(ImageAssetsPath.splashIcon1, fit: BoxFit.fitHeight),
          ),
          Positioned(
            height: MediaQuery.of(context).size.width / 1,
            top: 150.h,
            child: Image.asset(ImageAssetsPath.splashIcon2),
          ),
          Positioned(
            height: MediaQuery.of(context).size.width / 1,
            top: 320.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 110.w),
              child: Text(
                "India's Largest Gig Workers Portal",
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
