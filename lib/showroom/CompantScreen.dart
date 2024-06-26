// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_label, non_constant_identifier_names
import 'dart:convert';
import 'dart:io';
import 'package:autowheelapp/screen/Intro/Login_screen.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/widget/Textfid.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../../models/CompanyResponse.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});
  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}
class _CompanyScreenState extends State<CompanyScreen> {
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  final _formKey = GlobalKey<FormState>();
  CompanyResponse? modalData;
  final String authToken =
      'b7747e5f28d03ce0c5f0bb1ba3ee4d4e90906a55417b232e1218c670bbea3850f65892d18256845b8c372cc8d2b233675334ee6df0d873e85976627e458ee04c51f81f9cc3b9b34641265c2454a2fcf1baced9009e7f3be35158808e9ce2bdbbcb098497ff3e6325b28bff4ec575d073f1e6af0c4acada63';
  final BusinessName = TextEditingController();
  final gstController = TextEditingController();
  final DescriptionController = TextEditingController();
  final AddressController = TextEditingController();
  final StdController = TextEditingController();
  final PinCodeController = TextEditingController();
  File? imageFile;
  bool Blur = false;
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

  
  var show = false;
  @override
  void initState() {
    super.initState();
  }
  var _switchValue = true;
  bool index = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 36,
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                // Handle the selected menu item here
                if (value == 'about') {
                  // Show About dialog
                  showAboutDialog(
                    context: context,
                    applicationName: 'AutoWheel App',
                    applicationVersion: '1.0.0',
                    applicationIcon: Icon(Icons.info),
                    applicationLegalese: '© 2023 Modern Soft. Company',
                  );
                } else if (value == 'help') {
                  // Navigate to the Help screen or show a help dialog
                  // Replace the code below with your logic for showing help.
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Help'),
                        content: Text('This is the help content.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'about',
                    child: Text('About'),
                  ),
                  PopupMenuItem<String>(
                    value: 'help',
                    child: Text('Help'),
                  ),
                ];
              },
            ),
          ],
          title: Text(
            companymastertxt,
            style: compoanystyal,
          ),
          leading: BackButton(
            color: AppColor.kBlack,
          ),
          backgroundColor: AppColor.kGreen),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      getFromGallery();
                    },
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: imageFile == null
                          ? const AssetImage("assets/gallery-export.png",
                              package: "")
                          : Image.file(imageFile!).image,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    Logotxt,
                    style: compoanystyal,
                  ),
                ),
                addVerticalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // mainAxisAlignment: man,
                  children: [
                    // addhorizontalSpace(200),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(gsttxt, style: gststayl),
                    ),
                    Container(
                      // margin: EdgeInsets.all(3),
                      height: 30,
                      width: 89,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(blurRadius: 2, color: AppColor.kGray)
                          ],
                          color: AppColor.kWhite,
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isshow = !isshow;
                              });
                            },
                            child: Container(
                              height: 38,
                              width: 45,
                              decoration: BoxDecoration(
                                color: isshow
                                    ? AppColor.kBlack
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                  child: Text(
                                "On",
                                style: TextStyle(
                                  color: isshow ? Colors.white : Colors.black,
                                ),
                              )),
                            ),
                          ),
                          addhorizontalSpace(2),
                          Center(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isshow = !isshow;
                                });
                              },
                              child: Container(
                                height: 38,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: isshow
                                      ? Colors.transparent
                                      : Colors.black,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Center(
                                    child: Text(
                                  "off",
                                  style: TextStyle(
                                    color: isshow ? Colors.black : Colors.white,
                                  ),
                                )),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    Image.asset(
                      "assets/download.png",
                      height: 30,
                    ),
                    addhorizontalSpace(5),
                    Expanded(
                      child: TextFormField(
                        // ignore: body_might_complete_normally_nullable
                        validator: (e) {
                          if (e!.isEmpty) {
                            return 'Please enter some Gst no..';
                          }
                        },
                        controller: gstController,
                        textInputAction: TextInputAction.done,
                        onChanged: (value) {
                          if (value.length == 15) {
                            companyData(value);
                            print(value);
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'GST No.',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            contentPadding: EdgeInsets.all(5),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.red),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2),
                            )
                            ),
                      ),
                    ),
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    Icon(
                      Icons.business,
                      color: AppColor.kBlack,
                    ),

                    //

                    addhorizontalSpace(8),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          // ignore: body_might_complete_normally_nullable
                          validator: (e) {
                            if (e!.isEmpty) {
                              return 'Please enter some Business Name';
                            }
                          },
                          controller: gstController,
                          textInputAction: TextInputAction.done,
                          onChanged: (value) {
                            if (value.length == 15) {
                              companyData(value);
                              print(value);
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'Business Name',
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
                              contentPadding: EdgeInsets.all(5),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2.0, color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2.0, color: Colors.black),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2.0, color: Colors.red),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2),
                              )

                              // border: OutlineInputBorder(),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    Icon(
                      Icons.description,
                      color: AppColor.kBlack,
                    ),
                    addhorizontalSpace(8),
                    Expanded(
                      child: SizedBox(
                          width: double.infinity,
                          child: textfild("Description")),
                    ),
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: AppColor.kGreen,
                    ),
                    addhorizontalSpace(8),
                    Expanded(
                        child: SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter an email address";
                          }
                          // Define a regular expression pattern for email validation
                          final pattern =
                              r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
                          final regExp = RegExp(pattern);

                          if (!regExp.hasMatch(value)) {
                            return "Please enter a valid email Id";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          counterText: "",
                          labelText: "Email",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          contentPadding: EdgeInsets.all(5),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.black),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.red),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.phone_android,
                      color: AppColor.kBlack,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: PinCodeController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.red),
                            ),
                            labelText: "Mobile No.",
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            contentPadding: EdgeInsets.all(5),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                    ),
                    addhorizontalSpace(8),
                    Expanded(
                      child: SizedBox(
                          width: double.infinity, child: textfild("Phone No.")),
                    ),
                  ],
                ),
                addVerticalSpace(10),
                CSCPicker(
                  showStates: true,
                  showCities: true,
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                      )),
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      // color: Colors.grey.shade300,
                      border: Border.all(
                        width: 2,
                        color: AppColor.kBlack,
                      )),
                  countryDropdownLabel: "Select Country",
                  stateDropdownLabel: " Select State",
                  cityDropdownLabel: " Select City",
                  selectedItemStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  dropdownHeadingStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  dropdownItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  dropdownDialogRadius: 10.0,
                  searchBarRadius: 10.0,
                  onCountryChanged: (value) {
                    setState(() {
                      countrySearchPlaceholder:
                      "$StdController";
                      stateSearchPlaceholder:
                      "$cityValue";
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
                Text(address),
                TextFormField(
                  controller: AddressController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.black),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 5.0, color: Colors.red),
                    ),
                    labelText: 'Address ',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    contentPadding: EdgeInsets.all(5),
                    border: OutlineInputBorder(),
                  ),
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: PinCodeController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.black),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 5.0, color: Colors.red),
                          ),
                          labelText: "Pin Code",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          contentPadding: EdgeInsets.all(5),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: StdController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.black),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 5.0, color: Colors.red),
                          ),
                          labelText: "Std code",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          contentPadding: EdgeInsets.all(5),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    )
                  ],
                ),
                addVerticalSpace(10),
                textfild("Tin No."),
                addVerticalSpace(10),
                Row(
                  children: [
                    Expanded(child: textfild('Dealer Code')),
                    addVerticalSpace(10),
                    // addVerticalSpace(10),
                    addhorizontalSpace(10),
                    Expanded(
                        child: textfild(
                      Jurisdictiontxt,
                    )
                       
                        ),
                  ],
                ),
                addVerticalSpace(10),
                InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (_switchValue) {
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Switch must be enabled to proceed.'),
                            ),
                          );
                        }
                      }
                    },
                    child: InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) ;
                        },
                        child: Button(savetxt))),
                addVerticalSpace(10),
                InkWell(onTap: () {}, child: redButton(delettxt)),
                addVerticalSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> companyData(value) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://www.fynamics.co.in/api/gst/search-taxpayer/TP/$value',
        ),
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      );
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        // itemData = res;
        if (res is Map<String, dynamic>) {
          modalData = CompanyResponse.fromJson(res);
          BusinessName.text = modalData!.tradeNam.toString();
          AddressController.text = modalData!.pradr.addr.st.toString();
          PinCodeController.text = modalData!.pradr.addr.pncd.toString();
          setState(() {});
          print("AAAA==>>==>>   ${modalData!.lgnm}");
        }
      } else {
        print(response.body);
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  TextFormField textfild(
    String? labelText,
  ) {
    return TextFormField(
      // controller: controller,
      textCapitalization: TextCapitalization.words,

      textInputAction: TextInputAction.done,
      // onChanged: (value) {},
      decoration: InputDecoration(
          counterText: "",
          labelText: labelText,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          contentPadding: EdgeInsets.all(5),
          // border: OutlineInputBorder(),
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
          )),
    );
  }
}
