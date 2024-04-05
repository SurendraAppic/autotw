// import 'package:autowheelapp/models/jobclosemodelget.dart';
// import 'package:autowheelapp/screen/Jobcard/Modeldata.dart';
// import 'package:autowheelapp/screen/master/LocationMaster.dart';
// import 'package:autowheelapp/utils/widget/String.dart';
// import 'package:autowheelapp/utils/color/Appcolor.dart';
// import 'package:autowheelapp/utils/widget/widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class JobColseScreen extends StatefulWidget {
//   const JobColseScreen({super.key});

//   @override
//   State<JobColseScreen> createState() => _JobColseScreenState();
// }

// TextEditingController datepickar2 = TextEditingController(
//   text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
// );

// class _JobColseScreenState extends State<JobColseScreen> {
//   late TimeOfDay selectedTime;
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

//   bool isVisible = false;

//   String? selectedModel;
//   int modelid = 0;
//   List<String> modelNames = ['Model Name'];
//   var h, w;
//   int selectedId3 = 0;
//   var loctionid;
//   List<Map<String, dynamic>> Loctionshow = [];

//   TimeOfDay selectedTime2 = TimeOfDay.now();
//   TextEditingController jobcardnumbar = TextEditingController();
//   TextEditingController vihhalcontroler = TextEditingController();
//   TextEditingController Phone = TextEditingController();
//   TextEditingController customer = TextEditingController();

//   var isshow = false;
//   var ischack = false;
//   var isgear = false;
//   var ishomoper = false;
//   var isbrake = false;
//   var isall = false;
//   var iscool = false;
//   var isalldoor = false;
//   var isbattry = false;
//   var isdashbord = false;
//   var iscluth = false;
//   var isclutchgear = false;
//   var isfree = false;
//   var isstrrung = false;
//   var isallhouse = false;
//   var isany = false;
//   var isunderbody = false;
//   var isaxle = false;
//   var istyre = false;
//   var isnoise = false;
//   var iswiper = false;
//   var iscable = false;
//   var isnozzle = false;
//   var iscohc = false;
//   var ischeack = false;
//   var isdemand = false;
//   var isac = false;

//   String generateCheckboxString() {
//     String result = '';
//     result += isshow ? '1' : '0';
//     result += ischack ? '1' : '0';
//     result += isgear ? '1' : '0';
//     result += ishomoper ? '1' : '0';
//     result += isbrake ? '1' : '0';
//     result += isall ? '1' : '0';
//     result += iscool ? '1' : '0';
//     result += isalldoor ? '1' : '0';
//     result += isbattry ? '1' : '0';
//     result += isdashbord ? '1' : '0';
//     //
//     result += iscluth ? '1' : '0';
//     result += isclutchgear ? '1' : '0';
//     result += isfree ? '1' : '0';
//     result += isstrrung ? '1' : '0';
//     result += isallhouse ? '1' : '0';
//     result += isany ? '1' : '0';
//     result += isunderbody ? '1' : '0';
//     result += isaxle ? '1' : '0';
//     result += istyre ? '1' : '0';
//     result += isnoise ? '1' : '0';
//     result += iswiper ? '1' : '0';
//     result += iscable ? '1' : '0';
//     result += isnozzle ? '1' : '0';
//     result += iscohc ? '1' : '0';
//     result += ischeack ? '1' : '0';
//     result += isdemand ? '1' : '0';
//     result += isac ? '1' : '0';

//     return result;
//   }

//   @override
//   void initState() {
//     super.initState();
//     loction();
//     modeldeta();
//     selectedTime = TimeOfDay.now();
//   }

//   @override
//   Widget build(BuildContext context) {
//     w = MediaQuery.of(context).size.width;
//     h = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Job Close"),
//         backgroundColor: AppColor.kappabrcolr,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       padding: EdgeInsets.all(5),
//                       height: 50,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.black54, width: 2),
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: DropdownButton(
//                         underline: Container(),
//                         value: selectedId3,
//                         dropdownColor: const Color.fromARGB(255, 211, 247, 212),
//                         icon: Icon(
//                           Icons.keyboard_arrow_down_outlined,
//                           size: MediaQuery.of(context).size.height * 0.030,
//                           color: Colors.black, // AppColor.kBlack,
//                         ),
//                         isExpanded: true,
//                         items: Loctionshow.map((value) {
//                           return DropdownMenuItem(
//                             value: value['id'],
//                             child: Text(
//                               '${value['id']} -${value['location_Name']}',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: (value) {
//                           setState(() {
//                             selectedId3 = value as int;
//                             loctionid = selectedId3.toString();
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                   addhorizontalSpace(10),
//                   SizedBox(
//                     width: 50,
//                     child: InkWell(
//                       onTap: () {
//                         Get.to(LoctionMaster());
//                       },
//                       child: Container(
//                           height: 50,
//                           width: 50,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Colors.white,
//                             border: Border.all(
//                               width: 2,
//                               color: Colors.black,
//                             ),
//                           ),
//                           child: Icon(
//                             Icons.add,
//                             color: AppColor.kBlack,
//                           )),
//                     ),
//                   )
//                 ],
//               ),
//               addVerticalSpace(10),
//               Row(
//                 children: [
//                   Expanded(
//                       child:
//                           textformfiles(jobcardnumbar, hintText: "Job Card No.")
//                       // textfild("Job Card No.")
//                       ),
//                   addhorizontalSpace(10),
//                   Expanded(
//                       child: InkWell(
//                     onTap: () {
//                       Getjobclose(jobcardnumbar.text.toString(), 2.toInt());
//                     },
//                     child: Container(
//                       height: 47,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                           color: AppColor.kbuttonclr,
//                           borderRadius: BorderRadius.circular(5)),
//                       child: Center(
//                           child: Text(
//                         "Get Details",
//                         style: TextStyle(
//                             fontSize: 22,
//                             color: AppColor.kWhite,
//                             fontWeight: FontWeight.bold),
//                       )),
//                     ),
//                   ))
//                 ],
//               ),
//               addVerticalSpace(10),
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                         readOnly: true,
//                         controller: datepickar2,
//                         decoration: InputDecoration(
//                             contentPadding: EdgeInsets.all(5),
//                             hintText: jobtxt,
//                             prefixIcon: Icon(
//                               Icons.edit_calendar,
//                               color: AppColor.kBlack,
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(5),
//                             )),
//                         onTap: () async {
//                           DateTime date = DateTime(1900);
//                           FocusScope.of(context).requestFocus(FocusNode());
//                           await showDatePicker(
//                                   context: context,
//                                   initialDate: DateTime.now(),
//                                   firstDate: DateTime(1900),
//                                   lastDate: DateTime.now())
//                               .then((selectedDate) {
//                             if (selectedDate != null) {
//                               datepickar2.text =
//                                   DateFormat('dd-MM-yyyy').format(selectedDate);
//                             }
//                           });
//                         }),
//                   ),
//                   addhorizontalSpace(10),
//                   Expanded(
//                       child: InkWell(
//                     onTap: () {
//                       _selectTime2(context);
//                     },
//                     child: Container(
//                       height: 47,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(color: Colors.black),
//                       ),
//                       child: Center(
//                         child: Text(
//                           "${selectedTime.format(context)}",
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ))
//                 ],
//               ),
//               addVerticalSpace(10),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       padding: const EdgeInsets.all(8),
//                       height: 50,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black, width: 2),
//                           borderRadius: BorderRadius.circular(5)),
//                       child: DropdownButton(
//                         underline: Container(),
//                         value: selectedModel,
//                         dropdownColor: const Color.fromARGB(255, 211, 247, 212),
//                         icon: Icon(Icons.keyboard_arrow_down_outlined,
//                             size: h * 0.030, color: Colors.black),
//                         isExpanded: true,
//                         items: modelNames.map((value) {
//                           return DropdownMenuItem(
//                             value: value,
//                             child: Text(
//                               value,
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: (value) {
//                           setState(() {
//                             selectedModel = value as String?;
//                             int index = modelNames.indexOf(selectedModel!);
//                             modelid = index >= 0 ? index + 1 : 0;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                   addhorizontalSpace(10),
//                   SizedBox(
//                     width: 50,
//                     child: InkWell(
//                       onTap: () {
//                         Get.to(Addmodel())!.then((value) => modeldeta());
//                       },
//                       child: Container(
//                           height: 50,
//                           width: 50,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Colors.white,
//                             border: Border.all(
//                               width: 2,
//                               color: Colors.black,
//                             ),
//                           ),
//                           child: Icon(
//                             Icons.add,
//                             color: AppColor.kBlack,
//                           )),
//                     ),
//                   )
//                 ],
//               ),

//               addVerticalSpace(10),
//               textformfiles(vihhalcontroler, hintText: "Vichal No."),
//               addVerticalSpace(10),
//               textformfiles(Phone, hintText: "Phone No."),
//               addVerticalSpace(10),
//               textformfiles(customer, hintText: "Customer No."),
//               addVerticalSpace(10),
//               InkWell(
//                   onTap: () {
//                     setState(() {
//                       isVisible = !isVisible;
//                     });
//                   },
//                   child: Button("Chack List Show")),
//               addVerticalSpace(10),
//               InkWell(
//                   onTap: () {
//                     postJobClose();
//                   },
//                   child: Button("Save")),
//               addVerticalSpace(10),
//               Visibility(
//                 visible: isVisible,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     chackbox(
//                         isshow,
//                         (e) {
//                           setState(() {
//                             isshow = !isshow;
//                           });
//                         },
//                         "Engine Oil leavel",
//                         ischack,
//                         (e) {
//                           setState(() {
//                             ischack = !ischack;
//                           });
//                         },
//                         "Heading and Indicators"),
//                     addVerticalSpace(5),
//                     chackbox(
//                         isgear,
//                         (e) {
//                           setState(() {
//                             isgear = !isgear;
//                           });
//                         },
//                         "gear Oil leaval",
//                         ishomoper,
//                         (e) {
//                           setState(() {
//                             ishomoper = !ishomoper;
//                           });
//                         },
//                         "Hom Operation"),
//                     addVerticalSpace(5),
//                     chackbox(
//                         isbrake,
//                         (e) {
//                           setState(() {
//                             isbrake = !isbrake;
//                           });
//                         },
//                         "Brake fuild leavl",
//                         isall,
//                         (e) {
//                           setState(() {
//                             isall = !isall;
//                           });
//                         },
//                         "All door glass"),
//                     addVerticalSpace(5),
//                     chackbox(
//                         iscool,
//                         (e) {
//                           setState(() {
//                             iscool = !iscool;
//                           });
//                         },
//                         "Battry Water leaval",
//                         isalldoor,
//                         (e) {
//                           setState(() {
//                             isalldoor = !isalldoor;
//                           });
//                         },
//                         "Door dashbord and "),
//                     addVerticalSpace(5),
//                     chackbox(
//                         isbattry,
//                         (e) {
//                           setState(() {
//                             isbattry = !isbattry;
//                           });
//                         },
//                         "clutch and brake\n Paddle free play",
//                         isdashbord,
//                         (e) {
//                           setState(() {
//                             isdashbord = !isdashbord;
//                           });
//                         },
//                         "clutch and \nGear option"),
//                     addVerticalSpace(5),
//                     chackbox(
//                         iscluth,
//                         (e) {
//                           setState(() {
//                             iscluth = !iscluth;
//                           });
//                         },
//                         "Thorottle free play",
//                         isclutchgear,
//                         (e) {
//                           setState(() {
//                             isclutchgear = !isclutchgear;
//                           });
//                         },
//                         "Steering and \nsuspension Noise"),
//                     addVerticalSpace(5),
//                     chackbox(
//                         isfree,
//                         (e) {
//                           setState(() {
//                             isfree = !isfree;
//                           });
//                         },
//                         "All house and grommets",
//                         isstrrung,
//                         (e) {
//                           setState(() {
//                             isstrrung = !isstrrung;
//                           });
//                         },
//                         "any abnormal\n noise"),
//                     addVerticalSpace(5),
//                     chackbox(
//                         isallhouse,
//                         (e) {
//                           setState(() {
//                             isallhouse = !isallhouse;
//                           });
//                         },
//                         "Underbody nut \nboils and leakage",
//                         isany,
//                         (e) {
//                           setState(() {
//                             isany = !isany;
//                           });
//                         },
//                         "Axel Noise"),
//                     addVerticalSpace(5),
//                     chackbox(
//                         isunderbody,
//                         (e) {
//                           setState(() {
//                             isunderbody = !isunderbody;
//                           });
//                         },
//                         "Tyre check(pressure\n and condition)",
//                         isaxle,
//                         (e) {
//                           setState(() {
//                             isaxle = !isaxle;
//                           });
//                         },
//                         "Tyre noise"),
//                     addVerticalSpace(5),
//                     chackbox(
//                         istyre,
//                         (e) {
//                           setState(() {
//                             istyre = !istyre;
//                           });
//                         },
//                         "wiper bottle water leaval",
//                         isnoise,
//                         (e) {
//                           setState(() {
//                             isnoise = !isnoise;
//                           });
//                         },
//                         "battry and cable \ncondition"),
//                     addVerticalSpace(5),
//                     chackbox(
//                         iswiper,
//                         (e) {
//                           setState(() {
//                             iswiper = !iswiper;
//                           });
//                         },
//                         "wiper bollle water-leaval",
//                         iscable,
//                         (e) {
//                           setState(() {
//                             iscable = !iscable;
//                           });
//                         },
//                         "battry and cable \ncondition "),
//                     addVerticalSpace(5),
//                     chackbox(
//                         isnozzle,
//                         (e) {
//                           setState(() {
//                             isnozzle = !isnozzle;
//                           });
//                         },
//                         "wiper spry Nozzle",
//                         iscohc,
//                         (e) {
//                           setState(() {
//                             iscohc = !iscohc;
//                           });
//                         },
//                         "COCh(PUC)"),
//                     addVerticalSpace(5),
//                     chackbox(
//                         ischeack,
//                         (e) {
//                           setState(() {
//                             ischeack = !ischeack;
//                           });
//                         },
//                         "Check inturmental \npanal light and dashb",
//                         isdemand,
//                         (e) {
//                           setState(() {
//                             isdemand = !isdemand;
//                           });
//                         },
//                         "All demanded \nrepair completed\nasper customer\nrequest"),
//                     addVerticalSpace(5),
//                     chackbox(
//                         isac,
//                         (e) {
//                           setState(() {
//                             isac = !isac;
//                           });
//                         },
//                         "Engine Oil leavel",
//                         isdemand,
//                         (e) {
//                           setState(() {
//                             // isdemand = !isdemand;
//                           });
//                         },
//                         "Other"),
//                   ],
//                 ),
//               ),
//               Text(generateCheckboxString()),
//               addVerticalSpace(10),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Row chackbox(bool? Fristchack, Function(bool?)? Fristchange, String txt,
//       bool? Secandchack, Function(bool?)? Secandchange, String txt2) {
//     return Row(
//       children: [
//         Checkbox(value: Fristchack, onChanged: Fristchange),
//         Expanded(child: Text(txt)),
//         Checkbox(value: Secandchack, onChanged: Secandchange),
//         Expanded(child: Text(txt2)),
//       ],
//     );
//   }

//   Future<void> modeldeta() async {
//     print(1);
//     final url = Uri.parse(
//         'http://lms.muepetro.com/api/UserController1/GetVehicleMasterLocationwise?locationid=1');
//     print(2);
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         setState(() {
//           modelNames.clear();
//           modelNames.addAll((jsonData as List)
//               .map((item) => item['model_Name'].toString())
//               .toList());
//           selectedModel = modelNames.isNotEmpty ? modelNames.first : null;
//         });
//         print(3);
//       } else {
//         print('Request failed with status: ${response.statusCode}');
//         // print('Response Data: ${response.body}');
//       }
//     } catch (e) {
//       print('Error: $e');
//       print(4);
//     }
//   }

//   Future<Jobclosemodelget?> Getjobclose(String refno, int locationId) async {
//     final url = Uri.parse(
//         'http://lms.muepetro.com/api/UserController1/GetJobClose?refno=$refno&locationid=$locationId');

//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       try {
//         final data = jsonDecode(response.body) as Map<String, dynamic>;
//         final jobCloseModel = Jobclosemodelget.fromJson(data);
//         vihhalcontroler.text = jobCloseModel.vehicleNo;
//         // generateCheckboxString()  =

//         return jobCloseModel;
//       } catch (error) {
//         print('Error parsing JSON: $error');
//         return null;
//       }
//     } else {
//       throw Exception('Failed to get job close data: ${response.statusCode}');
//     }
//   }

//   Future<void> postJobClose() async {
//     print("1");
//     final String apiUrl =
//         'http://lms.muepetro.com/api/UserController1/PostJobClose?refno=${jobcardnumbar.text}&locationid=2&checklist=${generateCheckboxString()}&jobclosestatus=1';
//     Map<String, dynamic> requestBody = {};
//     print("2");
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         body: jsonEncode(requestBody),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//       print("3");
//       if (response.statusCode == 200) {
//         Get.snackbar(
//           'Success',
//           'Job close request successful',
//           backgroundColor: Colors.green,
//         );
//         print('Job close request successful');
//       } else {
//         print('Failed to close job. Status code: ${response.statusCode}');
//         // print('Response body: ${response.body}');
//         Get.snackbar(
//           'Error',
//           'Job close request  ${response.statusCode}',
//           backgroundColor: Colors.green,
//         );
//         print("4");
//       }
//     } catch (e) {
//       print('Exception occurred while closing job: $e');
//     }
//   }

//   Future<void> loction() async {
//     final url =
//         Uri.parse('http://lms.muepetro.com/api/UserController1/GetLocation');
//     try {
//       final response = await http.get(url);
//       var data = jsonDecode(response.body) as List<dynamic>;
//       // print('API Response: $data');
//       if (response.statusCode == 200) {
//         setState(() {
//           Loctionshow.add({'id': 0, 'location_Name': 'Select a Location'});
//           Loctionshow.addAll(data.cast<Map<String, dynamic>>());
//         });
//       } else {
//         print('Request failed with status: ${response.statusCode}');
//         // print('Response Data: ${response.body}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
// }
// ignore: unused_import
import 'package:autowheelapp/screen/Jobcard/Modeldata.dart';
import 'package:autowheelapp/screen/master/LocationMaster.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';

class Aaaaa {
  final String extra2;
  Aaaaa({required this.extra2});

  factory Aaaaa.fromJson(Map<String, dynamic> json) {
    return Aaaaa(extra2: json['extra2']);
  }
}

class CheckboxItem {
  final String name;
  bool value;

  CheckboxItem({required this.name, required this.value});
}

class JobColseScreen extends StatefulWidget {
  @override
  _JobColseScreenState createState() => _JobColseScreenState();
}

class _JobColseScreenState extends State<JobColseScreen> {
  List<CheckboxItem> checkboxItems = List.generate(
    27,
    (index) => CheckboxItem(name: "Checkbox ${index + 1}", value: false),
  );
  List<String> names = [
    "Name 1",
    "Name 2",
    "Name 3",
    // Add more names as needed
  ];

  final TextEditingController jobcardNumberController = TextEditingController();
  TextEditingController vihhalcontroler = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController customer = TextEditingController();
  late TimeOfDay selectedTime;
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

  TextEditingController datepickar2 = TextEditingController(
    text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
  );
  TimeOfDay selectedTime2 = TimeOfDay.now();

  var h, w;
  int selectedId3 = 0;
  var loctionid;
  String? selectedModel;
  int modelid = 0;
  List<String> modelNames = ['Model Name'];
  List<Map<String, dynamic>> Loctionshow = [];
  bool isVisible = false;
  @override
  void initState() {
    super.initState();
    loction();

    modeldeta();
    selectedTime = TimeOfDay.now();
  }

  Future<void> fetchJobCloseData() async {
    try {
      final jobCloseModel = await getJobClose();
      if (jobCloseModel != null) {
        String receivedBinaryString = jobCloseModel.extra2;
        List<bool> values = receivedBinaryString
            .split('')
            .map((String digit) => digit == '1')
            .toList();
        List<String> names =
            List.generate(27, (index) => 'Checkbox ${index + 1}');
        setState(() {
          checkboxItems = List.generate(
            27,
            (index) => CheckboxItem(name: names[index], value: values[index]),
          );
        });
      } else {
        print('Failed to fetch job close data.');
      }
    } catch (error) {
      print('Error fetching job close data: $error');
    }
  }

  Future<Aaaaa?> getJobClose() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetJobClose?refno=1003&locationid=2');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final jobCloseModel = Aaaaa.fromJson(data);
        return jobCloseModel;
      } catch (error) {
        print('Error parsing JSON: $error');
        return null;
      }
    } else {
      throw Exception('Failed to get job close data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    if (checkboxItems.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Job Close"),
          backgroundColor: AppColor.kappabrcolr,
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Job Close"),
        backgroundColor: AppColor.kappabrcolr,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: AppColor.kBlack,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54, width: 2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButton(
                          underline: Container(),
                          value: selectedId3,
                          dropdownColor:
                              const Color.fromARGB(255, 211, 247, 212),
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: MediaQuery.of(context).size.height * 0.030,
                            color: Colors.black, // AppColor.kBlack,
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
                              loctionid = selectedId3.toString();
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
                          Get.to(LoctionMaster());
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
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButton(
                          underline: Container(),
                          value: selectedModel,
                          dropdownColor:
                              const Color.fromARGB(255, 211, 247, 212),
                          icon: Icon(Icons.keyboard_arrow_down_outlined,
                              size: h * 0.030, color: Colors.black),
                          isExpanded: true,
                          items: modelNames.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedModel = value as String?;
                              int index = modelNames.indexOf(selectedModel!);
                              modelid = index >= 0 ? index + 1 : 0;
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
                          // Get.to(Addmodel())!.then((value) => modeldeta());
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
                        child: textformfiles(jobcardNumberController,
                            labelText: "Job Card No.")),
                    addhorizontalSpace(10),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        fetchJobCloseData();
                      },
                      child: Container(
                        height: 47,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColor.kbuttonclr,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: Text(
                          "Get Details",
                          style: TextStyle(
                              fontSize: 22,
                              color: AppColor.kWhite,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ))
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
                              contentPadding: EdgeInsets.all(5),
                              hintText: jobtxt,
                              prefixIcon: Icon(
                                Icons.edit_calendar,
                                color: AppColor.kBlack,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: AppColor.kBlack),
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
                                datepickar2.text = DateFormat('dd-MM-yyyy')
                                    .format(selectedDate);
                              }
                            });
                          }),
                    ),
                    addhorizontalSpace(10),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        _selectTime2(context);
                      },
                      child: Container(
                        height: 47,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: Colors.black,
                              width: 2), // Border width here
                        ),
                        child: Center(
                          child: Text(
                            "${selectedTime.format(context)}",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ))
                  ],
                ),
                addVerticalSpace(10),
                textformfiles(vihhalcontroler, labelText: "Vichal No."),
                addVerticalSpace(10),
                textformfiles(Phone, labelText: "Phone No."),
                addVerticalSpace(10),
                textformfiles(customer, labelText: "Customer No."),
                addVerticalSpace(10),
                addVerticalSpace(10),
                InkWell(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Button("Chack List Show")),
                addVerticalSpace(10),
                InkWell(
                    onTap: () {
                      postJobClose();
                    },
                    child: Button("Save")),
                Visibility(
                  visible: isVisible,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: checkboxItems.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Text(checkboxItems[index].name),
                        value: checkboxItems[index].value,
                        onChanged: (value) {
                          setState(() {
                            checkboxItems[index].value = value ?? false;
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> postJobClose() async {
    final String jobcardNumber = jobcardNumberController.text;
    final String checklist = generateCheckboxString();
    final String apiUrl =
        'http://lms.muepetro.com/api/UserController1/PostJobClose?refno=${jobcardNumberController.text}&locationid=2&checklist=$checklist&jobclosestatus=1';

    Map<String, dynamic> requestBody = {};

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(requestBody),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Job close request successful',
          backgroundColor: Colors.green,
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to close job: ${response.statusCode}',
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Exception occurred while closing job: $e',
        backgroundColor: Colors.red,
      );
    }
  }

  String generateCheckboxString() {
    return checkboxItems.map((item) => item.value ? '1' : '0').join('');
  }

  @override
  void dispose() {
    jobcardNumberController.dispose();
    super.dispose();
  }

  Future<void> loction() async {
    final url =
        Uri.parse('http://lms.muepetro.com/api/UserController1/GetLocation');
    try {
      final response = await http.get(url);
      var data = jsonDecode(response.body) as List<dynamic>;
      // print('API Response: $data');
      if (response.statusCode == 200) {
        setState(() {
          Loctionshow.add({'id': 0, 'location_Name': 'Select a Location'});
          Loctionshow.addAll(data.cast<Map<String, dynamic>>());
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
        // print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> modeldeta() async {
    print(1);
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetVehicleMasterLocationwise?locationid=1');
    print(2);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          modelNames.clear();
          modelNames.addAll((jsonData as List)
              .map((item) => item['model_Name'].toString())
              .toList());
          selectedModel = modelNames.isNotEmpty ? modelNames.first : null;
        });
        print(3);
      } else {
        print('Request failed with status: ${response.statusCode}');
        // print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
      print(4);
    }
  }
}
