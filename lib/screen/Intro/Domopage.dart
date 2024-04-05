import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:autowheelapp/utils/image/image.dart';
import 'package:flutter/material.dart';

class DomopageScreen extends StatefulWidget {
  const DomopageScreen({super.key});

  @override
  State<DomopageScreen> createState() => _DomopageScreenState();
}

TextEditingController SearchController = TextEditingController();
var h, w;
List data = [
  {"text": "Estimate", "Image": "assets/estmiteate.png", "color": Colors.blue},
  {"text": "Job Card", "Image": "assets/jobcard.png", "color": Colors.green},
  {
    "text": "Material issue",
    "Image": "assets/materialeissu.png",
    "color": Colors.orange
  },
  {
    "text": "outside Work",
    "Image": "assets/outsidework.png",
    "color": Colors.red
  },
  {"text": "Invoice", "Image": "assets/invoice.png", "color": Colors.purple},
  {"text": "Job close", "Image": "assets/invoice.png", "color": Colors.teal},
];

class _DomopageScreenState extends State<DomopageScreen> {
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: 
        SafeArea(
          child: 
          SingleChildScrollView(
            child: Column(
              children: [
                addVerticalSpace(30),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.kBlack),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              // Get.to(MastersScreen());
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  Totlevehicles,
                                  height: 60,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                        child: Text(
                                      a126,
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    addVerticalSpace(5),
                                    Text(TotalVehiclestxt,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.kGray)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    addhorizontalSpace(10),
                    Expanded(
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: AppColor.kWhite,
                          border: Border.all(color: AppColor.kBlack),
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              // Get.to(MastersScreen());
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  carimg,
                                  height: 50,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                        child: Text(
                                      a126,
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    addVerticalSpace(5),
                                    Text(RadayDeliverytxt,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.kGray)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.kWhite,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: AppColor.kBlack),
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  Serviceimg,
                                  height: 55,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                        child: Text(
                                      "55",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    addVerticalSpace(5),
                                    Text("Service pending",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.kGray)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    addhorizontalSpace(10),
                    Expanded(
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: AppColor.kBlack),
                        ),
                        child: Center(
                          child: InkWell(
                              onTap: () {
                                // Get.to(MastersScreen());
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    Servicepandding,
                                    height: 55,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                          child: Text(
                                        "55",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Service pending",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.kGray)),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                addVerticalSpace(10),
                TextFormField(
                  controller: SearchController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColor.kBlack,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 15,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Color(0xffd2daff),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: AppColor.kBlack,
                                ),
                                Text(
                                  " Bike",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.kBlack,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      contentPadding: EdgeInsets.all(5),
                      hintText: 'Coustomer',
                      hintStyle: TextStyle(color: AppColor.kBlack),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                ),
                addVerticalSpace(10),
                SizedBox(
                  height: 100,
                  width: 330,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: data[index]["color"],
                              backgroundImage: AssetImage(data[index]["Image"]),
                            ),
                            Text(
                              data[index]["text"],
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Divider(
                  color: AppColor.kBlack,
                ),
                addVerticalSpace(30),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.kWhite,
                              border: Border.all(color: AppColor.kGray)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addhorizontalSpace(5),
                              Image.asset(
                                'assets/estmiteate.png',
                                height: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Job card Drafted",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text('3')
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      addhorizontalSpace(5),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.kWhite,
                              border: Border.all(color: AppColor.kGray)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addhorizontalSpace(5),
                              Image.asset(
                                'assets/estmiteate.png',
                                height: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "in progess",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text('3')
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                addVerticalSpace(10),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.kWhite,
                              border: Border.all(color: AppColor.kGray)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addhorizontalSpace(5),
                              Image.asset(
                                'assets/estmiteate.png',
                                height: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Spare Pending",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text('3')
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      addhorizontalSpace(5),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.kWhite,
                              border: Border.all(color: AppColor.kGray)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addhorizontalSpace(5),
                              Image.asset(
                                'assets/estmiteate.png',
                                height: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ready Vehicles",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text('3')
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                addVerticalSpace(10),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.kWhite,
                              border: Border.all(color: AppColor.kGray)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addhorizontalSpace(5),
                              Image.asset(
                                'assets/estmiteate.png',
                                height: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Insurance Claim",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text('3')
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      addhorizontalSpace(5),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.kWhite,
                              border: Border.all(color: AppColor.kGray)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addhorizontalSpace(5),
                              Image.asset(
                                'assets/estmiteate.png',
                                height: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Vehicles Delivered",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text('3')
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
