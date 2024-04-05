// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Editanddeleat extends StatefulWidget {
//   const Editanddeleat({super.key});

//   @override
//   State<Editanddeleat> createState() => _EditanddeleatState();
// }

// TextEditingController Groupcontroller = TextEditingController();
// TextEditingController SearchController = TextEditingController();
// late List<Map<String, dynamic>> filteredData = [];

// class _EditanddeleatState extends State<Editanddeleat> {
//   @override
//   void initState() {
//     super.initState();
//     fetchModelData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   children: [
//                     TextField(
//                       controller: Groupcontroller,
//                       decoration: InputDecoration(
//                         labelText: "Add Group",
//                         suffixIcon: IconButton(
//                           icon: Icon(Icons.search),
//                           onPressed: () {
//                             fetchModelData();
//                             showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   content: TextField(
//                                     controller: SearchController,
//                                     decoration: InputDecoration(
//                                       hintText: "Model Edit",
//                                     ),
//                                   ),
//                                   actions: <Widget>[
//                                     SingleChildScrollView(
//                                       child: Column(
//                                         children: [
//                                           SizedBox(
//                                             width: 200,
//                                             height: 320,
//                                             child: ListView.builder(
//                                               shrinkWrap: true,
//                                               scrollDirection: Axis.vertical,
//                                               physics: BouncingScrollPhysics(),
//                                               itemCount: filteredData.length,
//                                               itemBuilder: (context, index) {
//                                                 return ListTile(
//                                                   title: Text(
//                                                     filteredData[index]
//                                                             ['name'] ??
//                                                         'No Name Found',
//                                                   ),
//                                                   onTap: () async {
//                                                     setState(() {
//                                                       SearchController.text =
//                                                           filteredData[index]
//                                                                   ['name'] ??
//                                                               '';
//                                                     });

//                                                     await updateMiscMaster(
//                                                       filteredData[index]['id'],
//                                                       filteredData[index][
//                                                           'name'], // Pass the updated name
//                                                     );
//                                                     // Refresh data after updating
//                                                     fetchModelData();
//                                                   },
//                                                   trailing: IconButton(
//                                                     icon: Icon(Icons.delete),
//                                                     onPressed: () {
//                                                       deleteMiscMaster(
//                                                           filteredData[index]
//                                                               ['id']);
//                                                     },
//                                                   ),
//                                                 );
//                                               },
//                                             ),
//                                           ),
//                                           ElevatedButton(
//                                             onPressed: () async {},
//                                             child: Text("Edit"),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     GestureDetector(
//                       onTap: () {},
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         child: Text('Save'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> fetchModelData() async {
//     final url = Uri.parse(
//         'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=17');
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

//   Future<void> updateMiscMaster(int id, String newName) async {
//     String apiUrl =
//         'http://lms.muepetro.com/api/UserController1/UpdateMiscMasterById';

//     // Define your request body
//     Map<String, dynamic> requestBody = {
//       "Name": newName, // Use the updated name
//       "LocationId": 2,
//       "MiscMasterId": id, // Use the provided ID
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
// }

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class EditAndDelete extends StatefulWidget {
//   const EditAndDelete({Key? key}) : super(key: key);

//   @override
//   State<EditAndDelete> createState() => _EditAndDeleteState();
// }

// class _EditAndDeleteState extends State<EditAndDelete> {
//   TextEditingController groupController = TextEditingController();
//   TextEditingController searchController = TextEditingController();
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
//         title: Text('MiscMaster Editor'),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               TextField(
//                 controller: groupController,
//                 decoration: InputDecoration(
//                   labelText: "Add Group",
//                   suffixIcon: IconButton(
//                     icon: Icon(Icons.search),
//                     onPressed: () {
//                       fetchModelData();
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             content: TextField(
//                               controller: searchController,
//                               decoration: InputDecoration(
//                                 hintText: "Model Edit",
//                               ),
//                             ),
//                             actions: <Widget>[
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
//                                       onTap: () async {
//                                         setState(() {
//                                           searchController.text =
//                                               filteredData[index]['name'] ?? '';
//                                           // groupController.text =
//                                           //     filteredData[index]['name'] ?? '';
//                                         });
//                                         // Navigator.pop(
//                                         //     context); // Close the dialog
//                                       },
//                                       trailing: IconButton(
//                                         icon: Icon(Icons.edit),
//                                         onPressed: () {
//                                           updateMiscMaster(
//                                             filteredData[index]['id'],
//                                             searchController.text.toString(),
//                                             index,
//                                           );
//                                         },
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> fetchModelData() async {
//     final url = Uri.parse(
//         'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=28');
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

//   Future<void> updateMiscMaster(int id, String newName, int index) async {
//     String apiUrl =
//         'http://lms.muepetro.com/api/UserController1/UpdateMiscMasterById';

//     Map<String, dynamic> requestBody = {
//       "Name": newName,
//       "MiscMasterId": id,
//       "LocationId": 12,
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
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("Record with ID $id updated successfully"),
//             backgroundColor: Colors.green,
//           ),
//         );
//         fetchModelData();
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("Failed to update record with ID $id"),
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
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditAndDelete extends StatefulWidget {
  const EditAndDelete({Key? key}) : super(key: key);

  @override
  State<EditAndDelete> createState() => _EditAndDeleteState();
}

class _EditAndDeleteState extends State<EditAndDelete> {
  TextEditingController groupController = TextEditingController();
  TextEditingController searchController = TextEditingController();
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
        title: Text('MiscMaster Editor'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: groupController,
                decoration: InputDecoration(
                  labelText: "Add Group",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      fetchModelData();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: "Model Edit",
                              ),
                            ),
                            actions: <Widget>[
                              SizedBox(
                                width: 200,
                                height: 320,
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
                                          searchController.text =
                                              filteredData[index]['name'] ?? '';
                                        });
                                      },
                                      trailing: IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          updateMiscMaster(
                                            filteredData[index]['id'],
                                            searchController.text.toString(),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> fetchModelData() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=28');
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

  Future<void> updateMiscMaster( int id ,String newName) async {
    String apiUrl =
        'http://lms.muepetro.com/api/UserController1/UpdateMiscMasterById?Id= $id';

    Map<String, dynamic> requestBody = {
      "Name": newName,
      "MiscMasterId": 28,
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


// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Editanddeleat extends StatefulWidget {
//   const Editanddeleat({Key? key}) : super(key: key);

//   @override
//   State<Editanddeleat> createState() => _EditanddeleatState();
// }

// class _EditanddeleatState extends State<Editanddeleat> {
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
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   children: [
//                     TextField(
//                       controller: Groupcontroller,
//                       decoration: InputDecoration(
//                         labelText: "Add Group",
//                         suffixIcon: IconButton(
//                           icon: Icon(Icons.search),
//                           onPressed: () {
//                             fetchModelData();
//                             showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   content: TextField(
//                                     // onChanged: (e){sear},
//                                     controller: SearchController,
//                                     decoration: InputDecoration(
//                                       hintText: "Model Edit",
//                                     ),
//                                   ),
//                                   actions: <Widget>[
//                                     SingleChildScrollView(
//                                       child: Column(
//                                         children: [
//                                           SizedBox(
//                                             width: 200,
//                                             height: 320,
//                                             child: ListView.builder(
//                                               shrinkWrap: true,
//                                               scrollDirection: Axis.vertical,
//                                               physics: BouncingScrollPhysics(),
//                                               itemCount: filteredData.length,
//                                               itemBuilder: (context, index) {
//                                                 return ListTile(
//                                                   title: Text(
//                                                     filteredData[index]
//                                                             ['name'] ??
//                                                         'No Name Found',
//                                                   ),
//                                                   onTap: () async {
//                                                     setState(() {
//                                                       SearchController.text =
//                                                           filteredData[index]
//                                                                   ['name'] ??
//                                                               '';
//                                                       Groupcontroller.text =
//                                                           filteredData[index]
//                                                                   ['name'] ??
//                                                               '';
//                                                     });
//                                                     // Navigator.pop(
//                                                     //     context); // Close the dialog
//                                                   },
//                                                   trailing: IconButton(
//                                                     icon: Icon(Icons.edit),
//                                                     onPressed: () {
//                                                       updateMiscMaster(
//                                                         filteredData[index]
//                                                             ['id'],
//                                                         SearchController.text
//                                                             .toString(),
//                                                         index,
//                                                       );
//                                                       // deleteMiscMaster(
//                                                       //     filteredData[index]
//                                                       //         ['id']
//                                                       //         );
//                                                     },
//                                                   ),
//                                                 );
//                                               },
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> fetchModelData() async {
//     final url = Uri.parse(
//         'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=28');
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

//   Future<void> updateMiscMaster(int id, String newName, int index) async {
//     print(1);
//     String apiUrl =
//         'http://lms.muepetro.com/api/UserController1/UpdateMiscMasterById=138';

//     Map<String, dynamic> requestBody = {
//       "Name": newName,
//       "MiscMasterId": id,
//       "LocationId": 12,
//     };
//     print(2);
//     try {
//       // Make POST request
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(requestBody),
//       );
//       print(3);
//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("Record with ID $id updated successfully"),
//             backgroundColor: Colors.green,
//           ),
//         );
//         print(4);
//         fetchModelData();
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("Failed to update record with ID $id"),
//             backgroundColor: Colors.red,
//           ),
//         );
//         print(5);
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
// }
