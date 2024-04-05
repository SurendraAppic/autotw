// ignore_for_file: unused_local_variable

import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PurchasoderScreen extends StatefulWidget {
  const PurchasoderScreen({super.key});

  @override
  State<PurchasoderScreen> createState() => _PurchasoderScreenState();
}

class _PurchasoderScreenState extends State<PurchasoderScreen> {
  TextEditingController datepickar1 = TextEditingController(
    text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
  );
  String customer = "Ladger Name";
  List drop = [
    'Ladger Name',
    'black',
    'red',
    'green',
    "ambar",
    "gray",
    "yellow"
  ];
  String customer1 = "Part no";
  List drop1 = ['Part no', 'black', 'red', 'green', "ambar", "gray", "yellow"];

  String customer3 = "part Catagary";
  List drop3 = [
    'part Catagary',
    'red',
    'red',
    'green',
    "ambar",
    "gray",
    "yellow"
  ];
  String customer4 = "Oeder Type";
  List drop4 = ['Oeder Type', 'red', 'red', 'green', "ambar", "gray", "yellow"];
  var job = true;
  var h, w;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                color: AppColor.kBlack,
              ),
            )
          ],
          leading: BackButton(color: AppColor.kBlack),
          centerTitle: true,
          toolbarHeight: 40,
          title: Text(
            "Purchas Order",
            style:
                TextStyle(color: AppColor.kBlack, fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppColor.kappabrcolr,
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                  readOnly: true,
                  controller: datepickar1,
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
                      prefixIcon: Icon(
                        Icons.edit_calendar,
                        color: AppColor.kBlack,
                      ),
                      contentPadding: EdgeInsets.all(5),
                      labelText: datetxt,
                      helperStyle: TextStyle(fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  onTap: () async {
                    DateTime date = DateTime(1900);
                    FocusScope.of(context).requestFocus(FocusNode());
                    await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now())
                        .then((selectedDate) {
                      if (selectedDate != null) {
                        datepickar1.text =
                            DateFormat('dd-MM-yyyy').format(selectedDate);
                      }
                    });
                  }),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          job = true;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: job ? Color(0xff83c5be) : AppColor.kBlack,
                              width: 2),
                          borderRadius: BorderRadius.circular(25),
                          color: job
                              ? Color(0xff83c5be)
                              : Color(
                                  0x00000000), // Add background color for selected item
                        ),
                        child: Center(
                            child: Text(
                          "Part",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: job
                                ? Colors.white
                                : AppColor
                                    .kBlack, // Change text color based on selection
                          ),
                        )),
                      ),
                    ),
                  ),
                  addhorizontalSpace(10),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          job = false; // Set 'job' to false to select "Job".
                        });
                      },
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: !job ? Color(0xff83c5be) : Colors.black,
                              width: 2),
                          color: !job
                              ? Color(0xff83c5be)
                              : Colors
                                  .transparent, // Add background color for selected item
                        ),
                        child: Center(
                            child: Text(
                          "Part Name",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: !job
                                ? Colors.white
                                : AppColor
                                    .kBlack, // Change text color based on selection
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      // margin: const EdgeInsets.only(right: 10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton(
                        underline: Container(),
                        value: customer1,
                        dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                        icon: Icon(Icons.keyboard_arrow_down_outlined,
                            size: h * 0.030, color: AppColor.kBlack),
                        isExpanded: true,
                        items: drop1.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            customer1 = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  addhorizontalSpace(10),
                  SizedBox(
                    width: 50,
                    child: InkWell(
                      onTap: () {
                        // Get.to(AddCustomerflotScreen());
                      },
                      child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border.all(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppColor.kBlack,
                          )),
                    ),
                  )
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      // margin: const EdgeInsets.only(right: 10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton(
                        underline: Container(),
                        value: customer,
                        dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                        icon: Icon(Icons.keyboard_arrow_down_outlined,
                            size: h * 0.030, color: AppColor.kBlack),
                        isExpanded: true,
                        items: drop.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            customer = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  addhorizontalSpace(10),
                  SizedBox(
                    width: 50,
                    child: InkWell(
                      onTap: () {
                        // Get.to(AddCustomerflotScreen());
                      },
                      child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border.all(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppColor.kBlack,
                          )),
                    ),
                  )
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      // margin: const EdgeInsets.only(right: 10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton(
                        underline: Container(),
                        value: customer4,
                        dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                        icon: Icon(Icons.keyboard_arrow_down_outlined,
                            size: h * 0.030, color: AppColor.kBlack),
                        isExpanded: true,
                        items: drop4.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            customer4 = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  addhorizontalSpace(10),
                  SizedBox(
                    width: 50,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border.all(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppColor.kBlack,
                          )),
                    ),
                  )
                ],
              ),
              addVerticalSpace(10),
              Button("Save"),
            ],
          ),
        ));
  }
}
