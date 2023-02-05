import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search for Karmik's or service",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            const Expanded(child: GridWidget())
            // const GridWidget(),
          ],
        ),
      ),
    );
  }
}
