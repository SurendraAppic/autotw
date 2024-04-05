// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:autowheelapp/screen/Intro/Businesstype3.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:autowheelapp/utils/color/Appcolor.dart';

class BusinessType2 extends StatefulWidget {
  const BusinessType2({
    Key? key,
  }) : super(key: key);

  @override
  State<BusinessType2> createState() => _BusinessType2State();
}

String Model = "Tax Type";
List Name = ['Tex Type', 'black', 'red', 'green', "ambar", "gray", "yellow"];
String Model1 = "Bank Details";
List Name1 = [
  'Bank Details',
  'black',
  'red',
  'green',
  "ambar",
  "gray",
  "yellow"
];

GlobalKey<FormState> _formKey = GlobalKey<FormState>();
var h, w;

class _BusinessType2State extends State<BusinessType2> {
  TextEditingController BusinessnameController = TextEditingController();
  TextEditingController PhoneNumbarController = TextEditingController();
  TextEditingController Email1Controller = TextEditingController();
  TextEditingController BussinessaddresssController = TextEditingController();
  TextEditingController WebsiteController = TextEditingController();
  TextEditingController GstController = TextEditingController();
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
  );
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Business"),
        leading: BackButton(color: AppColor.kBlack),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  addVerticalSpace(10),
                  textformfiles(BusinessnameController,
                      prefixIcon: Icon(
                        Icons.add_business,
                      ),
                      labelText: "Business Name"),
                  addVerticalSpace(10),
                  textformfiles(PhoneNumbarController,
                      keyboardType: TextInputType.number,
                      prefixIcon: Icon(
                        Icons.phone,
                      ),
                      labelText: "Phone Number"),
                  addVerticalSpace(10),
                  textformfiles(Email1Controller,
                      prefixIcon: Icon(
                        Icons.email,
                        // ignore: body_might_complete_normally_nullable
                      ), validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter is email';
                    } else if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                  }, labelText: "Email"),
                  addVerticalSpace(10),
                  // Container(
                  //   padding: const EdgeInsets.all(8),
                  //   // margin: const EdgeInsets.only(right: 10),
                  //   height: 50,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.black, width: 2),
                  //       borderRadius: BorderRadius.circular(5)),
                  //   child: DropdownButton(
                  //     underline: Container(),
                  //     value: Model,
                  //     dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                  //     icon: Icon(Icons.keyboard_arrow_down_outlined,
                  //         size: h * 0.030, color: AppColor.kBlack),
                  //     isExpanded: true,
                  //     items: Name.map((value) {
                  //       return DropdownMenuItem(
                  //         value: value,
                  //         child: Text(
                  //           value,
                  //         ),
                  //       );
                  //     }).toList(),
                  //     onChanged: (value) {
                  //       setState(() {
                  //         Model = value.toString();
                  //       });
                  //     },
                  //   ),
                  // ),
                  addVerticalSpace(30),
                  Text(
                    "Additional details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  addVerticalSpace(10),
                  textformfiles(BussinessaddresssController,
                      prefixIcon: Icon(
                        Icons.add_business,
                      ),
                      labelText: "Business Address"),
                  addVerticalSpace(10),
                  textformfiles(WebsiteController,
                      prefixIcon: Icon(
                        Icons.web,
                      ),
                      labelText: "Website"),
                  addVerticalSpace(10),
                  textformfiles(GstController,
                      prefixIcon: Icon(
                        Icons.tungsten,
                      ),
                      labelText: "Gst no."),
                  addVerticalSpace(10),
                  // Container(
                  //   padding: const EdgeInsets.all(8),
                  //   // margin: const EdgeInsets.only(right: 10),
                  //   height: 50,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.black, width: 2),
                  //       borderRadius: BorderRadius.circular(5)),
                  //   child: DropdownButton(
                  //     underline: Container(),
                  //     value: Model1,
                  //     dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                  //     icon: Icon(Icons.keyboard_arrow_down_outlined,
                  //         size: h * 0.030, color: AppColor.kBlack),
                  //     isExpanded: true,
                  //     items: Name1.map((value) {
                  //       return DropdownMenuItem(
                  //         value: value,
                  //         child: Text(
                  //           value,
                  //         ),
                  //       );
                  //     }).toList(),
                  //     onChanged: (value) {
                  //       setState(() {
                  //         Model1 = value.toString();
                  //       });
                  //     },
                  //   ),
                  // ),
                  addVerticalSpace(30),
                  InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Get.to(Business3Screen(
                            email: Email1Controller.text,
                          ));
                        }
                      },
                      child: Button("Save Details")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
