import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karmik/routes/route_page.dart';
import 'package:routemaster/routemaster.dart';

import '../../widget/grid_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: (){},
                      child: const Icon(Icons.arrow_back,color: Colors.black,),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(child: Icon(Icons.filter_alt_outlined,size: 50.sp,),onTap: (){
                    Routemaster.of(context).push(InitialPageRoutes.profile);
                  },),
                )
              ],
            ),
           SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.only(left: 15.sp),
              child: Text("Search Results",style: TextStyle(fontSize: 30.sp),),
            ),
            SizedBox(height: 10.h,),
            const Expanded(child: GridWidget())
          ],
        ),
      ),
    );
  }
}
