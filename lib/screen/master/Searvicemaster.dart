// ignore_for_file: camel_case_types, unused_import, body_might_complete_normally_nullable, duplicate_ignore, unnecessary_import

import 'package:autowheelapp/models/hsnmodel.dart';
import 'package:autowheelapp/screen/master/SecCode.dart';
import 'package:autowheelapp/showroom/Prosepet.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearvicemasterScreen extends StatefulWidget {
  const SearvicemasterScreen({super.key});

  @override
  State<SearvicemasterScreen> createState() => _SearvicemasterScreenState();
}

class _SearvicemasterScreenState extends State<SearvicemasterScreen> {
  TextEditingController servicenamecon = TextEditingController();
  TextEditingController servicecodecon = TextEditingController();
  TextEditingController ratecon = TextEditingController();
  TextEditingController igst = TextEditingController();
  TextEditingController cgst = TextEditingController();
  TextEditingController sgst = TextEditingController();
  List<Map<String, dynamic>> hsnModels = [];
  Map<String, dynamic>? singleoutlatevalue;
  int hsnId = 0;
  final TextEditingController hsnController = TextEditingController();

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('service_name', servicenamecon.text);
    prefs.setString('service_code', servicecodecon.text);
    prefs.setDouble('rate', double.parse(ratecon.text));
    // prefs.setBool('is_inclusive', _switchValue);
    prefs.setString('igst', igst.text);
    prefs.setString('cgst', cgst.text);
    prefs.setString('sgst', sgst.text);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    HsnIdScreenapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 36,
          backgroundColor: AppColor.kappabrcolr,
          centerTitle: true,

          title: textcostam(
            "Create Service",
            18,
            AppColor.kBlack,
          ),
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.more_vert),
            )
          ],
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, right: 10, left: 10, bottom: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    addVerticalSpace(10),
                    textformfiles(servicenamecon, validator: (e) {
                      if (e!.isEmpty) {
                        return "Please enter is a service name";
                      }
                    }, label: textcostam("Service Name*", 16, AppColor.kBlack)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          child: textformfiles(servicecodecon, validator: (e) {
                            if (e!.isEmpty) {
                              return "Please enter is a service code";
                            }
                          },
                              keyboardType: TextInputType.number,
                              label: textcostam(
                                  "Service code*", 16, AppColor.kBlack)),
                        ),
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.amber,
                          backgroundImage: NetworkImage(
                              "https://img.freepik.com/free-vector/car-service-abstract-concept-illustration_335657-1842.jpg?size=626&ext=jpg&ga=GA1.2.972962653.1692784531&semt=ais"),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 160,
                      child: textformfiles(
                        ratecon,
                        validator: (e) {},
                        keyboardType: TextInputType.number,
                        label: textcostam(mrptxt, 16, AppColor.kBlack),
                      ),
                    ),
                    addVerticalSpace(10),
                    Row(
                      children: [
                        Expanded(
                          child: dropdownTextfield(
                            "Select HSN",
                            DropdownButtonHideUnderline(
                              child: DropdownButton2<Map<String, dynamic>>(
                                isExpanded: true,
                                underline: Container(),
                                iconStyleData: IconStyleData(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppColor.kBlack,
                                  ),
                                ),
                                hint: Text(
                                  'Select HSN',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.kBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                items: hsnModels
                                    .map(
                                      (item) => DropdownMenuItem(
                                        onTap: () {
                                          hsnId = item['hsn_Id'];
                                        },
                                        value: item,
                                        child: Text(
                                          item['hsn_Code'].toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                value: singleoutlatevalue,
                                onChanged: (value) {
                                  setState(() {
                                    singleoutlatevalue = value;
                                    if (value != null) {
                                      igst.text = value['igst'].toString();
                                      cgst.text = value['cgst'].toString();
                                      sgst.text = value['sgst'].toString();
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            Get.to(() => Spare_Parts_cetegory())!
                                .then((value) => HsnIdScreenapi());
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
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: dropdownTextfield(
                    //         "Select HSN",
                    //         DropdownButtonHideUnderline(
                    //           child: DropdownButton2<Map<String, dynamic>>(
                    //             isExpanded: true,
                    //             underline: Container(),
                    //             iconStyleData: IconStyleData(
                    //               icon: Icon(
                    //                 Icons.keyboard_arrow_down,
                    //                 color: AppColor.kBlack,
                    //               ),
                    //             ),
                    //             hint: Text(
                    //               'Select HSN',
                    //               style: TextStyle(
                    //                   fontSize: 15,
                    //                   color: AppColor.kBlack,
                    //                   fontWeight: FontWeight.bold),
                    //             ),
                    //             items: hsnModels
                    //                 .map((item) => DropdownMenuItem(
                    //                       onTap: () {
                    //                         hsnId = item['hsn_Id'];
                    //                       },
                    //                       value: item,
                    //                       child: Text(
                    //                         item['hsn_Code'].toString(),
                    //                         style: const TextStyle(
                    //                             fontSize: 16,
                    //                             fontWeight: FontWeight.bold),
                    //                       ),
                    //                     ))
                    //                 .toList(),
                    //             value: singleoutlatevalue,
                    //             onChanged: (value) {
                    //               setState(() {
                    //                 singleoutlatevalue = value;

                    //                 // Extract corresponding values from selected item
                    //                 if (value != null) {
                    //                   igst.text = value['igst'].toString();
                    //                   cgst.text = (value['cgst']).toString();
                    //                   sgst.text = (value['sgst']).toString();
                    //                 }
                    //               });
                    //             },
                    //             buttonStyleData: const ButtonStyleData(
                    //               padding: EdgeInsets.symmetric(horizontal: 16),
                    //               height: 20,
                    //               width: 200,
                    //             ),
                    //             dropdownStyleData: const DropdownStyleData(
                    //               maxHeight: 200,
                    //             ),
                    //             menuItemStyleData: const MenuItemStyleData(
                    //               height: 40,
                    //             ),
                    //             dropdownSearchData: DropdownSearchData(
                    //               searchController: hsnController,
                    //               searchInnerWidgetHeight: 50,
                    //               searchInnerWidget: Container(
                    //                 height: 50,
                    //                 padding: const EdgeInsets.only(
                    //                   top: 8,
                    //                   bottom: 4,
                    //                   right: 8,
                    //                   left: 8,
                    //                 ),
                    //                 child: TextFormField(
                    //                   expands: true,
                    //                   readOnly: false,
                    //                   maxLines: null,
                    //                   controller: hsnController,
                    //                   onChanged: (value) {
                    //                     setState(() {
                    //                       hsnModels
                    //                           .where((item) => item['hsn_Code']
                    //                               .toString()
                    //                               .toLowerCase()
                    //                               .contains(
                    //                                   value.toLowerCase()))
                    //                           .toList();
                    //                     });
                    //                   },
                    //                   decoration: InputDecoration(
                    //                     isDense: true,
                    //                     contentPadding:
                    //                         const EdgeInsets.symmetric(
                    //                       horizontal: 10,
                    //                       vertical: 8,
                    //                     ),
                    //                     hintText: 'Search for a HSN...',
                    //                     hintStyle:
                    //                         const TextStyle(fontSize: 12),
                    //                     border: OutlineInputBorder(
                    //                       borderRadius:
                    //                           BorderRadius.circular(8),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //             onMenuStateChange: (isOpen) {
                    //               if (!isOpen) {
                    //                 hsnController.clear();
                    //               }
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     addhorizontalSpace(10),
                    //     SizedBox(
                    //       width: 50,
                    //       child: InkWell(
                    //         onTap: () {
                    //           Get.to(() => Spare_Parts_cetegory())!
                    //               .then((value) => HsnIdScreenapi());
                    //         },
                    //         child: Container(
                    //             height: 50,
                    //             width: 50,
                    //             decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(5),
                    //               color: Colors.white,
                    //               border: Border.all(
                    //                 width: 2,
                    //                 color: Colors.black,
                    //               ),
                    //             ),
                    //             child: Icon(
                    //               Icons.add,
                    //               color: AppColor.kBlack,
                    //             )),
                    //       ),
                    //     ),
                    addVerticalSpace(10),
                    Row(
                      children: [
                        Expanded(
                          child: textformfiles(igst,
                              labelText: "Igst", readOnly: true),
                        ),
                        addhorizontalSpace(5),
                        // addo(5),
                        Expanded(
                          child: textformfiles(cgst,
                              labelText: "Cgst", readOnly: true),
                        ),
                        addhorizontalSpace(5),
                        Expanded(
                          child: textformfiles(sgst,
                              labelText: "Sgst", readOnly: true),
                        ),
                      ],
                    ),
                    addVerticalSpace(20),
                    InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            saveData();
                            postLabourMaster();
                          }
                        },
                        child: Button(savetxt)),
                    addVerticalSpace(10),
                    InkWell(onTap: () {}, child: redButton(delettxt)),
                  ],
                ),
              ),
            )));
  }

  // Future<void> postLabourMaster() async {
  //   print(1);
  //   String apiUrl =
  //       'http://lms.muepetro.com/api/UserController1/PostLabourMaster';

  //   // JSON data
  //   Map<String, dynamic> jsonData = {
  //     "Job_Code": "Job_Code",
  //     "Labour_Name": servicenamecon.text.toString(),
  //     "Labour_Group_Id": 1,
  //     "ModelId": 1,
  //     "Model_GroupId": 1,
  //     "BrandId": 1,
  //     "Sac_Code_Id": 1,
  //     "Sac_Code": "Sac_Code",
  //     "Igst": igst.text,
  //     "Cgst": cgst.text,
  //     "Sgst": sgst,
  //     "Cess": "Cess",
  //     "Mrp": "Mrp",
  //     "Qty": "1",
  //     "Location_Id": 1
  //   };
  //   print(2);
  //   try {
  //     var response = await http.post(
  //       Uri.parse(apiUrl),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode(jsonData),
  //     );
  //     print(3);
  //     if (response.statusCode == 200) {
  //       print('Post request successful');
  //       print('Response: ${response.body}');
  //       // Show success Snackbar
  //       Get.snackbar('Success', 'Post request successful');
  //     } else {
  //       print('Failed to send POST request');
  //       print('Status code: ${response.statusCode}');
  //       print('Response: ${response.body}');
  //       // Show error Snackbar
  //       Get.snackbar('Error', 'Failed to send POST request');
  //     }
  //     print(4);
  //   } catch (e) {
  //     // Error occurred
  //     print('Error: $e');
  //   }
  // }
  Future<void> postLabourMaster() async {
    print(1);
    String apiUrl =
        'http://lms.muepetro.com/api/UserController1/PostLabourMaster';

    String serviceName = servicenamecon.text.toString();
    String igstValue = igst.text;
    String cgstValue = cgst.text;
    String sgstValue = sgst.text;

    // JSON data
    Map<String, dynamic> jsonData = {
      "Job_Code": servicecodecon.text.toString(),
      "Labour_Name": serviceName,
      "Labour_Group_Id": 1,
      "ModelId": 1,
      "Model_GroupId": 1,
      "BrandId": 1,
      "Sac_Code_Id": 1,
      "Sac_Code": "Sac_Code",
      "Igst": igstValue,
      "Cgst": cgstValue,
      "Sgst": sgstValue,
      "Cess": "Cess",
      "Mrp": "Mrp",
      "Qty": "1",
      "Location_Id": 1
    };
    print(2);
    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(jsonData),
      );
      print(3);
      if (response.statusCode == 200) {
        print('Post request successful');
        print('Response: ${response.body}');
        // Show success Snackbar
        Get.snackbar('Success', 'Post request successful',
            backgroundColor: AppColor.kGreen);
      } else {
        print('Failed to send POST request');
        print('Status code: ${response.statusCode}');
        print('Response: ${response.body}');
        // Show error Snackbar
        Get.snackbar('Error', 'Failed to send POST request');
      }
      print(4);
    } catch (e) {
      // Error occurred
      print('Error: $e');
    }
  }

  Future<void> HsnIdScreenapi() async {
    final url =
        Uri.parse('http://lms.muepetro.com/api/UserController1/GetHSNMaster');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Websitmodal> selecthsnList =
            websitmodalFromJson(response.body);
        setState(() {
          hsnModels = selecthsnList
              .map((item) => {
                    'hsn_Id': item.hsnId,
                    'hsn_Code': item.hsnCode,
                    'igst': item.igst,
                    'cgst': item.cgst,
                    'sgst': item.sgst,
                  })
              .toList();
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
