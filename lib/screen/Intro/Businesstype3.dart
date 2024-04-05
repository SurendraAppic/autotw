import 'package:autowheelapp/screen/Intro/Resatpassword.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';

import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Business3Screen extends StatefulWidget {
  final String email;
  const Business3Screen({super.key, required this.email});
  @override
  State<Business3Screen> createState() => _Business3ScreenState();
}

TextEditingController OwenerController = TextEditingController();
TextEditingController phonecontroller = TextEditingController();
TextEditingController email1controller = TextEditingController();
TextEditingController addresscontroller = TextEditingController();
final _formKey = GlobalKey<FormState>();



class _Business3ScreenState extends State<Business3Screen> {
  @override
  void initState() {
    super.initState();
    email1controller.text = widget.email;
    debugPrint(widget.email.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business Type"),
        leading: BackButton(color: AppColor.kBlack),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textformfiles(OwenerController, validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the owner name';
                    }
                    return null;
                  },
                      prefixIcon: Icon(
                        Icons.manage_accounts,
                      ),
                      labelText: "Owner Name"),
                  addVerticalSpace(10),
                  textformfiles(phonecontroller,
                      keyboardType: TextInputType.number,
                      prefixIcon: Icon(
                        Icons.phone,
                      ),
                      labelText: "Phone Number"),
                  addVerticalSpace(10),
                  textformfiles(email1controller,
                      prefixIcon: Icon(
                        Icons.alternate_email,
                      ),
                      labelText: "xyz@gmail.com"),
                  addVerticalSpace(10),
                  Text(
                    "Additional details",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  addVerticalSpace(10),
                  textformfiles(addresscontroller,
                      prefixIcon: Icon(
                        Icons.add_business,
                      ),
                      labelText: "Business Address"),
                  addVerticalSpace(20),
                  InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Get.to(ConfirmpasswordScreen(
                            email: email1controller.text,
                          ));
                        }
                      },
                      child: Button("Save Details"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
