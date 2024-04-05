// ignore_for_file: unused_import, unused_element

import 'package:autowheelapp/account/Controvochur.dart';
import 'package:autowheelapp/account/ExpenseScreen.dart';
import 'package:autowheelapp/account/IncomeScrren.dart';
import 'package:autowheelapp/account/InvoiceScreen.dart';
import 'package:autowheelapp/account/PaymentScreen.dart';
import 'package:autowheelapp/screen/Jobcard/Estmitate.dart';
import 'package:autowheelapp/screen/Jobcard/Materilissu.dart';
import 'package:autowheelapp/screen/Jobcard/Outsidework.dart';
import 'package:autowheelapp/screen/master/Ledgermaster.dart';
import 'package:autowheelapp/screen/master/PurchaseInvoice.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../Jobcard/JobCard.dart';

class BottomSeetScreen extends StatefulWidget {
  const BottomSeetScreen({super.key});
  @override
  State<BottomSeetScreen> createState() => _BottomSeetScreenState();
}

List data = [
  {
    "text": "Estimate",
    "Image": "assets/estmiteate.png",
    'class': const EstimateScreen()
  },
  {
    "text": "Job Card",
    "Image": "assets/jobcard.png",
    'class': const JobCardScreen()
  },
  {
    "text": "Material issue",
    "Image": "assets/materialeissu.png",
    'class': const MaterialissuScreen()
  },
  {
    "text": "outside Work",
    "Image": "assets/outsidework.png",
    'class': const OutsideWorkScreen()
  },
  {
    "text": "Invoice",
    "Image": "assets/invoice.png",
    'class': InvoiveScreen(
      value: true,
    )
  },
];
List data1 = [
  {
    "text1": "Purchase Order",
    "Image1": "assets/purchase.png",
    'class1': PurchaseInvoiceScreen(),
  },
  {
    "text1": "Purchase Invoice",
    "Image1": "assets/invoice.png",
    'class1': PurchaseInvoiceScreen(),
  },
  // {"text1": "Payment", "Image1": "assets/payment.png"},
  // {"text1": "Contro Vouchor", "Image1": "assets/payment.png"},
];
// List data2 = [
//   {"text2": "Payment", "Image2": "assets/payment.png"

//   },
//   {"text2": "Respit", "Image2": "assets/recipt.png"},
//   {"text2": "Expense", "Image2": "assets/Expens.png"},
//   {"text2": "Ledger view", "Image2": "assets/ladgerviwe.png"},
//   {"text2": "Contro Vouchor", "Image2": "assets/payment.png"},
// ];
List data2 = [
  {
    "text2": "Payment",
    "Image2": "assets/payment.png",
    'class2': const PaymentScreen(),
  },
  {
    "text2": "Respit",
    "Image2": "assets/recipt.png",
    'class2': const IncomeScrreen(),
  },
  {
    "text2": "Expense",
    "Image2": "assets/Expens.png",
    'class2': const ExpenseScreen(),
  },
  {
    "text2": "Ledger view",
    "Image2": "assets/ladgerviwe.png",
    'class2': LedgerScreen(),
  },
  {
    "text2": "Contro Vouchor",
    "Image2": "assets/payment.png",
    'class2': const ControlVoucharScreen(),
  },
];

class _BottomSeetScreenState extends State<BottomSeetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 700,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        SalesTransactiontxt,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          data[index]['class'],
                                    ),
                                  );
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
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          data1[index]['class1'],
                                    ),
                                  );
                                  // Get.back();
                                  // _navigateToScreen(index);
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
                              Text(data1[index]["text1"])
                            ],
                          );
                        },
                      ),
                      addVerticalSpace(15),
                      Text(
                        "Account",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          data2[index]['class2'],
                                    ),
                                  );
                                  // Get.back();
                                  // Account(index);
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
                      // addVerticalSpace(7),
                      Center(
                          child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
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
            ],
          ),
        ),
      ),
    );
  }
}

void _navigateToScreen(int index) {
  switch (index) {
    case 0:
      // Get.to(() => Sign_Up());
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
      Get.to(() => InvoiveScreen(value: true));

    default:
      break;
  }
}
