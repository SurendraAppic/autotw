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

class CheckboxScreen extends StatefulWidget {
  @override
  _CheckboxScreenState createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
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
        'http://lms.muepetro.com/api/UserController1/GetJobClose?refno=${jobcardNumberController.text}&locationid=2');

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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     postJobClose();
      //   },
      //   child: Icon(Icons.done),
      // ),
    );
  }

  Future<void> postJobClose() async {
    final String jobcardNumber = jobcardNumberController.text;
    final String checklist = generateCheckboxString();
    final String apiUrl =
        'http://lms.muepetro.com/api/UserController1/PostJobClose?refno=1002&locationid=2&checklist=$checklist&jobclosestatus=1';

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
