// ignore_for_file: unused_import, unused_label, unused_element, body_might_complete_normally_nullable


import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class SttfScreen extends StatefulWidget {
  const SttfScreen({super.key});

  @override
  State<SttfScreen> createState() => _SttfScreenState();
}

String countryValue = "";
String stateValue = "";
String cityValue = "";
String address = "";
String relation = "M/s";
List _relate = ['M/s', 'Mr.', 'Mrs.', "Miss", "Dr."];
String city = "State";
List City = [
  "State",
];
String account = "Staff Designation *";
List _account = [
  "Staff Designation *",
  "CRM",
  "Mechanic ",
  "Work Manager",
  "Work Supervisor",
  "owner"
];

String crm = "Department *";
List _crm = [
  "Department *",
  "Accounts",
  "Bank Office",
  "Sales",
  "Servies",
  "Spase"
];
// ignore: non_constant_identifier_names
String show_room = "Location";
List _showroom = ["Location"];

FocusNode Sofouse = FocusNode();
FocusNode use = FocusNode();
FocusNode billNoFocus = FocusNode();

class _SttfScreenState extends State<SttfScreen> {
  var titlecontroller = TextEditingController();
  var namecontroller = TextEditingController();
  // ignore: non_constant_identifier_names
  var s_ocontroller = TextEditingController();
  var addresscontroller = TextEditingController();
  var districcontroller = TextEditingController();
  var mobilecontroller = TextEditingController();
  var stdcodecontroller = TextEditingController();
  // ignore: non_constant_identifier_names
  var Statecontroller = TextEditingController();
  var pincontroller = TextEditingController();
  var h, w;
  bool isSearchMode = false;
  bool index = true;

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Form(
      key: formkey,
      child: Scaffold(
          appBar: AppBar(
            leading: BackButton(color: AppColor.kBlack),
            toolbarHeight: 36,
            centerTitle: true,
            elevation: 5,
            backgroundColor: const Color.fromARGB(255, 82, 198, 86),
            title: textcostam("Staff Master", 22, AppColor.kBlack),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                 
                  },
                  child: const Icon(
                    Icons.search,
                    color: AppColor.kBlack,
                  ),
                ),
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(
                right: w * 0.03, left: w * 0.03, bottom: h * 0.03),
            child: ListView(
              // ignore: prefer_const_constructors
              physics: BouncingScrollPhysics(),
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                    height: h * 0.01,
                  ),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(right: 10),
                          height: 45,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          child: DropdownButton(
                            underline: Container(),
                            value: relation,
                            dropdownColor:
                                const Color.fromARGB(255, 211, 247, 212),
                            icon: Icon(Icons.keyboard_arrow_down_outlined,
                                size: h * 0.030, color: AppColor.kBlack),
                            isExpanded: true,
                            items: _relate.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value,
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                relation = value.toString();
                              });
                            },
                          )),
                      Expanded(
                          child: TextFormField(
                        // onFieldSubmitted: (value) {
                        //   if (Sofouse != null) {
                        //     FocusScope.of(context).requestFocus(Sofouse);
                        //   }
                        // },
                         onFieldSubmitted: (Value) {

                        // ignore: unnecessary_null_comparison
                        if (Sofouse != null) {
                          FocusScope.of(context).requestFocus(Sofouse);
                        }
                      },
                        focusNode: Sofouse,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "plese enter a staff name.";
                          }
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
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
                            prefixIcon: Icon(Icons.person),
                            labelText: "Staff Name*",
                            contentPadding: EdgeInsets.all(5),
                            border: OutlineInputBorder()),
                      )),
                    ],
                  ),
                  addVerticalSpace(10),
                  textformfiles(s_ocontroller,
                      validator: (value) {
                        return null;
                      },
                      label: textcostam("S/O", 16, AppColor.kBlack),
                      focusNode: use,
                      onFieldSubmitted: (Value) {
                        // ignore: unnecessary_null_comparison
                        if (Sofouse != null) {
                          FocusScope.of(context).requestFocus(Sofouse);
                        }
                      }),
                  addVerticalSpace(10),
                  textformfiles(
                    addresscontroller,
                    validator: (value) {
                      return null;
                    },
                    label: textcostam("Phone Number", 16, AppColor.kBlack),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    prefixIcon: Icon(
                      Icons.phone,

                      size: h * 0.024,
                      // Color.fromARGB(255, 36, 137, 39),
                    ),
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
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        dropdownDialogRadius: 10.0,
                        searchBarRadius: 10.0,
                        onCountryChanged: (value) {
                          setState(() {
                            countrySearchPlaceholder:
                            "$cityValue";
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
                    ],
                  ),
                  addVerticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: w * 0.46,
                        child: textformfiles(pincontroller, validator: (value) {
                          return null;
                        },
                            label: textcostam("Pin Code", 16, AppColor.kBlack),
                            keyboardType: TextInputType.number),
                      ),
                      SizedBox(
                        width: w * 0.03,
                      ),
                      SizedBox(
                          width: w * 0.442,
                          child: textformfiles(stdcodecontroller,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                            return null;
                          },
                              label:
                                  textcostam("STD Code", 16, AppColor.kBlack)))
                    ],
                  ),
                  addVerticalSpace(10),
                  textformfiles(mobilecontroller, validator: (value) {
                    return null;
                  },
                      label: textcostam("Address", 16, AppColor.kBlack),
                      prefixIcon: Icon(
                        Icons.home,
                        size: h * 0.024,
                      )),
                  addVerticalSpace(10),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 45,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButton(
                      hint: textcostam("Department**", 18, AppColor.kBlack),
                      underline: Container(),
                      value: crm,
                      dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                      icon: Icon(Icons.keyboard_arrow_down_outlined,
                          size: h * 0.028, color: AppColor.kBlack),
                      isExpanded: true,
                      items: _crm.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          crm = value.toString();
                        });
                      },
                    ),
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
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 45,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButton(
                      underline: Container(),
                      value: show_room,
                      dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                      icon: Icon(Icons.keyboard_arrow_down_outlined,
                          size: h * 0.028, color: AppColor.kBlack),
                      isExpanded: true,
                      items: _showroom.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: AppColor.kGray,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 0.1,
                              ),
                              Text(value,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          show_room = value.toString();
                        });
                      },
                    ),
                  ),
                  addVerticalSpace(10),
                  InkWell(
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          validation();
                        }

                        //
                      },
                      child: Button(savetxt)),
                ]),
              ],
            ),
          )),
    );
  }

  void validation() {
    if (crm != "--Select--") {
      if (account == "Staff Designation *") {
        Get.snackbar("Please select a Staff Designation", "error");
      }
    } else {
      Get.snackbar("Please select a Department", "error");
    }
  }
}
