import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp,horizontal: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h,),
            InkWell(
              onTap: (){},
              child: const Icon(Icons.arrow_back,color: Colors.black,),
            ),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /
                      6,
                  width:
                  MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[100],
                    border: Border.all(
                        color: Colors.white, width: 3),
                    image:const DecorationImage(
                      image: NetworkImage("https://images.pexels.com/photos/3348748/pexels-photo-3348748.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10.sp,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Shreya sharma",style: TextStyle(fontSize: 48.sp),),
                    Text("Home Cleaner",style: TextStyle(fontSize: 34.sp)),
                    Text("Hyderabad",style: TextStyle(fontSize: 26.sp,fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 10.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.star,size: 50.sp,),
                  Text("4.5/5",style: TextStyle(fontSize: 30.sp),),
                  Icon(Icons.star,size: 50.sp,),
                  Text("4.5/5",style: TextStyle(fontSize: 30.sp),),
                  Icon(Icons.star,size: 50.sp,),
                  Text("4.5/5",style: TextStyle(fontSize: 30.sp),),
                  Icon(Icons.star,size: 50.sp,),
                  Text("4.5/5",style: TextStyle(fontSize: 30.sp),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 10.sp),
            ),
          ],
        ),
      ),
    );
  }
}
