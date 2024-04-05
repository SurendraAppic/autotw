// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

import 'package:autowheelapp/screen/master/Companymaster.dart';
import 'package:autowheelapp/screen/master/PartmasterScreen.dart';
import 'package:autowheelapp/screen/master/Ledgermaster.dart';
import 'package:autowheelapp/screen/master/LocationMaster.dart';
// ignore: duplicate_import
import 'package:autowheelapp/screen/master/PartmasterScreen.dart';
import 'package:autowheelapp/screen/master/Searvicemaster.dart';
import 'package:autowheelapp/screen/master/StaffMaster.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/widget/Textfid.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';

import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:autowheelapp/utils/image/image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MastersScreen extends StatefulWidget {
  const MastersScreen({super.key});
  @override
  State<MastersScreen> createState() => _MastersScreenState();
}

class _MastersScreenState extends State<MastersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 36,
        centerTitle: true,
        leading: BackButton(color: AppColor.kBlack),
        automaticallyImplyLeading: false,
        title: Text(mastertxt),
        backgroundColor: AppColor.kappabrcolr,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              addVerticalSpace(25),
              ListView(
                shrinkWrap: true,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(PartsMasters());
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColor.kWhite,
                          boxShadow: [
                            BoxShadow(blurRadius: 2, color: AppColor.kGray)
                          ]),
                      child: ListTile(
                        title: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: AppColor.kWhite,
                              ),
                              child: Image.asset(
                                partimage,
                                fit: BoxFit.cover,
                              ),
                            ),
                            addhorizontalSpace(20),
                            Text(partmaster, style: partmasterstyal),
                          ],
                        ),
                      ),
                    ),
                  ),
                  addVerticalSpace(15),
                  InkWell(
                    onTap: () {
                      Get.to(Staff_master());
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              color: Colors.grey,
                            )
                          ]),
                      child: ListTile(
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: AppColor.kWhite,
                              ),
                              child: Center(
                                child: Image.asset(
                                  Stffimage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            addhorizontalSpace(20),
                            Text(
                              staff,
                              style: staffstyal,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  addVerticalSpace(15),
                  InkWell(
                    onTap: () {
                      Get.to(CompanyMasterScreen());
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColor.kWhite,
                          boxShadow: [
                            BoxShadow(blurRadius: 2, color: AppColor.kGray)
                          ]),
                      child: ListTile(
                        title: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: AppColor.kWhite,
                              ),
                              child: Image.asset(
                                comepanyimage,
                                fit: BoxFit.cover,
                              ),
                            ),
                            addhorizontalSpace(20),
                            Text(
                              companymastertext,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  addVerticalSpace(15),
                  InkWell(
                    onTap: () {
                      Get.to(SearvicemasterScreen());
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColor.kWhite,
                          boxShadow: [
                            BoxShadow(blurRadius: 2, color: AppColor.kGray)
                          ]),
                      child: ListTile(
                        title: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: AppColor.kWhite,
                              ),
                              child: Image.asset(
                                serviceimage,
                                fit: BoxFit.cover,
                              ),
                            ),
                            addhorizontalSpace(20),
                            Text(
                              seavicmastertxt,
                              style: searvimasterstyal,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  addVerticalSpace(10),
                  InkWell(
                    onTap: () {
                      Get.to(LoctionMaster());
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              color: Colors.grey,
                            )
                          ]),
                      child: ListTile(
                        title: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: AppColor.kWhite,
                              ),
                              child: Image.asset(
                                Locationimage,
                                fit: BoxFit.cover,
                              ),
                            ),
                            addhorizontalSpace(20),
                            Text(loctionmastertxt, style: searvimasterstyal),
                          ],
                        ),
                      ),
                    ),
                  ),
                  addVerticalSpace(10),
                  InkWell(
                    onTap: () {
                      Get.to(LedgerScreen());
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColor.kWhite,
                          boxShadow: [
                            BoxShadow(blurRadius: 2, color: AppColor.kGray)
                          ]),
                      child: ListTile(
                        title: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: AppColor.kWhite,
                              ),
                              child: Image.asset(
                                Ledgerimage,
                                fit: BoxFit.cover,
                              ),
                            ),
                            addhorizontalSpace(20),
                            Text(
                              ledgurmaster,
                              style: searvimasterstyal,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
