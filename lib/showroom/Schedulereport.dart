// ignore_for_file: unused_import, duplicate_import, unnecessary_import, unused_local_variable, duplicate_ignore

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:autowheelapp/screen/master/PurchaseInvoice.dart';
import 'package:autowheelapp/showroom/FollowUpScreen.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/widget/Textfid.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:get/get.dart';
import 'package:autowheelapp/models/Datevisemodel.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:excel/excel.dart';
class Schedulereport extends StatefulWidget {
  const Schedulereport({
    Key? key,
  }) : super(key: key);

  @override
  State<Schedulereport> createState() => _SchedulereportState();
}

class _SchedulereportState extends State<Schedulereport> {
  List<dynamic> dateList = [];

  TextEditingController datepickar1 = TextEditingController(
    text: DateFormat('yyyy-MM-dd').format(DateTime.now()),
  );
  TextEditingController datepickar2 = TextEditingController(
    text: DateFormat('yyyy-MM-dd').format(DateTime.now()),
  );
  int selectedId3 = 0;
  var loctionid;
  List<Map<String, dynamic>> Loctionshow = [];
  @override
  void initState() {
    super.initState();
    loction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
                onTap: () {},
                child: Icon(
                  Icons.text_snippet,
                  color: AppColor.kBlack,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.picture_as_pdf, color: AppColor.kBlack),
                onPressed: () async {
                  generatePDF();
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text('PDF generated successfully'),
                  //   ),
                  // );
                },
              ),
            )
          ],
          centerTitle: true,
          leading: BackButton(
            color: AppColor.kBlack,
          ),
          backgroundColor: AppColor.kGreen,
          title: Text('Schedule Report'),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54, width: 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButton(
                      underline: Container(),
                      value: selectedId3,
                      dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: MediaQuery.of(context).size.height * 0.030,
                        color: Colors.black,
                      ),
                      isExpanded: true,
                      items: Loctionshow.map((value) {
                        return DropdownMenuItem(
                          value: value['id'],
                          child: Text(
                            '${value['id']} -${value['location_Name']}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedId3 = value as int;
                          loctionid = selectedId3;
                        });
                      },
                    ),
                  ),
                  addVerticalSpace(10),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          controller: datepickar1,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            hintText: jobouttxt,
                            prefixIcon: Icon(
                              Icons.edit_calendar,
                              color: AppColor.kBlack,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            labelText: "From Date",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () async {
                            DateTime date = DateTime(1900);
                            FocusScope.of(context).requestFocus(FocusNode());
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now().add(Duration(days: 365)),
                            ).then((selectedDate) {
                              if (selectedDate != null) {
                                datepickar1.text = DateFormat('yyyy-MM-dd')
                                    .format(selectedDate);
                              }
                            });
                          },
                        ),
                      ),
                      addhorizontalSpace(10),
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          controller: datepickar2,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            hintText: jobouttxt,
                            prefixIcon: Icon(
                              Icons.edit_calendar,
                              color: AppColor.kBlack,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            labelText: "To Date",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () async {
                            DateTime date = DateTime(1900);
                            FocusScope.of(context).requestFocus(FocusNode());
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now().add(Duration(days: 365)),
                            ).then((selectedDate) {
                              if (selectedDate != null) {
                                datepickar2.text = DateFormat('yyyy-MM-dd')
                                    .format(selectedDate);
                              }
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  addVerticalSpace(10),
                  GestureDetector(
                    onTap: () {
                      if (loctionid == null) {
                        Get.snackbar('Error', 'Please select a location.',
                            backgroundColor: AppColor.kGreen);
                      } else {
                        dateViseDeta(
                          dateFrom: datepickar1.text,
                          dateTo: datepickar2.text,
                          locationId: loctionid,
                        );
                      }
                    },
                    child: Button("Get Data"),
                  ),
                  addVerticalSpace(10),
                  ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dateList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onDoubleTap: () {
                            Get.to(FollowUpScreen(
                              refnom: "${dateList[index]?["ref_No"]}",
                            ));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.kWhite,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 2, color: AppColor.kGray)
                                ],
                              ),
                              child: Column(
                                children: [
                                  Reportstyle("Customer Name :",
                                      ' ${dateList[index]?["customer_Name"] ?? 'N/A'}'),
                                  Reportstyle("Sales Person :",
                                      ' ${dateList[index]?["salesPerson"] ?? 'N/A'}'),
                                  Reportstyle("Product :",
                                      ' ${dateList[index]?["product"] ?? 'N/A'}'),
                                  Reportstyle("Reference No. :",
                                      ' ${dateList[index]?["ref_No"] ?? 'N/A'}'),
                                  Reportstyle("Mobile No. :",
                                      ' ${dateList[index]?["mob_No"] ?? 'N/A'}'),
                                  Reportstyle("Appointment Date :",
                                      ' ${dateList[index]?["currentAppointmentDate"] ?? 'N/A'}'),
                                  Reportstyle("Remark :",
                                      ' ${dateList[index]?["last_Remark"] ?? 'N/A'}'),
                                  Reportstyle("Special Remark :",
                                      ' ${dateList[index]?["remark_Special"] ?? 'N/A'}'),
                                  Reportstyle("Action Taken :",
                                      ' ${dateList[index]?["last_ActionTaken"] ?? 'N/A'}'),
                                  Reportstyle("Last Contact Date :",
                                      ' ${dateList[index]?["lastContact_Date"] ?? 'N/A'}'),
                                  Reportstyle("Priority :",
                                      ' ${dateList[index]?["priority"] ?? 'N/A'}'),
                                  addVerticalSpace(10),
                                ],
                              )),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> dateViseDeta(
      {required String dateFrom,
      required String dateTo,
      required int locationId}) async {
    try {
      print('1. Start fetchData');
      final formattedDateFrom = DateFormat('yyyy-MM-dd').format(
        DateFormat('yyyy-MM-dd').parse(dateFrom),
      );
      final formattedDateTo = DateFormat('yyyy-MM-dd').format(
        DateFormat('yyyy-MM-dd').parse(dateTo),
      );
      final response = await http.get(Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetScheduleReport?datefrom=$formattedDateFrom&dateto=$formattedDateTo&locationid=$locationId',
      ));
      print('2. API Response: ${response.body.toString()}');
      if (response.statusCode == 200) {
        print('3. Updating dateList');
        print(response.body.toString());
        setState(() {
          dateList = json.decode(response.body);
        });
        print('4. dateList Updated: $dateList');
      } else {
        print('Failed to load data: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load data. Please try again.'),
          ),
        );
      }
      print('5. End fetchData');
    } catch (error) {
      print('Error: $error');
      // Display an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(' $error'),
        ),
      );
    }
  }

  Future<void> loction() async {
    final url =
        Uri.parse('http://lms.muepetro.com/api/UserController1/GetLocation');
    try {
      final response = await http.get(url);
      var data = jsonDecode(response.body) as List<dynamic>;
      print('API Response: $data');
      if (response.statusCode == 200) {
        setState(() {
          Loctionshow.add({'id': 0, 'location_Name': 'Select a Location'});
          Loctionshow.addAll(data.cast<Map<String, dynamic>>());
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> generatePDF() async {
    final pdf = pw.Document();

    // Define page size and orientation
    final pageFormat = PdfPageFormat.a4;

    for (var index = 0; index < dateList.length; index++) {
      final customerName =
          'Customer Name: ${dateList[index]?["customer_Name"] ?? 'N/A'}';
      final salesPerson =
          'Sales Person: ${dateList[index]?["salesPerson"] ?? 'N/A'}';
      final product = 'Product: ${dateList[index]?["product"] ?? 'N/A'}';
      final referenceNo =
          'Reference No.: ${dateList[index]?["ref_No"] ?? 'N/A'}';
      final mobileNo = 'Mobile No.: ${dateList[index]?["mob_No"] ?? 'N/A'}';
      final appointmentDate =
          'Appointment Date: ${dateList[index]?["currentAppointmentDate"] ?? 'N/A'}';
      final remark = 'Remark: ${dateList[index]?["last_Remark"] ?? 'N/A'}';
      final specialRemark =
          'Special Remark: ${dateList[index]?["remark_Special"] ?? 'N/A'}';
      final actionTaken =
          'Action Taken: ${dateList[index]?["last_ActionTaken"] ?? 'N/A'}';
      final lastContactDate =
          'Last Contact Date: ${dateList[index]?["lastContact_Date"] ?? 'N/A'}';
      final priority = 'Priority: ${dateList[index]?["priority"] ?? 'N/A'}';
      final refNo = dateList[index]?["ref_No"] ?? '';

      pdf.addPage(
        pw.Page(
          pageFormat: pageFormat,
          build: (context) => pw.Container(
            padding: const pw.EdgeInsets.all(20),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                _buildText(customerName),
                _buildText(salesPerson),
                _buildText(product),
                _buildText(referenceNo),
                _buildText(mobileNo),
                _buildText(appointmentDate),
                _buildText(remark),
                _buildText(specialRemark),
                _buildText(actionTaken),
                _buildText(lastContactDate),
                _buildText(priority),
              ],
            ),
          ),
        ),
      );
    }

    final output = await Printing.layoutPdf(
      onLayout: (format) async => pdf.save(),
    );

    // final file = File('example.pdf');
    // await file.writeAsBytes(await pdf.save());
    final file =
        File('example.pdf'); // Ensure 'dart:io' is imported for File class
    await file.writeAsBytes(await pdf.save());

    print('PDF saved to: ${file.path}');
  }

  pw.Widget _buildText(String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 10),
      child: pw.Text(
        text,
        style: const pw.TextStyle(fontSize: 14),
      ),
    );
  }


  
}
