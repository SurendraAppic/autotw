// ignore_for_file: unused_import, body_might_complete_normally_nullable, duplicate_ignore, unused_local_variable

import 'dart:convert';

import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;

class RigisterScreen extends StatefulWidget {
  const RigisterScreen({super.key});

  @override
  State<RigisterScreen> createState() => _RigisterScreenState();
}

TextEditingController Companyname = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController mobile = TextEditingController();
String account = "Catagary*";
List _account = [
  "Catagary*",
  "auto mobile 2wilar /3wilar /4wilar  dealership",
  "tarctor dealership",
  "restaurant",
  "petrol pump",
  "mobile shop",
  "hardware shop",
  "spare parts store",
  "battery store",
  "grocery store",
  "gift store",
  "general store"
  "furniture store",
  "furniture manufacturing",
  "garments store",
  "textile store",
  "bakery & confectionery store",
  "shopping mart",
  "ev dealership",
  "multi brand bike workshop",
  "three wheeler workshop",
  "ev workshop",
  "tyre store",
  "pharmacy & medical store",
  "electronic store",
  "used vehicles",
  "heavy earther moving machinery dealership",
  "tarctor workshop",
  "heavy earther moving machinery workshop",
  "granite and marble business"
];
var h, w;
GlobalKey<FormState> formKey = GlobalKey<FormState>();
class _RigisterScreenState extends State<RigisterScreen> {
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 36,

        centerTitle: true,
        elevation: 2,
        backgroundColor: AppColor.kappabrcolr,

        title: Text(
          "Account",
          style: TextStyle(color: AppColor.kBlack),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                textformfiles(
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "Please enter is Company name";
                    }
                  },
                  Companyname,
                  labelText: "Company name",
                ),
               
                addVerticalSpace(10),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(20),
                    underline: Container(),
                    value: account,
                    dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                    icon: Icon(Icons.keyboard_arrow_down_outlined,
                        size: h * 0.028, color: AppColor.kBlack),
                    isExpanded: true,
                    isDense: true,
                    itemHeight: 50,
                    items: _account.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        account = value.toString();
                      });
                    },
                  ),
                ),
                addVerticalSpace(10),
                textformfiles(
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "Please enter is Email";
                    }
                  },
                  email,
                  labelText: "Email",
                ),
                addVerticalSpace(10),
                textformfiles(
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "Please enter is Mobile numbar";
                    }
                  },
                  mobile,
                  labelText: "Mobile NO",
                ),
                               addVerticalSpace(20),
                InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        localData();
                      }
                    },
                    child: Button("Sign Up"))
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> localData() async {
    try {
      print("1");
      Map<String, dynamic> data = {
        "CompanyName": Companyname.text,
        "BusinessType": 'BusinessType',
        "MOB": mobile.text,
        "MailId": email.text,
        "UserValid": "0"
      };
     String jsonData = json.encode(data);
      final response = await http.post(
        Uri.parse(
            'http://lms.muepetro.com/api/UserController1/UserRegistration'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonData,
      );
      print("2");
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("3");
        print('Response Data: ${response.body}');

        if (responseData['result'] == true) {
          Get.snackbar(
            'Success',
            responseData['message'] ?? 'Success',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            'Error',
            responseData['message'] ?? 'Unknown error',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
        print("4");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
