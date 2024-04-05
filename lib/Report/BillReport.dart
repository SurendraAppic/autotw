// ignore_for_file: unused_local_variable

import 'package:autowheelapp/Report/SaleReport.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';

class billReoprtScreen extends StatefulWidget {
  const billReoprtScreen({Key? key}) : super(key: key);

  @override
  State<billReoprtScreen> createState() => _billReoprtScreenState();
}

TextEditingController datepickar1 = TextEditingController(
  text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
);
TextEditingController datepickar2 = TextEditingController(
  text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
);

class _billReoprtScreenState extends State<billReoprtScreen> {
  bool filterApplied = false;
  List<bool> isSelectedList = [
    false,
    false,
    false,
    false
  ]; // List to track checkbox states

  void _showFilterBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildFilterRow("Part Vise", 0),
              _buildFilterRow("Labour vise", 1),
              _buildFilterRow("Both", 2),
              _buildFilterRow("Group Vise", 3),
              // Add more filter rows as needed
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterRow(String filterName, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelectedList[index] =
              !isSelectedList[index]; // Toggle checkbox state
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(filterName),
          Checkbox(
            value: isSelectedList[index],
            onChanged: (bool? newValue) {
              setState(() {
                isSelectedList[index] = newValue ?? false;
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.picture_as_pdf,
                  color: AppColor.kBlack,
                ),
                addhorizontalSpace(10),
                Icon(
                  Icons.save,
                  color: AppColor.kBlack,
                )
              ],
            ),
          )
        ],
        leading: BackButton(color: AppColor.kBlack),
        centerTitle: true,
        title: Text(
          "Gst Sale Deatlis",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 5,
        backgroundColor: AppColor.kWhite,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
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
                      labelText: "From",
                      helperStyle: TextStyle(fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onTap: () async {
                      DateTime date = DateTime(1900);
                      FocusScope.of(context).requestFocus(FocusNode());
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      ).then((selectedDate) {
                        if (selectedDate != null) {
                          datepickar1.text =
                              DateFormat('dd-MM-yyyy').format(selectedDate);
                        }
                      });
                    },
                  ),
                ),
                SizedBox(width: 10), // Add spacing here
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    controller: datepickar2,
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
                      labelText: "To",
                      helperStyle: TextStyle(fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onTap: () async {
                      DateTime date = DateTime(1900);
                      FocusScope.of(context).requestFocus(FocusNode());
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      ).then((selectedDate) {
                        if (selectedDate != null) {
                          datepickar2.text =
                              DateFormat('dd-MM-yyyy').format(selectedDate);
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            addVerticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Filters Applied: "),
                GestureDetector(
                  onTap: _showFilterBottomSheet,
                  child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    child: Center(child: Text("Filters")),
                  ),
                ),
              ],
            ),
            addVerticalSpace(10),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColor.kWhite,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      color: AppColor.kGray,
                    ),
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date:    0.0000",
                          style: TextStyle(color: AppColor.kGray),
                        ),
                        Text("Basic:   0.0000")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Ladger Name:   0.0000"),
                        Text("Gst Amt:  0.0000")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Total"), Text("0.00")],
                    ),
                  ),
                ],
              ),
            ),
            addVerticalSpace(20),
            InkWell(
                onTap: () {
                  Get.to(ReportScreen());
                },
                child: Button("Save"))
          ],
        ),
      ),
    );
  }
}
