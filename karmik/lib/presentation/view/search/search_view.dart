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
            InkWell(
              onTap: (){},
              child: const Icon(Icons.arrow_back,color: Colors.black,),
            ),
           SizedBox(height: 10.h,),
            SizedBox(
              height: 25.h,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.sp, vertical: 0.3.sp),
                      child: TextFormField(
                        onTap: (){
                          Routemaster.of(context).push(InitialPageRoutes.profile);
                        },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                            hintText: "Search for Karmik's or service",
                          ))))
            ),
            SizedBox(height: 10.h,),
            const Expanded(child: GridWidget())
          ],
        ),
      ),
    );
  }
}
