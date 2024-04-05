// ignore_for_file: unused_import, duplicate_ignore

import 'package:autowheelapp/screen/Intro/HomePage.dart';
import 'package:autowheelapp/screen/Intro/SignUp.dart';
import 'package:autowheelapp/showroom/Prosepet.dart';
// ignore: unused_import
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/String.dart';

import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:autowheelapp/utils/image/image.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class showroomworkshop extends StatefulWidget {
  @override
  State<showroomworkshop> createState() => _showroomworkshopState();
}

class _showroomworkshopState extends State<showroomworkshop> {
  var h, w;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            Container(
              height: h * 0.4,
              width: double.infinity,
              color: Color(0xff62BAB5),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 120),
                height: h * 0.35,
                width: w * 0.85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.kWhite,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: AppColor.kGray,
                      )
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.black,
                          ),
                          Text(
                            "Sales (Rs.)",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColor.kBlack,
                    ),
                    Text(
                      "876543",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: h * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: 150,
                              child: PieChart(
                                PieChartData(
                                  sections: [
                                    PieChartSectionData(
                                      color: Colors.blue,
                                      value: 20,
                                      title: '20%',
                                      radius: 50,
                                    ),
                                    PieChartSectionData(
                                      color: Colors.green,
                                      value: 20,
                                      title: '20%',
                                      radius: 50,
                                    ),
                                    PieChartSectionData(
                                      color: Colors.orange,
                                      value: 25,
                                      title: '40%',
                                      radius: 50,
                                    ),
                                    PieChartSectionData(
                                      color: Colors.red,
                                      value: 25,
                                      title: '20%',
                                      radius: 50,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: w * 0.3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "KTM",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "TVS",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Pulsur",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Cars",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: h * 0.15,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(SignupScreen());
                  },
                  child: Container(
                    height: h * 0.23,
                    width: w * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(blurRadius: 5, color: AppColor.kGray),
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: h * 0.04,
                        ),
                        CircleAvatar(
                          backgroundColor: Color.fromRGBO(253, 177, 177, 1),
                          backgroundImage: AssetImage(showroomimg),
                          radius: 50,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Show Room",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                addhorizontalSpace(20),
                InkWell(
                  onTap: () {
                    Get.to(HomePageScreen());
                  },
                  child: Container(
                    height: h * 0.23,
                    width: w * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: AppColor.kGray,
                          )
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: h * 0.04,
                        ),
                        CircleAvatar(
                          backgroundColor: Color(0xff7287E4),
                          backgroundImage: AssetImage(workshopimg),
                          radius: 50,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Work Shop",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
