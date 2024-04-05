// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';
// // ignore: unused_import
// import 'package:autowheelapp/utils/color/Appcolor.dart';
// import 'package:autowheelapp/utils/widget/widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // ignore: unnecessary_import
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class Group1Screen extends StatefulWidget {
//   final int SourecID;
//   final int? getclassvalue;

//   Group1Screen({Key? key, required this.SourecID, this.getclassvalue})
//       : super(key: key);

//   @override
//   State<Group1Screen> createState() => _Group1ScreenState();
// }

// class _Group1ScreenState extends State<Group1Screen> {
//   TextEditingController Groupcontroller = TextEditingController();
//   TextEditingController SearchController = TextEditingController();
//   bool isSearchMode = false;
//   late List<Map<String, dynamic>> filteredData = [];
//   @override
//   void initState() {
//     super.initState();
//     // postData();
//     fetchModelData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Add Group"),
//         toolbarHeight: 36,

//         elevation: 2,
//         backgroundColor: AppColor.kGreen, // Change this to your desired color
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context, "refresh");
//             },
//             icon: Icon(Icons.arrow_back)),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               textformfiles(Groupcontroller,
//                   labelText: "Add Group",
//                   suffixIcon: IconButton(
//                       onPressed: () {
//                         fetchModelData();
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               content: textformfiles(
//                                 SearchController,
//                                 hintText: "Model Edit",
//                               ),
//                               actions: <Widget>[
//                                 Column(
//                                   children: [
//                                     SizedBox(
//                                       width: 200,
//                                       height: 300,
//                                       child: ListView.builder(
//                                         shrinkWrap: true,
//                                         scrollDirection: Axis.vertical,
//                                         physics: BouncingScrollPhysics(),
//                                         itemCount: filteredData.length,
//                                         itemBuilder: (context, index) {
//                                           if (filteredData.isEmpty) {
//                                             return Center(
//                                               child: Text(
//                                                 'No data found',
//                                                 style:
//                                                     TextStyle(fontSize: 18),
//                                               ),
//                                             );
//                                           } else {
//                                             return ListTile(
//                                               title: Text(
//                                                 filteredData[index]['name'] ??
//                                                     'No Name Found',
//                                               ),
//                                               onTap: () {
//                                                 setState(() {
//                                                   SearchController.text =
//                                                       filteredData[index]
//                                                               ['name'] ??
//                                                           '';
//                                                 });
//                                               },
//                                             );
//                                           }
//                                         },
//                                       ),
//                                     ),
//                                     Button("save"),
//                                     addVerticalSpace(5),
//                                     redButton("Del..")
//                                   ],
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                       },
//                       icon: Icon(
//                         Icons.search,
//                         color: AppColor.kBlack,
//                       ))),

//               SizedBox(height: 30),
//               GestureDetector(
//                   onTap: () {
//                     postData();
//                   },
//                   child: Button("Save")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> fetchModelData() async {
//     final url = Uri.parse(
//         'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=${widget.SourecID}');
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         if (jsonData is List) {
//           setState(() {
//             filteredData = List<Map<String, dynamic>>.from(jsonData);
//           });
//         } else {
//           print('Response is not a List');
//         }
//       } else {
//         print('Request failed with status: ${response.statusCode}');
//         print('Response Data: ${response.body}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<void> postData() async {
//     final url =
//         Uri.parse('http://lms.muepetro.com/api/UserController1/PostMiscMaster');
//     final data = {
//       "Name": Groupcontroller.text,
//       "LocationId": 2,
//       "MiscMasterId": widget.SourecID,
//     };
//     try {
//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(data),
//       );
//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         if (responseData['result'] == true) {
//           Get.snackbar("Success", "Details saved successfully",
//               backgroundColor: Colors.green,
//               colorText: Colors.white,
//               snackPosition: SnackPosition.BOTTOM);
//           Navigator.pop(context);
//         } else if (responseData['message'] == "Name already exists") {
//           Get.snackbar(
//               "Error", "Name already exists. Please use a different name.",
//               backgroundColor: Colors.red,
//               colorText: Colors.white,
//               snackPosition: SnackPosition.BOTTOM);
//         } else {
//           Get.snackbar("Error", "An error occurred while saving the details",
//               backgroundColor: Colors.red,
//               colorText: Colors.white,
//               snackPosition: SnackPosition.BOTTOM);
//         }
//       } else {
//         print('Request failed with status: ${response.statusCode}');
//         print('Response Data: ${response.body}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<void> deleteMiscMaster(int id) async {
//     String apiUrl =
//         'http://lms.muepetro.com/api/UserController1/DeleteMiscMasterById?Id=$id';

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );

//       if (response.statusCode == 200) {
//         print('Record with ID $id deleted successfully');
//       } else {
//         // Request failed, handle error
//         print('Failed with status code: ${response.statusCode}');
//         print('Error message: ${response.body}');
//       }
//     } catch (error) {
//       // Handle exceptions
//       print('Error occurred: $error');
//     }
//   }
// }
import 'dart:convert';

import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Group1Screen extends StatefulWidget {
  final int SourecID;
  final int? getclassvalue;

  Group1Screen({
    Key? key,
    required this.SourecID,
    this.getclassvalue,
  }) : super(key: key);

  @override
  State<Group1Screen> createState() => _Group1ScreenState();
}

class _Group1ScreenState extends State<Group1Screen> {
  TextEditingController Groupcontroller = TextEditingController();
  TextEditingController SearchController = TextEditingController();
  late List<Map<String, dynamic>> filteredData = [];

  @override
  void initState() {
    super.initState();
    fetchModelData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Group"),
        backgroundColor: AppColor.kappabrcolr,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            textformfiles(
              Groupcontroller,
              labelText: "Add Group",
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  fetchModelData();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Center(
                        child: SingleChildScrollView(
                          child: AlertDialog(
                            content: textformfiles(SearchController,
                                labelText: "Edit & Delete"),
                            actions: <Widget>[
                              Column(
                                children: [
                                  SizedBox(
                                    width: 200,
                                    height: 350,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics: BouncingScrollPhysics(),
                                      itemCount: filteredData.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(
                                            filteredData[index]['name'] ??
                                                'No Name Found',
                                          ),
                                          onTap: () async {
                                            setState(() {
                                              SearchController.text =
                                                  filteredData[index]['name'] ??
                                                      '';
                                            });

                                            updateMiscMaster(
                                              filteredData[index]['id'],
                                              SearchController.text.toString(),
                                            );
                                            fetchModelData();
                                          },
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                width: 25,
                                                child: IconButton(
                                                  icon: Icon(Icons.delete),
                                                  onPressed: () {
                                                    // updateMiscMaster(
                                                    //   filteredData[index]['id'],
                                                    //   SearchController.text.toString(),
                                                    // );
                                                    deleteMiscMaster(
                                                        filteredData[index]
                                                            ['id']);
                                                    Navigator.pop(context);
                                                    // filteredData[index][0]['id'];
                                                    // filteredData[index]['name']; // Pas
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                                child: IconButton(
                                                  icon: Icon(Icons.edit),
                                                  onPressed: () {
                                                    updateMiscMaster(
                                                      filteredData[index]['id'],
                                                      SearchController.text
                                                          .toString(),
                                                    );
                                                    // deleteMiscMaster(
                                                    //     filteredData[index]
                                                    //         ['id']);
                                                    // filteredData[index][0]['id'];
                                                    // filteredData[index]['name']; // Pas
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Button("Save")
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            addVerticalSpace(10),
            GestureDetector(
                onTap: () {
                  postData();
                },
                child: Button("save")),
          ],
        ),
      ),
    );
  }

  Future<void> fetchModelData() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=${widget.SourecID}');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData is List) {
          setState(() {
            filteredData = List<Map<String, dynamic>>.from(jsonData);
          });
        } else {
          print('Response is not a List');
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> postData() async {
    final url =
        Uri.parse('http://lms.muepetro.com/api/UserController1/PostMiscMaster');
    final data = {
      "Name": Groupcontroller.text,
      "LocationId": 2,
      "MiscMasterId": widget.SourecID,
    };
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['result'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Details saved successfully"),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        } else if (responseData['message'] == "Name already exists") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text("Name already exists. Please use a different name."),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("An error occurred while saving the details"),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> deleteMiscMaster(int id) async {
    String apiUrl =
        'http://lms.muepetro.com/api/UserController1/DeleteMiscMasterById?Id=$id';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Record with ID $id deleted successfully"),
            backgroundColor: Colors.green,
          ),
        );
        fetchModelData();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to delete record with ID $id"),
            backgroundColor: Colors.red,
          ),
        );
        print('Failed with status code: ${response.statusCode}');
        print('Error message: ${response.body}');
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error occurred: $error"),
          backgroundColor: Colors.red,
        ),
      );
      print('Error occurred: $error');
    }
  }

  Future<void> updateMiscMaster(int id, String newName) async {
    String apiUrl =
        'http://lms.muepetro.com/api/UserController1/UpdateMiscMasterById?Id= $id';

    Map<String, dynamic> requestBody = {
      "Name": newName,
      "MiscMasterId": widget.SourecID,
      "LocationId": 12,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Record with ID  updated successfully"),
            backgroundColor: Colors.green,
          ),
        );
        fetchModelData();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to update record with ID"),
            backgroundColor: Colors.red,
          ),
        );
        print('Failed with status code: ${response.statusCode}');
        print('Error message: ${response.body}');
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error occurred: $error"),
          backgroundColor: Colors.red,
        ),
      );
      print('Error occurred: $error');
    }
  }
}


// import 'dart:convert';
// import 'package:autowheelapp/utils/color/Appcolor.dart';
// import 'package:autowheelapp/utils/widget/widget.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Group1Screen extends StatefulWidget {
//   final int SourecID;
//   final int? getclassvalue;

//   Group1Screen({
//     Key? key,
//     required this.SourecID,
//     this.getclassvalue,
//   }) : super(key: key);

//   @override
//   State<Group1Screen> createState() => _Group1ScreenState();
// }

// class _Group1ScreenState extends State<Group1Screen> {
//   TextEditingController Groupcontroller = TextEditingController();
//   TextEditingController SearchController = TextEditingController();
//   late List<Map<String, dynamic>> filteredData = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchModelData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Add Group"),
//         backgroundColor: AppColor.kappabrcolr,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           children: [
//             textformfiles(
//               Groupcontroller,
//               labelText: "Add Group",
//               suffixIcon: IconButton(
//                 icon: Icon(Icons.search),
//                 onPressed: () {
//                   fetchModelData();
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         content: textformfiles(
//                           SearchController,
//                           hintText: "Model Edit",
//                         ),
//                         actions: <Widget>[
//                           Column(
//                             children: [
//                               SizedBox(
//                                 width: 200,
//                                 height: 320,
//                                 child: ListView.builder(
//                                   shrinkWrap: true,
//                                   scrollDirection: Axis.vertical,
//                                   physics: BouncingScrollPhysics(),
//                                   itemCount: filteredData.length,
//                                   itemBuilder: (context, index) {
//                                     return ListTile(
//                                       title: Text(
//                                         filteredData[index]['name'] ??
//                                             'No Name Found',
//                                       ),
//                                       onTap: () {
//                                         setState(() {
//                                           SearchController.text =
//                                               filteredData[index]['name'] ?? '';
//                                         });
//                                       },
//                                       trailing: IconButton(
//                                         icon: Icon(Icons.delete),
//                                         onPressed: () {
//                                           deleteMiscMaster(
//                                               filteredData[index]['id']);
//                                         },
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                               Button("Edit")
//                             ],
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 30),
//             GestureDetector(
//                 onTap: () {
//                   postData();
//                 },
//                 child: Button('Save')),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> fetchModelData() async {
//     final url = Uri.parse(
//         'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=${widget.SourecID}');
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         if (jsonData is List) {
//           setState(() {
//             filteredData = List<Map<String, dynamic>>.from(jsonData);
//           });
//         } else {
//           print('Response is not a List');
//         }
//       } else {
//         print('Request failed with status: ${response.statusCode}');
//         print('Response Data: ${response.body}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<void> postData() async {
//     final url =
//         Uri.parse('http://lms.muepetro.com/api/UserController1/PostMiscMaster');
//     final data = {
//       "Name": Groupcontroller.text,
//       "LocationId": 2,
//       "MiscMasterId": widget.SourecID,
//     };
//     try {
//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(data),
//       );
//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         if (responseData['result'] == true) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text("Details saved successfully"),
//               backgroundColor: Colors.green,
//             ),
//           );
//           Navigator.pop(context);
//         } else if (responseData['message'] == "Name already exists") {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content:
//                   Text("Name already exists. Please use a different name."),
//               backgroundColor: Colors.red,
//             ),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text("An error occurred while saving the details"),
//               backgroundColor: Colors.red,
//             ),
//           );
//         }
//       } else {
//         print('Request failed with status: ${response.statusCode}');
//         print('Response Data: ${response.body}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<void> deleteMiscMaster(int id) async {
//     String apiUrl =
//         'http://lms.muepetro.com/api/UserController1/DeleteMiscMasterById?Id=$id';

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );

//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("Record with ID $id deleted successfully"),
//             backgroundColor: Colors.green,
//           ),
//         );
//         fetchModelData();
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("Failed to delete record with ID $id"),
//             backgroundColor: Colors.red,
//           ),
//         );
//         print('Failed with status code: ${response.statusCode}');
//         print('Error message: ${response.body}');
//       }
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Error occurred: $error"),
//           backgroundColor: Colors.red,
//         ),
//       );
//       print('Error occurred: $error');
//     }
//   }

//   Future<void> updateMiscMaster() async {
//     String apiUrl =
//         'http://lms.muepetro.com/api/UserController1/UpdateMiscMasterById';

//     // Define your request body
//     Map<String, dynamic> requestBody = {
//       "Name": "SalesMan",
//       "LocationId": 12,
//       "MiscMasterId": 27
//     };

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(requestBody),
//       );

//       if (response.statusCode == 200) {
//         print('API Response: ${response.body}');
//       } else {
//         print('Failed with status code: ${response.statusCode}');
//         print('Error message: ${response.body}');
//       }
//     } catch (error) {
//       print('Error occurred: $error');
//     }
//   }
// }
