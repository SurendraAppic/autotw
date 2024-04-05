// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_label, unused_element
// ignore_for_file: unused_import, unnecessary_import
import 'dart:convert';
import 'dart:io';
import 'package:autowheelapp/screen/Intro/OtpScreen.dart';
import 'package:autowheelapp/screen/Intro/RigesterScreen.dart';
import 'package:autowheelapp/utils/image/image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

final formkey = GlobalKey<FormState>();
TextEditingController Mobilecontroller = TextEditingController();
var h, w;
var isshow = false;
GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final FocusNode _focusNode = FocusNode();
bool _isFocused = false;

class _SignupScreenState extends State<SignupScreen> {
  bool color = false;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
          toolbarHeight: 35,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColor.kBlack),
          elevation: 5,
          backgroundColor: const Color.fromARGB(255, 82, 198, 86),
          title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Image.asset(otpimg, fit: BoxFit.cover, height: 350),
                    ],
                  ),
                ),
                textformfiles(Mobilecontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your mobile number.';
                      } else if (value.length < 10) {
                        return 'Mobile number must have at least 10 digits.';
                      }
                      return null;
                    },
                    label: textcostam("Phone Number", 16, AppColor.kBlack),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    prefixIcon: Icon(Icons.phone,
                        size: h * 0.024,
                        color: color ? Colors.blue : Colors.black),
                    onChanged: (e) {
                      setState(() {
                        color = color;
                      });
                    }),
                addVerticalSpace(10),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: InkWell(
                    onTap: () {
                      setState(() {});
                      isshow = !isshow;
                    },
                    child: Row(
                      children: [
                        Align(
                          child: SizedBox(
                            width: 13,
                            child: Checkbox(value: isshow, onChanged: (e) {}),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        textcostam("I agree to the Terms & Conditions", 16,
                            AppColor.kBlack),
                      ],
                    ),
                  ),
                ),
                addVerticalSpace(30),
                InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (isshow) {
                          fetchData();
                        } else {
                          Get.snackbar(
                              "error", "Please accept terms & conditios",
                              backgroundColor: AppColor.kRed);
                        }
                      }
                    },
                    child: Button("Login")),
                addVerticalSpace(40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(googleimg),
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage(facebook),
                      radius: 25,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage(appleimg),
                      radius: 25,
                    )
                  ],
                ),
                addVerticalSpace(h * 0.03),
                InkWell(
                    onTap: () {
                      Get.to(RigisterScreen());
                    },
                    child: Center(
                        child: Text(
                      "Register Account",
                      style: TextStyle(
                          color: AppColor.kBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    )))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    print("1");

    final uri = Uri.parse('http://lms.muepetro.com/api/UserController1/UserOtp')
        .replace(queryParameters: {
      'otpmobileno': "'${Mobilecontroller.text}'",
    });
    print("2");

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("3");

        print('Response Data: $data');
        if (data['result'] == true) {
          Get.snackbar(
            'Success',
            data['message'] ?? 'Success',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          String otp = data['otp'].toString();
          print('OTP: $otp');
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('saved_otp', otp);
          // String otp = data['otp'].toString() ?? '';
          // print('OTP: $otp');
          Get.offAll(OtpScreen(
            phoneNumber: Mobilecontroller.text,
          ));
        } else {
          Get.snackbar(
            'Error',
            data['message'] ?? 'Unknown error',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
