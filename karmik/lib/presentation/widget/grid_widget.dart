import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
      "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
      "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
      "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"
    ];
    return GridView.builder(
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
            side: const BorderSide(color: Colors.black, width: 2),
          )),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("4.56"),
                  Column(
                    children: [
                      ClipRect(
                        child: CircleAvatar(
                          radius: 40.sp,
                          child: Image.network(images[index]),
                        ),
                      ),
                      const Text("Shreya sharma"),
                      const Text("Home Cleaner"),
                      const Text("Hyderabad")
                    ],
                  ),
                  const Text("₹250/hr")
                ],
              ),
              Flexible(
                child: GridView.builder(
                    itemCount: 6,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 2.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            ),
                        child: const Text("hello"),
                      );
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}
