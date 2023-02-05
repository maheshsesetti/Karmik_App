import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "https://images.pexels.com/photos/3348748/pexels-photo-3348748.jpeg",
      "https://images.pexels.com/photos/3348748/pexels-photo-3348748.jpeg",
      "https://images.pexels.com/photos/3348748/pexels-photo-3348748.jpeg",
      "https://images.pexels.com/photos/3348748/"
          "pexels-photo-3348748.jpeg",
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
                  Row(
                    children: const [
                      Icon(Icons.star,color: Colors.red,size: 12,),
                      Text("4.5/5",style: TextStyle(fontSize: 13),)
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height /
                            10,
                        width:
                        MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[100],
                          border: Border.all(
                              color: Colors.white, width: 3),
                          image: DecorationImage(
                            image: NetworkImage(images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Text("Shreya sharma"),
                      const Text("Home Cleaner"),
                      const Text("Hyderabad")
                    ],
                  ),
                  const Expanded(child: Text("₹250/hr",style: TextStyle(fontSize: 13)))
                ],
              ),
              Flexible(
                child: GridView.builder(
                    itemCount: 6,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 2.0
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        "Dust Cleaning",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          background: Paint()
                            ..color = Color(0xffc7e5b4)
                            ..style = PaintingStyle.fill,
                        ),
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
