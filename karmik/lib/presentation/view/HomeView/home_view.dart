import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karmik/presentation/pages/utils/image_assets.dart';
import 'package:routemaster/routemaster.dart';

import '../../../core/const/constant.dart';
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
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(Icons.person_2_outlined),
                    ),
                    SizedBox(
                        height: 40.h, child: Image.asset(ImageAssetsPath.logo)),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.w),
                child: SizedBox(
                  height: 25.h,
                  child: TextFormField(
                    onTap: () {
                      Routemaster.of(context).push(InitialPageRoutes.search);
                    },
                    decoration: InputDecoration(
                      fillColor: textfieldcolor,
                      errorBorder: InputBorder.none,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      enabledBorder: textFieldBorder,
                      focusedBorder: textFieldBorder,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
