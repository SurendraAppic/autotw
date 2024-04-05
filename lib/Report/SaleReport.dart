// ignore_for_file: unused_import, unused_local_variable

import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

TextEditingController datepickar1 = TextEditingController(
  text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
);
TextEditingController datepickar2 = TextEditingController(
  text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
);

class _ReportScreenState extends State<ReportScreen> {
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
          "Date by summary",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 5,
        backgroundColor: AppColor.kGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    controller: datepickar1,
                    decoration: InputDecoration(
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(width: 2.0, color: Colors.black),
                      // ),
                      // focusedBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(width: 2.0, color: Colors.black),
                      // ),
                      // errorBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(width: 5.0, color: Colors.red),
                      // ),
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
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(width: 2.0, color: Colors.black),
                      // ),
                      // focusedBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(width: 2.0, color: Colors.black),
                      // ),
                      // errorBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(width: 5.0, color: Colors.red),
                      // ),
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
            SizedBox(height: 10), // Add vertical spacing here
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColor.kWhite,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            color: AppColor.kGray,
                          ),
                        ]
                        // ... your container decoration properties
                        ),
                    child: Column(
                      children: [
                        Text("Totle Sale"),
                        addVerticalSpace(2),
                        Text("0.00"),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10), // Add spacing here
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColor.kWhite,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            color: AppColor.kGray,
                          ),
                        ]
                        // ... your container decoration properties
                        ),
                    child: Column(
                      children: [
                        Text("Balance Due"),
                        addVerticalSpace(2),
                        Text("0.00"),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10), // Add spacing here
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColor.kWhite,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            color: AppColor.kGray,
                          ),
                        ]
                        // ... your container decoration properties
                        ),
                    child: Column(
                      children: [
                        Text("Gst"),
                        addVerticalSpace(2),
                        Text("0.00"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10), // Add vertical spacing here
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
          ],
        ),
      ),
    );
  }
}
