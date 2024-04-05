// ignore_for_file: duplicate_import

import 'package:autowheelapp/screen/Intro/showRoomWorkshop.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:autowheelapp/utils/image/image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Autowheel extends StatefulWidget {
  const Autowheel({Key? key}) : super(key: key);
  @override
  State<Autowheel> createState() => _AutowheelState();
}

var h, w;
final formkey = GlobalKey<FormState>();

class _AutowheelState extends State<Autowheel> {
  TextEditingController licenseController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isCheck = false;

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
              addVerticalSpace(100),
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
                          labelText: '    Enter License No',
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
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
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
              addVerticalSpace(30),
              InkWell(
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    Get.to(showroomworkshop(
                      
                    ));
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
