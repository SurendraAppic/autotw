// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors, duplicate_ignore, body_might_complete_normally_nullable, unnecessary_string_interpolations, unused_element
import 'package:autowheelapp/screen/master/Staffmaster2.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:autowheelapp/utils/image/image.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class LoctionMaster extends StatefulWidget {
  const LoctionMaster({super.key});
  @override
  State<LoctionMaster> createState() => _LoctionMasterState();
}

String city = "State";
String countryValue = "";
String stateValue = "";
String cityValue = "";
String address = "";
bool isSearchMode = false;

class _LoctionMasterState extends State<LoctionMaster> {
  var namecontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();
  var refcon = TextEditingController();
  var groupcon = TextEditingController();
  var phonecon = TextEditingController();
  var addresscon = TextEditingController();
  var addresscon1 = TextEditingController();
  // var gst = TextEditingController();
  var Statecontroller = TextEditingController();
  var pincontroller = TextEditingController();
  var stdcontroller = TextEditingController();
  var h, w;
  String city = "State";
  List City = [
    "State",
  ];
     Future<void> postLocation() async {
    final url = Uri.parse('http://lms.muepetro.com/api/UserController1/PostLocation');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "ID": 1000,
        "Lic_No": 1000,
        "Location_Name": namecontroller.text.toString(),
        "Description": "Description2",
        "Address1": addresscon1.text.toString(),
        "Address2": addresscon.text.toString(),
        "City_Name": "City_Name",
        "District_Name": "District_Name",
        "State_Name": Statecontroller.text.toString(),
        "Pin_Code": pincontroller.text.toString(),
        "Std_Code": stdcontroller.text.toString(),
        "Contact_No": "Contact_No",
        "BEmailId": "BEmailId",
        "BGSTINNO": "BGSTINNO",
        "BLogoPath": "BLogoPath",
        "BLogo": "BLogo",
        "BJuridiction": "BJuridiction",
        "BDealerCode": "BDealerCode"
      }),
    );

    if (response.statusCode == 200) {
      // Handle success
      print('Location posted successfully');
    } else {
      // Handle errors
      print('Failed to post location: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 36,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 82, 198, 86),
        elevation: 5,
        title: textcostam(Locationtxt, 22, AppColor.kBlack),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Get.to(Staff_master2());
              },
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Form(
              key: formkey,
              child: Column(
                children: [
                  addVerticalSpace(10),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Location Name*";
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.red),
                      ),
                      labelText: "Location Name",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      contentPadding: EdgeInsets.all(5),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  addVerticalSpace(10),
                  textformfiles(refcon,
                      validator: (value) {},
                      label: textcostam(LocationReftxt, 16, AppColor.kBlack),
                      prefixIcon: Icon(Icons.location_on)),
                  addVerticalSpace(10),
                  textformfiles(groupcon,
                      validator: (value) {},
                      label: textcostam(grouptxt, 16, AppColor.kBlack),
                      prefixIcon: Icon(Icons.group)),
                  addVerticalSpace(10),
                  textformfiles(phonecon,
                      validator: (value) {},
                      label: textcostam(Contacttxt, 16, AppColor.kBlack),
                      prefixIcon: Icon(Icons.phone),
                      keyboardType: TextInputType.number,
                      maxLength: 10),
                  addVerticalSpace(10),
                  TextFormField(
                    validator: (e) {},
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          gstimg,
                          height: 20,
                        ),
                      ),
                      labelText: 'GST No.(Optional)',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      contentPadding: EdgeInsets.all(5),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 5.0, color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 5),

                        // border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  addVerticalSpace(10),
                  textformfiles(addresscon,
                      validator: (value) {},
                      label: textcostam(addresstxt, 16, AppColor.kBlack),
                      prefixIcon: Icon(Icons.home)),
                  addVerticalSpace(10),
                  textformfiles(
                    addresscon1,
                    validator: (value) {},
                    label: textcostam(addresslinetxt, 16, AppColor.kBlack),
                  ),
                  addVerticalSpace(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CSCPicker(
                        showStates: true,
                        showCities: true,
                        dropdownDecoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 2)),
                        disabledDropdownDecoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 2)),
                        countryDropdownLabel: "Select Country *",
                        stateDropdownLabel: " Select State *",
                        cityDropdownLabel: " Select City *",
                        selectedItemStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        dropdownHeadingStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        dropdownItemStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                        dropdownDialogRadius: 10.0,
                        searchBarRadius: 10.0,
                        onCountryChanged: (value) {
                          setState(() {
                            // ignore: unused_label
                            countrySearchPlaceholder:
                            "$cityValue";
                            // ignore: unused_label
                            stateSearchPlaceholder:
                            "$cityValue";
                            // ignore: unused_label
                            citySearchPlaceholder:
                            "City";

                            countryValue = value;
                          });
                        },
                        onStateChanged: (value) {
                          setState(() {
                            stateValue = "$stateValue";
                          });
                        },
                        onCityChanged: (value) {
                          setState(() {
                            cityValue = "$countryValue";
                          });
                        },
                      ),
                    ],
                  ),
                  addVerticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: textformfiles(pincontroller, validator: (value) {
                          return null;
                        },
                            label: textcostam(pincodetxt, 16, AppColor.kBlack),
                            keyboardType: TextInputType.number),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: textformfiles(stdcontroller, validator: (value) {
                          return null;
                        },
                            label: textcostam(stdcodetxt, 16, AppColor.kBlack),
                            keyboardType: TextInputType.number),
                      )
                    ],
                  ),
                  addVerticalSpace(20),
                  GestureDetector(
                    onTap: () {
                      if (formkey.currentState!.validate()) ;
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xFF59B8BE),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                          child: Text(
                        savetxt,
                        style: TextStyle(
                          color: AppColor.kWhite,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
