import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karmik/presentation/pages/utils/image_assets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.h),
        child: AppBar(
          backgroundColor: Colors.red,
          leading: InkWell(
            onTap: () {},
            child: const Icon(Icons.person_2_outlined),
          ),
          title:
              SizedBox(height: 40.h, child: Image.asset(ImageAssetsPath.logo)),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Icon(
                Icons.notifications_none_sharp,
                size: 45.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
