// ignore_for_file: body_might_complete_normally_nullable

import 'package:autowheelapp/screen/Intro/Business1Screen.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/image/image.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  OtpScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  var phoneOtp;
  var h, w;

  @override
  void initState() {
    super.initState();
    getOtpData();
  }

  getOtpData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    phoneOtp = prefs.getString('saved_otp');
    print("Hello  $phoneOtp");
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        // leading: ,
        automaticallyImplyLeading: false,
        toolbarHeight: 36,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColor.kBlack),
        elevation: 5,
        backgroundColor: const Color.fromARGB(255, 82, 198, 86),
        title: textcostam("Verification", 22, AppColor.kBlack),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Image.asset(
                        enterotp,
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                    ],
                  ),
                ),
                textcostam(
                    "OTP has been sent on your registered \nPhone Number  ${widget.phoneNumber}",
                    14,
                    AppColor.kBlack),
                addVerticalSpace(15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    child: PinCodeTextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp("[0-9]"),
                        ),
                      ],
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "";
                        } else if (value.isNotEmpty) {
                          return null;
                        }
                      },
                      controller: otpController,
                      appContext: context,
                      length: 6,
                      onChanged: (value) {},
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: 55,
                        fieldWidth: 40,
                        activeColor: Color(0XFF5F5F5F),
                        inactiveColor: Color(0XFF5F5F5F),
                        selectedColor: Colors.black,
                        // activeFillColor: Colors.yellow,//Color(0XFF303030),
                        // inactiveFillColor: Colors.blue,
                        errorBorderColor: Colors.red,
                        // selectedFillColor: Colors.white,
                      ),
                      textStyle: TextStyle(color: Color(0XFF5F5F5F)),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: textcostam("Re-send code ", 16, AppColor.kGray)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {
                      if (phoneOtp == otpController.text) {
                        Get.offAll(Business1Screen());
                      } else {
                        Get.snackbar('Error', "Otp dose not match");
                      }
                    },
                    child: Button("Login"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
