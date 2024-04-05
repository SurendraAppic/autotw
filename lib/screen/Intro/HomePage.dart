// ignore_for_file: unused_import, unnecessary_import, unused_label

import 'package:autowheelapp/account/Controvochur.dart';
import 'package:autowheelapp/account/ExpenseScreen.dart';
import 'package:autowheelapp/account/IncomeScrren.dart';
import 'package:autowheelapp/account/InvoiceScreen.dart';
import 'package:autowheelapp/account/PaymentScreen.dart';
import 'package:autowheelapp/screen/Intro/Drower.dart';
import 'package:autowheelapp/screen/Intro/slidscreen.dart';
import 'package:autowheelapp/screen/Jobcard/Estmitate.dart';
import 'package:autowheelapp/screen/Jobcard/JobCard.dart';
import 'package:autowheelapp/screen/Jobcard/JobColse.dart';
import 'package:autowheelapp/screen/Jobcard/Materilissu.dart';
import 'package:autowheelapp/screen/Jobcard/Outsidework.dart';
import 'package:autowheelapp/screen/Jobcard/PurchasOder.dart';
import 'package:autowheelapp/screen/master/Ledgermaster.dart';
import 'package:autowheelapp/screen/master/MastersScreen.dart';
import 'package:autowheelapp/screen/master/PurchaseInvoice.dart';
import 'package:autowheelapp/utils/widget/Controllerdeta.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:autowheelapp/utils/image/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final InvoiceController invoiceController = Get.put(InvoiceController());
  List jobCards = [];

  Future<void> fetchData() async {
    final url =
        'http://lms.muepetro.com/api/UserController1/GetJobCardALLocationwise?locationid=2';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      print(jsonData.length);
      // final List<ModeljobcardAlldeta> fetchedCards = jsonData.map((e) {
      //   return ModeljobcardAlldeta.fromJson(e);
      // }).toList();

      setState(() {
        jobCards = jsonData;
      });
      print(response.body);
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  }

  int Selected = 0;
  List data = [
    {
      "text": "Estimate",
      "Image": "assets/estmiteate.png",
      'path': EstimateScreen()
    },
    {
      "text": "Job Card",
      "Image": "assets/jobcard.png",
      'path': JobCardScreen()
    },
    {
      "text": "Material issue",
      "Image": "assets/materialeissu.png",
      'path': MaterialissuScreen()
    },
    {
      "text": "outside Work",
      "Image": "assets/outsidework.png",
      'path': OutsideWorkScreen()
    },
    {
      "text": "Invoice",
      "Image": "assets/invoice.png",
      'path': InvoiveScreen(
        value: true,
      )
    },
    {
      "text": "Job Close",
      "Image": "assets/invoice.png",
      'path': JobColseScreen()
    },
  ];
  List data1 = [
    {"text1": "Purchase Order", "Image1": "assets/purchase.png"},
    {"text1": "Purchase Invoice", "Image1": "assets/invoice.png"},
  ];
  List data2 = [
    {"text2": "Payment", "Image2": "assets/payment.png"},
    {"text2": "Respit", "Image2": "assets/recipt.png"},
    {"text2": "Expense", "Image2": "assets/Expens.png"},
    {"text2": "Ledger view", "Image2": "assets/ladgerviwe.png"},
    {"text2": "Contro Vouchor", "Image2": "assets/payment.png"},
  ];
  TextEditingController SearchController = TextEditingController();
  List mattertypeList = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      invoiceController.clearValues();
      fetchData().then((value) => setState(() {
            mattertypeList;
          }));
    });
  }

  @override
  Widget build(BuildContext context) {
    mattertypeList = [
      {
        'image': 'assets/draftd.png',
        'title': 'Drafted',
        'subtitle': '${jobCards.length}'
      },
      {
        'image': 'assets/clock (2).png',
        'title': 'In Progress',
        'subtitle': '2'
      },
      {'image': 'assets/spare.png', 'title': 'Spare Pending', 'subtitle': '2'},
      {'image': 'assets/rady.png', 'title': 'Ready Vecile', 'subtitle': '3'},
      {
        'image': 'assets/car-insurance_8431038.png',
        'title': 'Insurence Claim',
        'subtitle': '3'
      },
      {
        'image': 'assets/delivery_7322896.png',
        'title': 'Vechile Delivered',
        'subtitle': '1'
      },
    ];
    return Scaffold(
      drawer: DrawerScreen(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Dashbord",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 36,
        elevation: 2,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: AppColor.kWhite),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 82, 198, 86),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                addVerticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(blurRadius: 1, color: AppColor.kGray)
                          ],
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {},
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
                            boxShadow: [
                              BoxShadow(blurRadius: 1, color: AppColor.kGray)
                            ]),
                        child: Center(
                          child: InkWell(
                            onTap: () {},
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
                            boxShadow: [
                              BoxShadow(blurRadius: 1, color: AppColor.kGray)
                            ]),
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
                            boxShadow: [
                              BoxShadow(blurRadius: 1, color: AppColor.kGray)
                            ]),
                        child: Center(
                          child: InkWell(
                              onTap: () {},
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
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 230, 224, 224))),
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
                    hintText: 'Costomer',
                    hintStyle: TextStyle(color: AppColor.kBlack),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: AppColor.kRed)),
                  ),
                ),
                addVerticalSpace(10),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(data[index]['path']);
                              },
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: data[index]["color"],
                                backgroundImage:
                                    AssetImage(data[index]["Image"]),
                              ),
                            ),
                            Text(
                              data[index]["text"],
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Divider(
                  color: AppColor.kGray,
                ),
                addVerticalSpace(30),
                SizedBox(
                  height: 200,
                  child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      childAspectRatio: 3,
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      children: List.generate(
                        6,
                        (index) {
                          return Container(
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              alignment: Alignment.topCenter,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColor.kWhite,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1, color: AppColor.kGray)
                                  ]),
                              child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SlidScreen(initialIndex: index),
                                        ));
                                  },
                                  dense: true,
                                  contentPadding: EdgeInsets.only(left: 5),
                                  leading: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                mattertypeList[index]
                                                    ['image']))),
                                  ),
                                  title: Text(mattertypeList[index]['title'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      )),
                                  subtitle: Text(
                                    mattertypeList[index]['subtitle'],
                                  )));
                        },
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/jobcardScreen");
              },
              child: Text(AddJobcard),
            ),
            InkWell(
              onTap: () {
                _openBottomSheet();
              },
              child: CircleAvatar(
                child: Icon(
                  Icons.add,
                  color: AppColor.kBlack,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(InvoiveScreen(
                  value: true,
                ));
              },
              child: Text('    Invoice  '),
            ),
          ],
        ),
      ),
    );
  }

  void _openBottomSheet() {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        // height:
        MediaQuery.of(context).size.height;
        return SingleChildScrollView(
          child: Container(
            height: 700,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    SalesTransactiontxt,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  addVerticalSpace(10),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 13,
                      mainAxisExtent: 95,
                      crossAxisSpacing: 30,
                    ),
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                              Estmate(index);
                            },
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffC7C2E2),
                              ),
                              child: Center(
                                  child: Image.asset(data[index]["Image"])),
                            ),
                          ),
                          addVerticalSpace(3),
                          Text(data[index]["text"])
                        ],
                      );
                    },
                  ),
                  addVerticalSpace(10),
                  Text(
                    "Purchase Transaction",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  addVerticalSpace(20),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 5,
                        mainAxisExtent: 90,
                        crossAxisSpacing: 30),
                    itemCount: data1.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                              _navigateToScreen(index);
                            },
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffC7C2E2),
                              ),
                              child: Center(
                                child: Image.asset(
                                  data1[index]["Image1"],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Text(data1[index]["text1"]),
                        ],
                      );
                    },
                  ),
                  addVerticalSpace(15),
                  Text(
                    "Account",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  addVerticalSpace(17),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 5,
                        mainAxisExtent: 90,
                        crossAxisSpacing: 30),
                    itemCount: data2.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                              Account(index);
                            },
                            child: Container(
                              // margin: EdgeInsets.all(5),
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffC7C2E2),
                              ),
                              child: Center(
                                child: Image.asset(data2[index]["Image2"]),
                              ),
                            ),
                          ),
                          Text(data2[index]["text2"])
                        ],
                      );
                    },
                  ),
                  Center(
                      child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColor.kBlack,
                      radius: 25,
                      child: Icon(
                        Icons.close,
                        color: AppColor.kWhite,
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _navigateToScreen(int index) {
    switch (index) {
      case 0:
        Get.to(() => PurchasoderScreen());
        break;
      case 1:
        Get.to(() => PurchaseInvoiceScreen());

        break;

      default:
        break;
    }
  }

  void Estmate(int index) {
    switch (index) {
      case 0:
        Get.to(() => EstimateScreen());

        break;
      case 1:
        Get.to(() => JobCardScreen());

        break;

      case 2:
        Get.to(() => MaterialissuScreen());
        break;

      case 3:
        Get.to(() => OutsideWorkScreen());
        break;

      case 4:
        Get.to(() => InvoiveScreen(
              value: true,
            ));
        break;
      case 5:
        Get.to(() => JobColseScreen());

      default:
        break;
    }
  }

  void Account(int index) {
    switch (index) {
      case 0:
        Get.to(() => PaymentScreen());

        break;
      case 1:
        Get.to(() => IncomeScrreen());

        break;

      case 2:
        Get.to(() => ExpenseScreen());
        break;
      case 3:
        Get.to(() => LedgerScreen());
        break;
      case 4:
        Get.to(() => ControlVoucharScreen());
        break;
    }
  }
}
