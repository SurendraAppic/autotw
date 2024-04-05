// ignore_for_file: unused_local_variable

import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:flutter/material.dart';

Column completedVaccine(BuildContext context) {
 
  var h, w;
  h = MediaQuery.of(context).size.height;
  w = MediaQuery.of(context).size.height;
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         
        ],
      ),
      Container(
      
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 0,
              spreadRadius: 2,
              color: AppColor.kWhite,
            )
          ],
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Table(
            border: TableBorder.all(
                color: Colors.black,
                width: 1,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
            columnWidths: const <int, TableColumnWidth>{
              1: FixedColumnWidth(100)
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                TableCell(
                  child: Container(
                    height: 42,
                    child: Center(
                      child: Text(
                        "Age",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: AppColor.kBlue,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    child: const Center(
                      child: Text(
                        "Vaccine",
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    child: Center(
                      child: Text(
                        "Brand",
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    child: Center(
                      child: Text(
                        "Date",
                      ),
                    ),
                  ),
                )
              ]),
              for (var i = 0; i < 4; i++) ...[
                TableRow(children: [
                  TableCell(
                      child: Center(
                    child: Text(
                      "1 Year",
                      textAlign: TextAlign.center,
                    ),
                  )),

                  // ignore: prefer_const_constructors
                  TableCell(
                      child: Container(
                    height: 42,
                    child: Center(
                      child: Text(
                        "BCG.",
                      ),
                    ),
                  )),
                  TableCell(
                      child: Center(
                    child: Text(
                      "Tubervac",
                    ),
                  )),

                  TableCell(
                      child: Center(
                    child: Text(
                      "21 Nov 2020",
                    ),
                  )),
                ])
              ]
            ],
          ),
        ),
      ),
      // SizedBox(
      //   height: h * 0.03,
      // ),
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //   "Personal Details",
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //     context,
                //     // MaterialPageRoute(
                //     //     builder: (context) =>
                //     //         Namechild())
                //     // );
                //   },
                //   // child: SvgPicture.asset(
                //   //     "assets/Icon awesome-edit.svg")
                // ),
              ],
            ),
            // SizedBox(
            //   height: h * 0.005,
            // ),
            // Divider(
            //   thickness: 1,
            //   color: AppColor.kBlue,
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Column(
            //     children: [
            // personaldetailrow(
            //     txt: "Name", tttxt: "David"),
            // personaldetailrow(txt: "Age", tttxt: " Months"),
            // personaldetailrow(
            //     txt: "Gender", tttxt: "Male"),
            // personaldetailrow(
            //     txt: "Country", tttxt: "21/02/2022"),
            // personaldetailrow(
            //     txt: "Country", tttxt: "21/02/2022"),
            // personaldetailrow(
            //     txt: "Mother’s Name", tttxt: "Kate"),
            // personaldetailrow(txt: "Email", tttxt: "com"),
            // personaldetailrow(txt: "Mobile", tttxt: "+97-"),
            // personaldetailrow(
            //     txt: "Father’s Name", tttxt: "Alex"),
            // personaldetailrow(txt: "Email", tttxt: ".com"),
            // personaldetailrow(
            //     txt: "Mobile", tttxt: "+97-8233801425"),
            //     ],
            //   ),
            // )
          ])
    ],
  );
}

class personaldetailrow extends StatelessWidget {
  const personaldetailrow({required this.tttxt, required this.txt, super.key});
  final String txt;
  final String tttxt;
  @override
  Widget build(BuildContext context) {
    // h = MediaQuery.of(context).size.height;
    // w = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txt,
        ),
        Container(
          width: 200, // You can adjust the width as needed
          child: Text(
            tttxt,
            textAlign: TextAlign.end,
          ),
        )
      ],
    );
  }
}
