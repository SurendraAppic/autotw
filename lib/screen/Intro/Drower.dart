// ignore_for_file: prefer_const_literals_to_create_immutables, deprecated_member_use

import 'dart:io';

import 'package:autowheelapp/Report/BillReport.dart';
import 'package:autowheelapp/Report/SaleReport.dart';
import 'package:autowheelapp/screen/Intro/SignUp.dart';
import 'package:autowheelapp/screen/master/MastersScreen.dart';
import 'package:autowheelapp/screen/master/PurchaseInvoice.dart';
import 'package:autowheelapp/screen/master/Searvicemaster.dart';
import 'package:autowheelapp/showroom/FollowUpScreen.dart';
import 'package:autowheelapp/showroom/Prosepet.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var h, w;

  File? imageFile;
  Future<void> getFromGallery() async {
  final picker = ImagePicker();
  try {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  } catch (e) {
    print('Error picking image: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    // ignore: sized_box_for_whitespace
    return Container(
      // color: AppColor.kGray,
      width: w * 0.75,
      child: Stack(
        children: [
          Container(
            width: w * 0.7,
            height: h * 1,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                GestureDetector(
                    child: Container(
                  height: 100,
                  color: Colors.green.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Center(
                          child: InkWell(
                            onTap: () {
                              getFromGallery();
                            },
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: imageFile == null
                                  ? const AssetImage("assets/17.png",
                                      package: "")
                                  : Image.file(imageFile!).image,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "My Company",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                )),
                SizedBox(
                  height: h * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    dense: true,
                    title: Row(
                      children: [
                        SizedBox(
                          width: w * 0.01,
                        ),
                        const Text("Dashbord",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.kWhite)),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MastersScreen()));
                  },
                  child: ListTile(
                    dense: true,
                    title: Row(
                      children: [
                        SizedBox(
                          width: w * 0.01,
                        ),
                        const Text(
                          "Masters",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => PurchaseInvoiceScreen());
                  },
                  child: ListTile(
                    dense: true,
                    title: Row(
                      children: [
                        SizedBox(
                          width: w * 0.01,
                        ),
                        const Text(
                          "Purchase",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                addVerticalSpace(h * 0.01),
                GestureDetector(
                  onTap: () {
                    Get.to(SearvicemasterScreen());
                  },
                  child: ListTile(
                    dense: true,
                    title: Row(
                      children: [
                        SizedBox(
                          width: w * 0.01,
                        ),
                        const Text(
                          "Service",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.kWhite),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right_rounded,
                        size: 18, color: AppColor.kWhite),
                  ),
                ),
                addVerticalSpace(h * 0.01),
                GestureDetector(
                  onTap: () {
                    Get.to(ReportScreen());
                  },
                  child: ListTile(
                    dense: true,
                    title: Row(
                      children: [
                        SizedBox(
                          width: w * 0.01,
                        ),
                        const Text(" Account Reports",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.kWhite)),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(billReoprtScreen());
                  },
                  child: ListTile(
                    dense: true,
                    title: Row(
                      children: [
                        SizedBox(
                          width: w * 0.01,
                        ),
                        const Text(" Reports",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.kWhite)),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                addVerticalSpace(10),
                GestureDetector(
                  onTap: () {
                    // Get.to(billReoprtScreen());
                    showPopupMenu(context);
                  },
                  child: ListTile(
                    dense: true,
                    title: Row(
                      children: [
                        SizedBox(
                          width: w * 0.01,
                        ),
                        const Text(" Crm",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.kWhite)),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(SignupScreen());
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: h * 0.07),
                        height: h * 0.06,
                        width: w * 0.63,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFF38B7FF), Color(0xFF276D94)]),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Text(
                          "Logout",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showPopupMenu(BuildContext context) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          overlay.localToGlobal(overlay.size.bottomLeft(Offset.zero)),
          overlay.localToGlobal(overlay.size.bottomRight(Offset.zero)),
        ),
        Offset.zero & overlay.size,
      ),
      items: [
        PopupMenuItem(
          child: Text('Prospect'),
          onTap: () {
            Get.to(ProsepetScreen());
          },
        ),
        PopupMenuItem(
          child: Text('Follow Up'),
          onTap: () {
              Get.to(FollowUpScreen());
            // Implement call action
          },
        ),
      ],
    );
  }
}
