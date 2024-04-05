// // ignore_for_file: unused_import
// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'package:autowheelapp/Report/BillReport.dart';
// import 'package:autowheelapp/models/Addinvoicpurchaiss.dart';
// import 'package:autowheelapp/models/Visitermodel.dart';
// import 'package:autowheelapp/models/groupmodel.dart';
// import 'package:autowheelapp/screen/master/Group1.dart';
// import 'package:autowheelapp/showroom/Datevisedeta.dart';
// import 'package:autowheelapp/showroom/Prosepet.dart';
// import 'package:autowheelapp/showroom/id.dart';
// import 'package:autowheelapp/utils/widget/String.dart';
// import 'package:autowheelapp/utils/widget/widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import '../utils/color/Appcolor.dart';
// import 'package:http/http.dart' as http;

// class FollowUpScreen extends StatefulWidget {
//   final String? refnom;
//   const FollowUpScreen({super.key, this.refnom});
//   @override
//   State<FollowUpScreen> createState() => _FollowUpScreenState();
// }

// class _FollowUpScreenState extends State<FollowUpScreen> {
//   TextEditingController RefController = TextEditingController();
//   TextEditingController BlankController = TextEditingController();
//   TextEditingController splController = TextEditingController();
//   TextEditingController ActionController = TextEditingController();
//   TextEditingController ContactController = TextEditingController();
//   TextEditingController ContactnumbarController = TextEditingController();
//   TextEditingController RemarksController = TextEditingController();
//   TextEditingController datepickar = TextEditingController(
//     text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
//   );
//   TextEditingController datepickar2 = TextEditingController(
//     text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
//   );
//   List<Map<String, dynamic>> dataList1 = [];
//   List<Map<String, dynamic>> dateList = [];
//   String selectedVisitorName = "Visitor Name";
//   int? selectedVisitorId;
//   List<Map<String, dynamic>> Prionaity = [
//     {'id': 0, 'name': 'Prionaity'}
//   ];
//   String selectedPrionaityName = "Prionaity";
//   int? selectedPrionaityId;
//   List<Map<String, dynamic>> Folowtype = [
//     {'id': 0, 'name': 'Follow type*'}
//   ];
//   String selectedFolowtypeName = "Follow type*";
//   int? selectedFolowtypeId;
//   late TimeOfDay selectedTime;

//   var h, w;

//   String conttact = "";
//   String remark = "";
//   String page = "";
//   String time = '';
//   List<Map<String, String>> dataList = [];
//   @override
//   void updateTableValues() {
//     setState(() {
//       conttact = ContactController.text;
//       remark = RemarksController.text;
//       page = datepickar.text;
//       // selectedTime2.hour;
//       // phone = phoneController.text;

//       Map<String, String> newData = {
//         'Name': conttact,
//         'Age': remark,
//         'Page': page,
//         'time': time
//       };

//       dataList.add(newData);
//     });
//   }

//   Future<void> _selectTime1(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: selectedTime1,
//     );
//     if (picked != null && picked != selectedTime1) {
//       setState(() {
//         selectedTime1 = picked;
//       });
//     }
//   }

//   late TimeOfDay selectedTime1;
//   Future<void> _selectTime2(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: selectedTime2,
//     );
//     if (picked != null && picked != selectedTime2) {
//       setState(() {
//         selectedTime2 = picked;
//       });
//     }
//   }

//   late TimeOfDay selectedTime2;
//   void startTimer() {
//     Timer.periodic(Duration(minutes: 1), (Timer timer) {
//       setState(() {
//         selectedTime1 = TimeOfDay.now();
//         selectedTime2 = TimeOfDay.now();
//       });
//     });
//   }

//   refreshData() async {
//     await prionaityDeta();
//     followtypeDeta();
//     vixiter();
//   }

//   @override
//   void initState() {
//     super.initState();
//     selectedTime1 = TimeOfDay.now();
//     selectedTime2 = TimeOfDay.now();
//     startTimer();

//     followtypeDeta();
//     vixiter();

//     RefController.text = widget.refnom == null ? "" : widget.refnom.toString();
//   }

//   @override
//   Widget build(BuildContext context) {
//     w = MediaQuery.of(context).size.width;
//     h = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(left: 5, bottom: 5, right: 5),
//             child: ElevatedButton(
//                 onPressed: () {
//                   Get.to(Report());
//                 },
//                 child: Text("Show Details")),
//           )
//         ],

//         toolbarHeight: 36,
//         leading: BackButton(color: AppColor.kBlack),
//         centerTitle: true,
//         elevation: 2,
//         // leadingWidth: 20,
//         backgroundColor: AppColor.kappabrcolr,

//         title: Text(
//           "Follow-Up",
//           style: TextStyle(color: AppColor.kBlack),
//         ),
//         // SizedBox(width: 13),
//       ),
//       body: dateList.isEmpty
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: textformfiles(RefController, onChanged: (e) {
//                             fetchData();
//                             setState(() {});
//                           }, hintText: "Ref.NO", labelText: "Ref.No"),
//                         ),
//                         addhorizontalSpace(10),
//                         Expanded(
//                           child: Container(
//                             padding: EdgeInsets.all(5),
//                             height: 50,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.black, width: 2),
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: DropdownButton(
//                               underline: Container(),
//                               value: selectedVisitorName,
//                               dropdownColor:
//                                   const Color.fromARGB(255, 211, 247, 212),
//                               icon: Icon(
//                                 Icons.keyboard_arrow_down_outlined,
//                                 size: h * 0.030,
//                                 color: Colors.black,
//                               ),
//                               isExpanded: true,
//                               items: dateList.map((item) {
//                                 return DropdownMenuItem(
//                                   value: item['customer_Name'],
//                                   child: Text(
//                                     item['customer_Name'],
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                 );
//                               }).toList(),
//                               onChanged: (value) {
//                                 setState(() {
//                                   selectedVisitorName =
//                                       value?.toString() ?? "Visitor Name";
//                                   selectedVisitorId = dateList.firstWhere(
//                                     (item) => item['customer_Name'] == value,
//                                     orElse: () => {
//                                       'id': ['prospectId']
//                                     },
//                                   )['id'];
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     addVerticalSpace(5),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: textformfiles(ContactController,
//                               hintText: "Contact Person",
//                               labelText: "Contact Person"),
//                         ),
//                         addhorizontalSpace(10),
//                         Expanded(
//                           child: textformfiles(ContactnumbarController,
//                               hintText: "Contact Numbar",
//                               labelText: "Contact Numbar"),
//                         ),
//                       ],
//                     ),
//                     addVerticalSpace(5),
//                     textformfiles(splController,
//                         hintText: "Spl.Remarks", labelText: "Spl.Remarks"),
//                     addVerticalSpace(5),
//                     textformfiles(RemarksController,
//                         hintText: "Remarks", labelText: "Remarks"),
//                     addVerticalSpace(5),
//                     Row(
//                       children: [
//                         Expanded(
//                             child: TextFormField(
//                           readOnly: true,
//                           controller: datepickar,
//                           decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(width: 2.0, color: Colors.black),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(width: 2.0, color: Colors.black),
//                             ),
//                             contentPadding: EdgeInsets.all(5),
//                             hintText: jobouttxt,
//                             prefixIcon: Icon(
//                               Icons.edit_calendar,
//                               color: AppColor.kBlack,
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             // Apply bold font weight to the text
//                             labelText: "Contact Date",
//                             labelStyle: TextStyle(
//                               fontWeight: FontWeight.bold, // Make the text bold
//                             ),
//                           ),
//                           onTap: () async {
//                             // ignore: unused_local_variable
//                             DateTime date = DateTime(1900);
//                             FocusScope.of(context).requestFocus(FocusNode());
//                             await showDatePicker(
//                               context: context,
//                               initialDate: DateTime.now(),
//                               firstDate: DateTime(1900),
//                               lastDate: DateTime.now(),
//                             ).then((selectedDate) {
//                               if (selectedDate != null) {
//                                 datepickar.text = DateFormat('dd-MM-yyyy')
//                                     .format(selectedDate);
//                               }
//                             });
//                           },
//                         )),
//                         addhorizontalSpace(5),
//                         Expanded(
//                             child: InkWell(
//                           onTap: () {
//                             _selectTime2(context);
//                           },
//                           child: Container(
//                             height: 47,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               border: Border.all(color: Colors.black, width: 2),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "${selectedTime2.format(context)}",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ))
//                       ],
//                     ),
//                     addVerticalSpace(5),
//                     Row(
//                       children: [
//                         Expanded(
//                             child: Container(
//                           padding: const EdgeInsets.all(8),
//                           height: 50,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               border: Border.all(color: Colors.black, width: 2),
//                               borderRadius: BorderRadius.circular(5)),
//                           child: DropdownButton(
//                             underline: Container(),
//                             value: selectedFolowtypeName,
//                             dropdownColor:
//                                 const Color.fromARGB(255, 211, 247, 212),
//                             icon: Icon(Icons.keyboard_arrow_down_outlined,
//                                 size: h * 0.030, color: AppColor.kBlack),
//                             isExpanded: true,
//                             items: Folowtype.map((item) {
//                               return DropdownMenuItem(
//                                 value: item['name'],
//                                 child: Text(
//                                   item['name'],
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                               );
//                             }).toList(),
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedFolowtypeName = value.toString();
//                                 selectedFolowtypeId = Folowtype.firstWhere(
//                                             (item) => item['name'] == value)
//                                         .containsKey('id')
//                                     ? Folowtype.firstWhere(
//                                         (item) => item['name'] == value)['id']
//                                     : null;

//                                 // Cast value to Map before using the [] operator
//                                 Map<String, dynamic> selectedValueMap =
//                                     value as Map<String, dynamic>;

//                                 // Update the controllers with the correct keys
//                                 ContactController.text =
//                                     selectedValueMap['contact_Name'];
//                                 RemarksController.text =
//                                     selectedValueMap['remark_Special'];
//                                 log(ContactController.text);
//                               });
//                             },
//                           ),
//                         )),
//                         addhorizontalSpace(5),
//                         SizedBox(
//                           width: 50,
//                           child: InkWell(
//                             onTap: () {
//                               Get.to(() => Group1Screen(SourecID: 18))!
//                                   .then((value) => refreshData());
//                             },
//                             child: Container(
//                                 height: 50,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: Colors.white,
//                                   border: Border.all(
//                                     width: 2,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 child: Icon(
//                                   Icons.add,
//                                   color: AppColor.kBlack,
//                                 )),
//                           ),
//                         )
//                       ],
//                     ),
//                     addVerticalSpace(7),
//                     Row(
//                       children: [
//                         Expanded(
//                             child: Container(
//                           padding: const EdgeInsets.all(8),
//                           height: 50,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               border: Border.all(color: Colors.black, width: 2),
//                               borderRadius: BorderRadius.circular(5)),
//                           child: DropdownButton(
//                             underline: Container(),
//                             value: selectedPrionaityName,
//                             dropdownColor:
//                                 const Color.fromARGB(255, 211, 247, 212),
//                             icon: Icon(Icons.keyboard_arrow_down_outlined,
//                                 size: h * 0.030, color: AppColor.kBlack),
//                             isExpanded: true,
//                             items: Prionaity.map((item) {
//                               return DropdownMenuItem(
//                                 value: item['name'],
//                                 child: Text(
//                                   item['name'],
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                               );
//                             }).toList(),
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedPrionaityName = value.toString();
//                                 selectedPrionaityId = Prionaity.firstWhere(
//                                             (item) => item['name'] == value)
//                                         .containsKey('id')
//                                     ? Prionaity.firstWhere(
//                                         (item) => item['name'] == value)['id']
//                                     : null;
//                               });
//                             },
//                           ),
//                         )),
//                         addhorizontalSpace(5),
//                         SizedBox(
//                           width: 50,
//                           child: InkWell(
//                             onTap: () {
//                               Get.to(() => Group1Screen(SourecID: 22))!
//                                   .then((value) => refreshData());
//                             },
//                             child: Container(
//                                 height: 50,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: Colors.white,
//                                   border: Border.all(
//                                     width: 2,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 child: Icon(
//                                   Icons.add,
//                                   color: AppColor.kBlack,
//                                 )),
//                           ),
//                         )
//                       ],
//                     ),
//                     addVerticalSpace(5),
//                     Row(
//                       children: [
//                         Expanded(
//                             child: TextFormField(
//                           readOnly: true,
//                           controller: datepickar2,
//                           decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(width: 2.0, color: Colors.black),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(width: 2.0, color: Colors.black),
//                             ),
//                             contentPadding: EdgeInsets.all(5),
//                             hintText: jobouttxt,
//                             prefixIcon: Icon(
//                               Icons.edit_calendar,
//                               color: AppColor.kBlack,
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             // Apply bold font weight to the text
//                             labelText: "date",
//                             labelStyle: TextStyle(
//                               fontWeight: FontWeight.bold, // Make the text bold
//                             ),
//                           ),
//                           onTap: () async {
//                             // ignore: unused_local_variable
//                             DateTime date = DateTime(1900);
//                             FocusScope.of(context).requestFocus(FocusNode());
//                             await showDatePicker(
//                               context: context,
//                               initialDate: DateTime.now(),
//                               firstDate: DateTime(1900),
//                               lastDate: DateTime.now(),
//                             ).then((selectedDate) {
//                               if (selectedDate != null) {
//                                 datepickar2.text = DateFormat('yyyy/MM/dd')
//                                     .format(selectedDate);
//                                 print(datepickar2.text.toString());
//                               }
//                             });
//                           },
//                         )),
//                         addhorizontalSpace(5),
//                         Expanded(
//                             child: InkWell(
//                           onTap: () {
//                             _selectTime1(context);
//                             // _selectTime2(context);
//                           },
//                           child: Container(
//                             height: 47,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               border: Border.all(color: Colors.black, width: 2),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "${selectedTime1.format(context)}",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ))
//                       ],
//                     ),
//                     addVerticalSpace(5),
//                     InkWell(
//                         onTap: () {
//                           updateTableValues();
//                           ContactController.clear();
//                           RemarksController.clear();
//                           datepickar.clear();
//                         },
//                         child: Button(savetxt)),
//                     addVerticalSpace(5),
//                     redButton(delettxt),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }

//   Future<void> prionaityDeta() async {
//     final url = Uri.parse(
//         'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=22');
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final List<Goruppartmodel> goruppartmodelList =
//             goruppartmodelFromJson(response.body);

//         Prionaity.clear();
//         Prionaity.add({'id': 0, 'name': 'Prionaity'});
//         for (var item in goruppartmodelList) {
//           Prionaity.add({'id': item.id, 'name': item.name});
//         }
//         setState(() {});
//       } else {
//         print('Request failed with status: ${response.statusCode}');
//         print('Response Data: ${response.body}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<void> followtypeDeta() async {
//     final url = Uri.parse(
//         'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=18');
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final List<Goruppartmodel> goruppartmodelList =
//             goruppartmodelFromJson(response.body);

//         Folowtype.clear();
//         Folowtype.add({'id': 0, 'name': 'Follow type*'});
//         for (var item in goruppartmodelList) {
//           Folowtype.add({'id': item.id, 'name': item.name});
//         }
//         setState(() {});
//       } else {
//         print('Request failed with status: ${response.statusCode}');
//         print('Response Data: ${response.body}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<void> vixiter() async {
//     final response = await http.get(
//         Uri.parse('http://lms.muepetro.com/api/UserController1/GetProspect'));

//     if (response.statusCode == 200) {
//       final List<dynamic> decodedList = json.decode(response.body);
//       final List<Map<String, dynamic>> mappedList =
//           List<Map<String, dynamic>>.from(decodedList);

//       setState(() {
//         dateList = mappedList;
//         if (dateList.isNotEmpty) {
//           selectedVisitorName = dateList[0]['customer_Name'];
//           selectedVisitorId = dateList[0]['id'];
//         }
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   void postFollowUp(BuildContext context) async {
//     final String apiUrl =
//         "http://lms.muepetro.com/api/UserController1/PostFollowUp";
//     Map<String, dynamic> followUpData = {
//       "Location_Id": 12,
//       "Prefix_Name": "online",
//       "Ref_No": RefController.text.toString(),
//       "Customer_Name": ContactController.text.toString(),
//       "Contacted_Date": datepickar.text.toString(),
//       "Contacted_Time":"${selectedTime2.hour}:${selectedTime2.minute}",
//       "Follow_Type": selectedFolowtypeId,
//       "Appointment_Date": datepickar2.text.toString(),
//       "Appointment_Time": "${selectedTime1.hour}:${selectedTime1.minute}",
//       "Remarks": RemarksController.text.toString(),
//       "ActionTaken": "ActionTaken",
//       "Priority": selectedPrionaityId,
//       "Remark_Special": splController.text.toString(),
//       "EnquiryStatus": 1,
//       "Reason": "Reason",
//       "VehiclePurchase": "VehiclePurchase"
//     };

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {
//           "Content-Type": "application/json",
//         },
//         body: jsonEncode(followUpData),
//       );
//       if (response.statusCode == 200) {
//         print("Follow-up posted successfully");
//         print(response.body);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("Follow-up posted successfully"),
//             backgroundColor: Colors.green,
//           ),
//         );
//       } else {
//         print("Error posting follow-up: ${response.statusCode}");
//         print(response.body);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("Error posting follow-up: ${response.statusCode}"),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } catch (e) {
//       print("Exception during follow-up post: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Exception during follow-up post: $e"),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   Future<void> fetchData() async {
//     print(1);
//     try {
//       final response = await http.get(
//         Uri.parse(
//           'http://lms.muepetro.com/api/UserController1/GetFollowUpData?prefix=Online&refno=${RefController.text}&locationid=2',
//         ),
//       );
//       print(2);

//       if (response.statusCode == 200) {
//         List<dynamic> dataList = json.decode(response.body);

//         if (dataList.isNotEmpty) {
//           Map<String, dynamic> data = dataList[0];
//           // print(response.body);
//           setState(() {});
//           dataList1.add(data);
//           ContactController.text = data['customer_Name'] ?? '';
//           RemarksController.text = data['remarks'] ?? '';
//           splController.text = data['Remark_Special'] ?? '';
//           selectedFolowtypeId = data['follow_Type'];
//           print(selectedFolowtypeId);

//           print(3);
//           setState(() {});
//         } else {
//           // Handle the case when the list is empty
//           print("Empty data list");
//         }
//       } else {
//         throw Exception('Failed to load data');
//       }
//       print(4);
//     } catch (error) {
//       print('Error: $error');
//     }
//   }
//   // Future<void> RefDateApi() async {
//   //   print(1);
//   //   try {
//   //     final response = await http.get(
//   //       Uri.parse(
//   //         'http://lms.muepetro.com/api/UserController1/GetFollowUpData?prefix=Online&refno=${RefController.text}&locationid=2',
//   //       ),
//   //     );
//   //     print(2);

//   //     if (response.statusCode == 200) {
//   //       List<dynamic> dataList = json.decode(response.body);

//   //       if (dataList.isNotEmpty) {
//   //         Map<String, dynamic> data = dataList[0];
//   //         print(response.body);
//   //         setState(() {});
//   //         dataList1.add(data);

//   //         splController.text = data['Remark_Special'];
//   //         ContactController.text = data['customer_Name'] ?? '';
//   //         RemarksController.text = data['remarks'] ?? '';

//   //         print(3);
//   //         setState(() {});
//   //       } else {
//   //         // Handle the case when the list is empty
//   //         print("Empty data list");
//   //       }
//   //     } else {
//   //       throw Exception('Failed to load data');
//   //     }
//   //     print(4);
//   //   } catch (error) {
//   //     print('Error: $error');
//   //   }
//   // }
// }

// ignore_for_file: unused_import, unnecessary_import, override_on_non_overriding_member
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:autowheelapp/Report/BillReport.dart';
import 'package:autowheelapp/models/Addinvoicpurchaiss.dart';
import 'package:autowheelapp/models/Visitermodel.dart';
import 'package:autowheelapp/models/groupmodel.dart';
import 'package:autowheelapp/screen/master/Group1.dart';
import 'package:autowheelapp/showroom/Schedulereport.dart';
import 'package:autowheelapp/showroom/Prosepet.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../utils/color/Appcolor.dart';
import 'package:http/http.dart' as http;
import 'package:dropdown_button2/dropdown_button2.dart';

class FollowUpScreen extends StatefulWidget {
  final String? refnom;
  const FollowUpScreen({super.key, this.refnom});
  @override
  State<FollowUpScreen> createState() => _FollowUpScreenState();
}

class _FollowUpScreenState extends State<FollowUpScreen> {
  TextEditingController RefController = TextEditingController();
  TextEditingController BlankController = TextEditingController();
  TextEditingController splController = TextEditingController();
  TextEditingController ActionController = TextEditingController();
  TextEditingController ContactController = TextEditingController();
  TextEditingController ContactnumbarController = TextEditingController();
  TextEditingController RemarksController = TextEditingController();
  TextEditingController datepickar = TextEditingController(
    text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
  );
  TextEditingController datepickar2 = TextEditingController(
    text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
  );
  List<Map<String, dynamic>> dataList1 = [];
  List<Map<String, dynamic>> dateList = [];
  String selectedVisitorName = "Visitor Name";
  Map<String, dynamic>? selectedvixiterValue;
  // int vixiterId = 0;
  final TextEditingController vixiterController = TextEditingController();
  // int? selectedPrionaityId;
  int? selectedVisitorId;
  //
  List<Map<String, dynamic>> Prionaity = [
    {'id': 0, 'name': 'Prionaity'}
  ];
  Map<String, dynamic>? selectedValue1;
  // int proirityId = 0;
  final TextEditingController textEditingController = TextEditingController();
  int? selectedPrionaityId;
  //
  List<Map<String, dynamic>> Folowtype = [
    {'id': 0, 'name': 'Follow type*'}
  ];
  String selectedFolowtypeName = "Follow type*";
  // int? selectedFolowtypeId;
  Map<String, dynamic>? selectedfollowupValue;
  int? followupid;
  final TextEditingController FollowupController = TextEditingController();
  // int? selectedPrionaityId;
  //
  late TimeOfDay selectedTime;

  var h, w;

  String conttact = "";
  String remark = "";
  String page = "";
  String time = '';
  // List<Map<String, String>> dataList = [];
  @override
  Future<void> _selectTime1(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime1,
    );
    if (picked != null && picked != selectedTime1) {
      setState(() {
        selectedTime1 = picked;
      });
    }
  }

  late TimeOfDay selectedTime1;
  Future<void> _selectTime2(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime2,
    );
    if (picked != null && picked != selectedTime2) {
      setState(() {
        selectedTime2 = picked;
      });
    }
  }

  late TimeOfDay selectedTime2;
  void startTimer() {
    Timer.periodic(Duration(minutes: 1), (Timer timer) {
      setState(() {
        selectedTime1 = TimeOfDay.now();
        selectedTime2 = TimeOfDay.now();
      });
    });
  }

  refreshData() async {
    await prionaityDeta();
    followtypeDeta();
    vixiter();
    PrefixData();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedTime1 = TimeOfDay.now();
      selectedTime2 = TimeOfDay.now();
      prionaityDeta();
      startTimer();
      followtypeDeta();

      refreshData();
    });
    RefController.text = widget.refnom == null ? "" : widget.refnom.toString();
    Prionaity.clear();
    Prionaity.add({'id': 0, 'name': 'Prionaity'});
    prionaityDeta().then((_) {
      setState(() {
        selectedValue1 = Prionaity.firstWhere(
          (item) => item['id'] == selectedPrionaityId,
          orElse: () => Prionaity[0],
        );
      });
    });
  }

  @override
  void dispose() {
    splController.clear();
    RemarksController.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 5, bottom: 5, right: 5),
            child: ElevatedButton(
                onPressed: () {
                  Get.to(Schedulereport());
                },
                child: Text("Show Details")),
          )
        ],

        toolbarHeight: 36,
        leading: BackButton(color: AppColor.kBlack),
        centerTitle: true,
        elevation: 2,
        // leadingWidth: 20,
        backgroundColor: AppColor.kappabrcolr,

        title: Text(
          "Follow-Up",
          style: TextStyle(color: AppColor.kBlack),
        ),
        // SizedBox(width: 13),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              textformfiles(RefController,
                  readOnly: true,
                  keyboardType: TextInputType.number, onChanged: (e) {
                setState(() {
                  PrefixData();
                });
              },  labelText: "Ref.No"),
              // addhorizontalSpace(10),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: textformfiles(ContactController,
                        labelText: "Contact Person"),
                  ),
                  addhorizontalSpace(10),
                  Expanded(
                    child: textformfiles(ContactnumbarController,
                        keyboardType: TextInputType.number,
                        labelText: "Contact Numbar"),
                  ),
                ],
              ),
              addVerticalSpace(10),
              textformfiles(splController,
                 labelText: "Spl.Remarks"),
              addVerticalSpace(10),
              textformfiles(RemarksController,
                   labelText: "Remarks"),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    readOnly: true,
                    controller: datepickar,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: Colors.black),
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
                      // Apply bold font weight to the text
                      labelText: "Contact Date",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, // Make the text bold
                      ),
                    ),
                    onTap: () async {
                      // ignore: unused_local_variable
                      DateTime date = DateTime(1900);
                      FocusScope.of(context).requestFocus(FocusNode());
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      ).then((selectedDate) {
                        if (selectedDate != null) {
                          datepickar.text =
                              DateFormat('dd-MM-yyyy').format(selectedDate);
                        }
                      });
                    },
                  )),
                  addhorizontalSpace(5),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      _selectTime2(context);
                    },
                    child: Container(
                      height: 47,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          "${selectedTime2.format(context)}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      // padding: const EdgeInsets.all(8),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<Map<String, dynamic>>(
                          isExpanded: true,
                          hint: Text(
                            'Select Priority',
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColor.kBlack,
                                fontWeight: FontWeight.bold),
                          ),
                          items: Prionaity.map((item) => DropdownMenuItem(
                                onTap: () {
                                  selectedPrionaityId = item['id'];
                                },
                                value: item,
                                child: Row(
                                  children: [
                                    Text(
                                      item['name'].toString(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )).toList(),
                          value: selectedValue1,
                          onChanged: (value) {
                            setState(() {
                              selectedValue1 = value;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: 40,
                            width: 200,
                          ),
                          dropdownStyleData: const DropdownStyleData(
                            maxHeight: 200,
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                          ),
                          dropdownSearchData: DropdownSearchData(
                            searchController: textEditingController,
                            searchInnerWidgetHeight: 50,
                            searchInnerWidget: Container(
                              height: 50,
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: 4,
                                right: 8,
                                left: 8,
                              ),
                              child: TextFormField(
                                expands: true,
                                readOnly: false,
                                maxLines: null,
                                controller: textEditingController,
                                onChanged: (value) {
                                  setState(() {
                                    // Filter the Prionaity list based on the search value
                                    Prionaity.where((item) => item['name']
                                            .toString()
                                            .toLowerCase()
                                            .contains(value.toLowerCase()))
                                        .toList();
                                  });
                                },
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  hintText: 'Search for a priority...',
                                  hintStyle: const TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onMenuStateChange: (isOpen) {
                            if (!isOpen) {
                              textEditingController.clear();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  addhorizontalSpace(5),
                  SizedBox(
                    width: 50,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => Group1Screen(SourecID: 18))!
                            .then((value) => refreshData());
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
                      // padding: const EdgeInsets.all(8),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<Map<String, dynamic>>(
                          isExpanded: true,
                          hint: Text(
                            'Select followup',
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColor.kBlack,
                                fontWeight: FontWeight.bold),
                          ),
                          items: Folowtype.map((item) => DropdownMenuItem(
                                onTap: () {
                                  followupid = item['id'];
                                },
                                value: item,
                                child: Row(
                                  children: [
                                    Text(
                                      item['name'].toString(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )).toList(),
                          value: selectedfollowupValue,
                          onChanged: (value) {
                            setState(() {
                              selectedfollowupValue = value;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: 20,
                            width: 200,
                          ),
                          dropdownStyleData: const DropdownStyleData(
                            maxHeight: 200,
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                          ),
                          dropdownSearchData: DropdownSearchData(
                            searchController: FollowupController,
                            searchInnerWidgetHeight: 50,
                            searchInnerWidget: Container(
                              height: 50,
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: 4,
                                right: 8,
                                left: 8,
                              ),
                              child: TextFormField(
                                expands: true,
                                readOnly: false,
                                maxLines: null,
                                controller: FollowupController,
                                onChanged: (value) {
                                  setState(() {
                                    // Filter the Prionaity list based on the search value
                                    Folowtype.where((item) => item['name']
                                            .toString()
                                            .toLowerCase()
                                            .contains(value.toLowerCase()))
                                        .toList();
                                  });
                                },
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  hintText: 'Search for a followup...',
                                  hintStyle: const TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onMenuStateChange: (isOpen) {
                            if (!isOpen) {
                              FollowupController.clear();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  addhorizontalSpace(5),
                  SizedBox(
                    width: 50,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => Group1Screen(SourecID: 18))!
                            .then((value) => refreshData());
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
                      contentPadding: EdgeInsets.all(5),
                      hintText: jobouttxt,
                      prefixIcon: Icon(
                        Icons.edit_calendar,
                        color: AppColor.kBlack,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      // Apply bold font weight to the text
                      labelText: "Date ",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, // Make the text bold
                      ),
                    ),
                    onTap: () async {
                      // ignore: unused_local_variable
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
                              DateFormat('yyyy/MM/dd').format(selectedDate);
                          print(datepickar2.text.toString());
                        }
                      });
                    },
                  )),
                  addhorizontalSpace(5),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      _selectTime1(context);
                      // _selectTime2(context);
                    },
                    child: Container(
                      height: 47,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          "${selectedTime1.format(context)}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              addVerticalSpace(10),
              InkWell(
                  onTap: () {
                    postFollowUp(context);
                    // updateTableValues();
                    // ContactController.clear();
                    // RemarksController.clear();
                    // datepickar.clear();
                  },
                  child: Button(savetxt)),
              addVerticalSpace(5),
              redButton(delettxt),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> prionaityDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=22');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        Prionaity.clear();
        Prionaity.add({'id': 0, 'name': 'Prionaity'});
        for (var item in goruppartmodelList) {
          Prionaity.add({'id': item.id, 'name': item.name});
        }
        setState(() {});
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> followtypeDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=18');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        Folowtype.clear();
        Folowtype.add({'id': 0, 'name': 'Follow type*'});
        for (var item in goruppartmodelList) {
          Folowtype.add({'id': item.id, 'name': item.name});
        }
        setState(() {});
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> vixiter() async {
    final response = await http.get(
        Uri.parse('http://lms.muepetro.com/api/UserController1/GetProspect'));

    if (response.statusCode == 200) {
      final List<dynamic> decodedList = json.decode(response.body);
      final List<Map<String, dynamic>> mappedList =
          List<Map<String, dynamic>>.from(decodedList);

      setState(() {
        dateList = mappedList;
        if (dateList.isNotEmpty) {
          selectedVisitorName = dateList[0]['customer_Name'];
          selectedVisitorId = dateList[0]['id'];
        }
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  void postFollowUp(BuildContext context) async {
    print(1);
    final String apiUrl =
        "http://lms.muepetro.com/api/UserController1/PostFollowUp";
    Map<String, dynamic> followUpData = {
      "Location_Id": 12,
      "Prefix_Name": "online",
      "Ref_No": int.parse(RefController.text),
      "Customer_Name": ContactController.text.toString(),
      "Contacted_Date": datepickar.text.toString(),
      "Contacted_Time": "${selectedTime2.hour}:${selectedTime2.minute}",
      "Follow_Type": followupid,
      "Appointment_Date": datepickar2.text.toString(),
      "Appointment_Time": "${selectedTime1.hour}:${selectedTime1.minute}",
      "Remarks": RemarksController.text.toString(),
      "Remark_Special": splController.text.toString(),
      "ActionTaken": "ActionTaken",
      "Priority": selectedPrionaityId,
      "EnquiryStatus": 1,
      "Reason": "Reason",
      "VehiclePurchase": "VehiclePurchase"
    };
    print(followUpData);
    print(2);
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(followUpData),
      );
      print(3);
      if (response.statusCode == 200) {
        print("Follow-up posted successfully");
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Follow-up posted successfully"),
            backgroundColor: Colors.green,
          ),
        );
        print(4);
      } else {
        print("Error posting follow-up: ${response.statusCode}");
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error posting follow-up: ${response.statusCode}"),
            backgroundColor: Colors.red,
          ),
        );
      }
      print(5);
    } catch (e) {
      print("Exception during follow-up post: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Exception during follow-up post: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> PrefixData() async {
    print(1);
    try {
      final response = await http.get(
        Uri.parse(
          'http://lms.muepetro.com/api/UserController1/GetFollowUpData?prefix=Online&refno=${RefController.text}&locationid=2',
        ),
      );
      print(2);

      if (response.statusCode == 200) {
        List<dynamic> dataList = json.decode(response.body);

        if (dataList.isNotEmpty) {
          Map<String, dynamic> data = dataList[0];

          setState(() {
            ContactController.text = data['customer_Name'] ?? '';
            RemarksController.text = data['remarks'] ?? '';
            splController.text = data['remark_Special'] ?? '';
            selectedPrionaityId = data['priority'];
            followupid = data['follow_Type'];
            selectedValue1 = Prionaity.firstWhere(
              (item) => item['id'] == selectedPrionaityId,
              orElse: () => Prionaity[0],
            );
            selectedfollowupValue = Folowtype.firstWhere(
              (item) => item['id'] == followupid,
              orElse: () => Folowtype[0],
            );

            // print(selectedPrionaityId);
            print(3);
          });
        } else {
          ContactController.clear();
          RemarksController.clear();
          splController.clear();

          print("Empty data list");
        }
      } else {
        throw Exception('Failed to load data');
      }
      print(4);
    } catch (error) {
      print('Error: $error');
    }
  }

  // Future<void> PrefixData() async {
  //   print(1);
  //   try {
  //     final response = await http.get(
  //       Uri.parse(
  //         'http://lms.muepetro.com/api/UserController1/GetFollowUpData?prefix=Online&refno=${RefController.text}&locationid=2',
  //       ),
  //     );
  //     print(2);

  //     if (response.statusCode == 200) {
  //       List<dynamic> dataList = json.decode(response.body);

  //       if (dataList.isNotEmpty) {
  //         Map<String, dynamic> data = dataList[0];

  //         setState(() {});
  //         dataList1.add(data);
  //         ContactController.text = data['customer_Name'] ?? '';
  //         RemarksController.text = data['remarks'] ?? '';
  //         splController.text = data['Remark_Special'] ?? '';
  //         followupid = data['follow_Type'];
  //         print(followupid);

  //         print(3);
  //         setState(() {});
  //       } else {
  //         print("Empty data list");
  //       }
  //     } else {
  //       throw Exception('Failed to load data');
  //     }
  //     print(4);
  //   } catch (error) {
  //     print('Error: $error');
  //   }
  // }
}
