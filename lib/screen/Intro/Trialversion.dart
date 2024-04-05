// ignore_for_file: public_member_api_docs, sort_constructors_first, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:autowheelapp/screen/Intro/showRoomWorkshop.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/image/image.dart';

class Trialvarsoin extends StatefulWidget {
  final String email;
  final String password;
  const Trialvarsoin({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);
  @override
  State<Trialvarsoin> createState() => _TrialvarsoinState();
}

var h, w;
final formkey = GlobalKey<FormState>();

class _TrialvarsoinState extends State<Trialvarsoin> {
  TextEditingController licenseController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isCheck = false;

  // ignore: unused_element
  _loadPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedPassword = prefs.getString('password');

    if (savedPassword != null) {
      setState(() {
        passwordController.text = savedPassword;
      });
    }
  }

  // ignore: unused_element
  _savePassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('password', passwordController.text);
  }

  @override
  void initState() {
    super.initState();
    licenseController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Image.asset(autoimg),
              // addVerticalSpace(100),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        liscance,
                        height: 70,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: w * 0.8,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: licenseController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter License No';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: ' Enter Email',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        passwordimg,
                        height: 70,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: w * 0.8,
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {

                     
                        },
                        decoration: InputDecoration(
                          labelText: '   Password',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: h * 0.055),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1,
                      child: SizedBox(
                        width: 40,
                        child: Checkbox(
                          value: isCheck,
                          onChanged: (e) {
                            setState(() {
                              isCheck = !isCheck;
                            });
                          },
                        ),
                      ),
                    ),
                    Text(
                      Remember,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
              ),
              // addVerticalSpace(30),
              InkWell(
                // Get.to(showroomworkshop());
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    if (passwordController.text == widget.password) {
                      Get.to(showroomworkshop());
                    } else {
                                           Get.snackbar(
                        'Error',
                        'Passwords do not match',
                        snackPosition: SnackPosition.TOP,
                        duration: Duration(seconds: 3),
                      );
                    }
                  }
                },
                child: Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xff62BAB5),
                  ),
                  child: Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
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
