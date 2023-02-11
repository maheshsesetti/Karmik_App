import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.sp, horizontal: 30.sp),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18))),
          child: const Text("Add Address & slot"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.sp,
              ),
              Container(
                height: 80.sp,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: const Icon(Icons.arrow_back),
                      onTap: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3, left: 30),
                      child: Text(
                        "Summary",
                        style: TextStyle(fontSize: 28.sp),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25.sp,
              ),
              Container(
                height: 300.sp,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 280.sp,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.symmetric(
                          vertical: 10.sp, horizontal: 25.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: 80.sp,
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            "Refreshing Head Messaage",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 22.sp),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(
                            "₹250",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 22.sp),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          OutlinedButton(
                              onPressed: () {}, child: const Text("Add"))
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 25.sp,
              ),
              Container(
                height: 80.sp,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.sp, right: 10.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.shop,
                            color: Colors.green[400],
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          Text(
                            "Coupons & Offers",
                            style: TextStyle(fontSize: 23.sp),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 25.sp),
                        child: InkWell(
                          onTap: () {},
                          child: const Text('6 Offers'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25.sp,
              ),
              Container(
                height: 500.sp,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.sp, right: 10.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.sp,
                      ),
                      Text(
                        "Payment Summary",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 34.sp),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Item total",
                                  style: TextStyle(fontSize: 23.sp),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 25.sp),
                              child: InkWell(
                                onTap: () {},
                                child: const Text('₹250'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Item discount",
                                  style: TextStyle(fontSize: 23.sp),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 25.sp),
                              child: InkWell(
                                onTap: () {},
                                child: const Text(
                                  '-₹250',
                                  style: TextStyle(color: Colors.teal),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Membership discount",
                                  style: TextStyle(fontSize: 23.sp),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 25.sp),
                              child: InkWell(
                                onTap: () {},
                                child: const Text(
                                  '₹250',
                                  style: TextStyle(color: Colors.teal),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Convenience Fee ",
                                  style: TextStyle(fontSize: 23.sp),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 25.sp),
                              child: InkWell(
                                onTap: () {},
                                child: const Text('₹49'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Plus Membership ",
                                  style: TextStyle(fontSize: 23.sp),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 25.sp),
                              child: InkWell(
                                onTap: () {},
                                child: const Text('₹299'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      const Divider(
                        thickness: 1.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyle(fontSize: 23.sp),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 25.sp),
                              child: InkWell(
                                onTap: () {},
                                child: const Text('₹1,599'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
