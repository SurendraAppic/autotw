import 'package:autowheelapp/controller/getx_controller.dart';
import 'package:autowheelapp/labour/AddLabour.dart';
import 'package:autowheelapp/models/groupmodel.dart';
import 'package:autowheelapp/models/manufacturemodel.dart';
import 'package:autowheelapp/screen/Jobcard/Modeldata.dart';
import 'package:autowheelapp/screen/master/Group1.dart';
import 'package:autowheelapp/screen/master/Ledgermaster.dart';
import 'package:autowheelapp/screen/master/StaffMaster.dart';
import 'package:autowheelapp/showroom/Prosepet.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/widget/Textfid.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:autowheelapp/utils/image/image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import '../../main.dart';

class JobCardScreen extends StatefulWidget {
  const JobCardScreen({super.key});
  @override
  State<JobCardScreen> createState() => _JobCardScreenState();
}

final MainController datacontroller = Get.put(MainController());
String selectedData = '';
var h, w;
var _switchValue = false;
bool index = false;
var visiable = false;
var isgear = false;
var isbrake = false;
var iscool = false;
var isbattry = false;
var iscluth = false;
var isfree = false;
var isallhouse = false;
var isunderbody = false;
var istyre = false;
var iswiper = false;
var isnozzle = false;
var isac = false;
var ischack = false;
DateTime now = DateTime.now();
String currentTime = "${now.hour}:${now.minute}:${now.second}";
TextEditingController datepickar1 = TextEditingController(
  text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
);
TextEditingController datepickar2 = TextEditingController(
  text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
);
TextEditingController nextsearvicesdete = TextEditingController(
  text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
);
TextEditingController insurancedate = TextEditingController(
  text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
);
TextEditingController joboutdeate = TextEditingController(
  text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
);
TextEditingController VehicleController = TextEditingController();
TextEditingController chassisnocontroller = TextEditingController();
TextEditingController EnginController = TextEditingController();
TextEditingController jobcardnumbarcontroller = TextEditingController();
TextEditingController kmscontroller = TextEditingController();
TextEditingController fuelcontroller = TextEditingController();
TextEditingController coupanNumbar = TextEditingController();
final _formaKey = GlobalKey<FormState>();

class _JobCardScreenState extends State<JobCardScreen> {
  late TimeOfDay selectedTime;
  // Api color
  List<Map<String, dynamic>> color = [
    {'id': 0, 'name': 'Colors'}
  ];
  List<Map<String, dynamic>> SearviceType = [
    {'id': 0, 'name': 'Service type*'}
  ];
  String selectedSearviceName = "Service type*";
  int? selectedSearviceId;
  // Api searvice numbar
  List<Map<String, dynamic>> SearviceNumbar = [
    {'id': 0, 'name': 'Service Number*'}
  ];
  String selectedSearviceNumbarName = "Service Number*";
  int? selectedSearviceNumbarId;
  // api machanic
  List<Map<String, dynamic>> SelectMachanic = [
    {'id': 0, 'name': 'Select Machanic*'}
  ];
  TextEditingController managerController = TextEditingController();
  int managerId = 0;
  Map<String, dynamic>? selectedManagerValue;
  List<Map<String, dynamic>> workManager = [
    {'id': 0, 'name': 'Select Manager*'}
  ];

  List<Map<String, dynamic>> manufacturers = [];
  List<Map<String, dynamic>> modelvalue = [];
  Map<String, dynamic>? selectedManufacturer;
  String? selectedModel;
  int modelid = 0;
  List<String> modelNames = ['Model Name'];
  TextEditingController modelController = TextEditingController();
  // int Manufacturerid = 0;
  Map<String, dynamic>? modelidValue;
  TimeOfDay selectedTime2 = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

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

  List<Map<String, dynamic>> drop = [
    {'id': 0, 'name': 'Sourch'}
  ];

  Map<String, dynamic>? selecteddropValue;
  int? selecteddropId;
  final TextEditingController dropController = TextEditingController();
  TextEditingController ManufacturerController = TextEditingController();
  int Manufacturerid = 0;
  Map<String, dynamic>? selectedManufacturerValue;
  TextEditingController ColorController = TextEditingController();
  // api
  TextEditingController manchaniccontroller = TextEditingController();
  int manchanicid = 0;
  Map<String, dynamic>? selectedmanchanicValue;

  int Colorid = 0;
  Map<String, dynamic>? selectedcolorValue;

  void clearValues() {
    VehicleController.clear();
    coupanNumbar.clear();
    fuelcontroller.clear();
    EnginController.clear();
    chassisnocontroller.clear();
    Addresscontroller.clear();
    kmscontroller.clear();
    manchaniccontroller.clear();
    selectedmanchanicValue = null;
    selectedcolorValue = null;
    selectedManufacturerValue = null;
    selecteddropValue = null;
    selectedcolorValue = null;
    selectedManagerValue = null;
    selectedModel = null;
  }

  Future<void> postJobCard() async {
    final String checklist = generateCheckboxString();
    print(1);
    String apiUrl = 'http://lms.muepetro.com/api/UserController1/PostJobCard';
    try {
      Map<String, dynamic> requestData = {
        "Location_Id": 2,
        "Prefix_Name": "online",
        "Job_No": int.parse(jobcardnumbarcontroller.text),
        "Job_Date": datepickar1.text.toString(),
        "Vehicle_No": VehicleController.text ?? "",
        "Chassis_No": chassisnocontroller.text.toString() ?? "",
        "Engine_No": EnginController.text.toString() ?? "",
        "Model_Id": modelid,
        "Colour_Id": Colorid ?? 0,
        "Source_Id": selecteddropId ?? 0,
        "Service_type_id": 1,
        "Coupon_No": coupanNumbar.text.toString() ?? "",
        "Service_No": "${selectedSearviceNumbarId}",
        "Kms": kmscontroller.text.toString(),
        "Fuel": fuelcontroller.text.toString(),
        "Vehicle_Sold": datepickar2.text.toString(),
        "Mechanic_Id": manchanicid ?? 0,
        "Work_Mgr_Id": managerId ?? 0,
        "Ledger_Id": Manufacturerid ?? 0,
        "Customer_Name": selectedManufacturerValue.toString() ?? "",
        "Job_In": datepickar2.text.toString(),
        "Job_InTime": "",
        "Job_Out": joboutdeate.text.toString(),
        "Job_OutTime": "${selectedTime2.hour}:${selectedTime2.minute}",
        "Customer_Voice": "Customer_Voice",
        "Job_Status": "Job_Status",
        "Next_ServiceInDays": "Next_ServiceInDays",
        "Next_ServiceOnDate": nextsearvicesdete.text.toString() ?? "",
        "Insurance_Renewal": insurancedate.text.toString() ?? "",
        "Remarks": "Remarks",
        "Extra1": "${checklist}",
        "Extra2": "Extra2",
        "Extra3": "Extra3",
        "Extra4": "Extra4",
        "JobCard_Items": labourList
      };

      print(2);

      String requestBody = json.encode(requestData);

      http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: requestBody,
      );
      print(3);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        if (response.statusCode == 200) {
          Map<String, dynamic> responseData = json.decode(response.body);
          bool result = responseData['result'];
          String message = responseData['message'];

          if (result) {
            Get.snackbar(
              "Success",
              message,
              backgroundColor: AppColor.kGreen,
              duration: Duration(seconds: 5),
            );
            clearValues();
            datacontroller.clearvalue();

            Navigator.pop(context);
          } else {
            Get.snackbar(
              "Error",
              message,
              backgroundColor: AppColor.kRed,
              duration: Duration(seconds: 5),
            );
          }
        } else {
          print('Error: ${response.statusCode}');
          print('Response: ${response.body}');

          Get.snackbar(
            "Error",
            "Failed to post job card. Error: ${response.statusCode}",
            duration: Duration(seconds: 5),
          );
        }
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  Future<void> getjobcard() async {
    print(1);
    final String jobnum = jobcardnumbarcontroller.text;
    final String apiUrl =
        'http://lms.muepetro.com/api/UserController1/GetJobCard?prefix=online&refno=$jobnum&locationid=2';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          VehicleController.text = data['vehicle_No'] ?? '';
          chassisnocontroller.text = data['chassis_No'] ?? '';
          EnginController.text = data['engine_No'] ?? '';
          kmscontroller.text = data['kms'] ?? '';
          fuelcontroller.text = data['fuel'] ?? '';
          coupanNumbar.text = data['coupon_No'] ?? '';
          datepickar1.text = data['job_Date'] ?? '';
          datepickar2.text = data['job_In'] ?? '';
          joboutdeate.text = data['job_Out'] ?? '';
          nextsearvicesdete.text = data['next_ServiceOnDate'] ?? '';
          joboutdeate.text = data['job_Out'] ?? '';
          insurancedate.text = data['insurance_Renewal'] ?? '';
          managerId = data['work_Mgr_Id'] ?? 0;
          selecteddropId = data['source_Id'] ?? 0;
          manchanicid = data['mechanic_Id'] ?? 0;
          selectedmanchanicValue = SelectMachanic.firstWhere(
            (mechanic) => mechanic['id'] == manchanicid,
          );
          managerId = data['work_Mgr_Id'] ?? 0;
          selectedManagerValue = workManager.firstWhere(
            (manager) => manager['id'] == managerId,
          );
          selecteddropId = data['source_Id'] ?? 0;
          selecteddropValue = drop.firstWhere(
            (drop) => drop['id'] == selecteddropId,
          );
          Manufacturerid = data['ledger_Id'] ?? 0;
          selectedManufacturerValue = manufacturers.firstWhere(
            (manufature) => manufature['id'] == Manufacturerid,
          );
          Colorid = data['colour_Id'] ?? 0;
          selectedcolorValue = color.firstWhere(
            (color) => color['id'] == Colorid,
          );
        });
        modelid = data['model_Id'] ?? 0;

        modelidValue = modelvalue.firstWhere(
          (model) => model['model_Id'] == modelid,
        );
      } else {
        print('Error Response: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  late TextEditingController joboutdeate;
  late TextEditingController numberOfDaysController;

  @override
  void dispose() {
    joboutdeate.dispose();
    numberOfDaysController.dispose();
    super.dispose();
    datacontroller.clearvalue();
  }

  void updateDate(int numberOfDays) {
    DateTime currentDate = DateTime.now();
    DateTime newDate = currentDate.add(Duration(days: numberOfDays));
    setState(() {
      joboutdeate.text = DateFormat('dd-MM-yyyy').format(newDate);
    });
  }

  refreshData() async {
    await colorDeta();
    SearviceNumbarDeta();
    SelectMachanicDeta();
    fetchWorkManager();
    CoustomerDetails();
    sourceDeta();
  }

  @override
  void initState() {
    joboutdeate = TextEditingController(
      text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
    );
    numberOfDaysController = TextEditingController();
    super.initState();
    selectedTime = TimeOfDay.now();
    startTimer();
    selectedTime2;
    colorDeta();
    SearviceNumbarDeta();
    SelectMachanicDeta();
    fetchWorkManager();
    CoustomerDetails();
    sourceDeta();
    prefixdeta();
    fetchModelData();
  }

  void startTimer() {
    Timer.periodic(Duration(minutes: 1), (Timer timer) {
      setState(() {
        selectedTime = TimeOfDay.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  getjobcard();
                },
                child: Text("Find"),
              ))
        ],
        leading: BackButton(color: AppColor.kBlack),
        centerTitle: true,
        toolbarHeight: 40,
        title: Text(
          jobcardtxt,
          style: TextStyle(color: AppColor.kBlack, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColor.kappabrcolr,
      ),
      body: Container(
        color: AppColor.kappabrcolr.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formaKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  addVerticalSpace(10),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                            readOnly: true,
                            controller: datepickar1,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColor.kWhite,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.black),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 5.0, color: Colors.red),
                                ),
                                prefixIcon: Icon(
                                  Icons.edit_calendar,
                                  color: AppColor.kBlack,
                                ),
                                contentPadding: EdgeInsets.all(5),
                                labelText: 'Today Date',
                                helperStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                border: OutlineInputBorder(
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
                                  datepickar1.text = DateFormat('dd-MM-yyyy')
                                      .format(selectedDate);
                                }
                              });
                            }),
                      ),
                      addhorizontalSpace(10),
                      Expanded(
                          child: textformfiles(jobcardnumbarcontroller,
                              onChanged: (e) {},
                              labelText: jobcardnoumbartxt,
                              keyboardType: TextInputType.number))
                    ],
                  ),
                  addVerticalSpace(10),
                  textformfiles(VehicleController, validator: (e) {
                    if (e!.isEmpty) {
                      return "Please Vehicle No. Fill";
                    }
                  },
                      labelText: VehicalNotxt,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Image.asset(
                          imgcar,
                          height: 15,
                        ),
                      )),
                  addVerticalSpace(10),
                  textformfiles(chassisnocontroller, validator: (e) {
                    if (e!.isEmpty) {
                      return "Please Vehicle No. Chessis No. Fill";
                    }
                  },
                      labelText: Chassistxt,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Image.asset(
                          chessisimg,
                          height: 15,
                        ),
                      )),
                  addVerticalSpace(10),
                  textformfiles(EnginController,
                      labelText: Engintxt,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Image.asset(
                          enginimg,
                          height: 15,
                        ),
                      )),
                  addVerticalSpace(10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColor.kWhite,
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          child: DropdownButtonHideUnderline(
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
                                'Select Model',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.kBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              items: modelvalue
                                  .map((item) => DropdownMenuItem(
                                        onTap: () {
                                          modelid = item['model_Id'];
                                        },
                                        value: item,
                                        child: Text(
                                          item['model_Group'].toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))
                                  .toList(),
                              value: modelidValue,
                              onChanged: (value) {
                                setState(() {
                                  modelidValue = value;
                                  print('Manufacturer ID: $modelid');
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
                                searchController: modelController,
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
                                    controller: modelController,
                                    onChanged: (value) {
                                      setState(() {
                                        manufacturers
                                            .where((item) => item['model_Group']
                                                .toString()
                                                .toLowerCase()
                                                .contains(value.toLowerCase()))
                                            .toList();
                                      });
                                    },
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 8,
                                      ),
                                      hintText: 'Search for a Manufacturer...',
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
                                  modelController.clear();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      addhorizontalSpace(10),
                      SizedBox(
                        width: 50,
                        child: InkWell(
                          onTap: () {
                            Get.to(Addmodel())!
                                .then((value) => fetchModelData());
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
                              color: AppColor.kWhite,
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<Map<String, dynamic>>(
                              isExpanded: true,
                              hint: Text(
                                'Select Color',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.kBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              iconStyleData: IconStyleData(
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColor.kBlack,
                                ),
                              ),
                              items: color
                                  .map((item) => DropdownMenuItem(
                                        onTap: () {
                                          Colorid = item['id'];
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
                                      ))
                                  .toList(),
                              value: selectedcolorValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedcolorValue = value;
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
                                searchController: ColorController,
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
                                    controller: ColorController,
                                    onChanged: (value) {
                                      setState(() {
                                        // Filter the Prionaity list based on the search value
                                        color
                                            .where((item) => item['name']
                                                .toString()
                                                .toLowerCase()
                                                .contains(value.toLowerCase()))
                                            .toList();
                                      });
                                    },
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 8,
                                      ),
                                      hintText: 'Search for a color...',
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
                                  print(Colorid);
                                  ColorController.clear();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      addhorizontalSpace(10),
                      SizedBox(
                        width: 50,
                        child: InkWell(
                          onTap: () {
                            Get.to(() => Group1Screen(
                                      SourecID: 17,
                                      getclassvalue: 1,
                                    ))!
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      addVerticalSpace(20),
                      Text(
                        "Customer details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      addhorizontalSpace(5),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: AppColor.kGray,
                        ),
                      )
                    ],
                  ),
                  addVerticalSpace(10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColor.kWhite,
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          child: DropdownButtonHideUnderline(
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
                                'Costumer details',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.kBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              items: manufacturers
                                  .map((item) => DropdownMenuItem(
                                        onTap: () {
                                          Manufacturerid = item['id'];
                                        },
                                        value: item,
                                        child: Text(
                                          item['ledger_Name'].toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))
                                  .toList(),
                              value: selectedManufacturerValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedManufacturerValue = value;
                                  print('Manufacturer ID: $Manufacturerid');
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
                                searchController: ManufacturerController,
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
                                    controller: ManufacturerController,
                                    onChanged: (value) {
                                      setState(() {
                                        manufacturers
                                            .where((item) => item['ledger_Name']
                                                .toString()
                                                .toLowerCase()
                                                .contains(value.toLowerCase()))
                                            .toList();
                                      });
                                    },
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 8,
                                      ),
                                      hintText: 'Search for a Manufacturer...',
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
                                  ManufacturerController.clear();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      addhorizontalSpace(10),
                      SizedBox(
                        width: 50,
                        child: InkWell(
                          onTap: () {
                            Get.to(LedgerScreen());
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
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColor.kWhite,
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<Map<String, dynamic>>(
                              isExpanded: true,
                              hint: Text(
                                'Select Sourch',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.kBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              iconStyleData: IconStyleData(
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColor.kBlack,
                                ),
                              ),
                              items: drop
                                  .map((item) => DropdownMenuItem(
                                        onTap: () {
                                          selecteddropId = item['id'];
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
                                      ))
                                  .toList(),
                              value: selecteddropValue,
                              onChanged: (value) {
                                setState(() {
                                  selecteddropValue = value;
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
                                searchController: testController,
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
                                    controller: dropController,
                                    onChanged: (value) {
                                      setState(() {
                                        // Filter the Prionaity list based on the search value
                                        drop
                                            .where((item) => item['name']
                                                .toString()
                                                .toLowerCase()
                                                .contains(value.toLowerCase()))
                                            .toList();
                                      });
                                    },
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 8,
                                      ),
                                      hintText: 'Search for a Sourch...',
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
                                  dropController.clear();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      addhorizontalSpace(10),
                      SizedBox(
                        width: 50,
                        child: InkWell(
                          onTap: () {
                            // Get.to(Group1Screen());
                            Get.to(() => Group1Screen(SourecID: 29))!
                                .then((value) => refreshData());
                            // ?.then((value) => value ? GroupData : null);
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                // color: AppColor.kWhite,
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
                              color: AppColor.kWhite,
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          child: DropdownButton(
                            underline: Container(),
                            value: selectedSearviceNumbarName,
                            dropdownColor:
                                const Color.fromARGB(255, 211, 247, 212),
                            icon: Icon(Icons.keyboard_arrow_down_outlined,
                                size: h * 0.030, color: AppColor.kBlack),
                            isExpanded: true,
                            items: SearviceNumbar.map((item) {
                              return DropdownMenuItem(
                                value: item['name'],
                                child: Text(
                                  item['name'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedSearviceNumbarName = value.toString();
                                selectedSearviceNumbarId =
                                    SearviceNumbar.firstWhere(
                                                (item) => item['name'] == value)
                                            .containsKey('id')
                                        ? SearviceNumbar.firstWhere((item) =>
                                            item['name'] == value)['id']
                                        : null;
                              });
                            },
                          ),
                        ),
                      ),
                      addhorizontalSpace(10),
                      Expanded(
                          child: textformfiles(
                        coupanNumbar,
                        keyboardType: TextInputType.number,
                        labelText: 'Coupon Numbar.',
                      ))
                    ],
                  ),
                  addVerticalSpace(10),
                  Row(
                    children: [
                      Expanded(
                          child: textformfiles(
                        kmscontroller,
                        keyboardType: TextInputType.number,
                        labelText: 'Kms',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            kmsimg,
                            height: 25,
                          ),
                        ),
                      )),
                      addhorizontalSpace(10),
                      Expanded(
                          child: textformfiles(
                        fuelcontroller,
                        suffixIcon: SizedBox(
                          width: 15,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "In Ltrs  ",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        labelText: 'Fuel',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            fuelimg,
                            height: 25,
                          ),
                        ),
                      )),
                    ],
                  ),
                  addVerticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      addVerticalSpace(20),
                      Text(
                        "Mechanic Detalis",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      addhorizontalSpace(5),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: AppColor.kGray,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColor.kWhite,
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          child: DropdownButtonHideUnderline(
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
                                'Select manchanic',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.kBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              items:
                                  SelectMachanic.map((item) => DropdownMenuItem(
                                        onTap: () {
                                          manchanicid = item['id'];
                                        },
                                        value: item,
                                        child: Text(
                                          item['name'].toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )).toList(),
                              value: selectedmanchanicValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedmanchanicValue = value;
                                  manchanicid = value!['id'];
                                  print(
                                      'selectedmanchanicValue ID: $manchanicid');
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
                                searchController: manchaniccontroller,
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
                                    controller: manchaniccontroller,
                                    onChanged: (value) {
                                      setState(() {
                                        SelectMachanic.where((item) =>
                                                item['name']
                                                    .toString()
                                                    .toLowerCase()
                                                    .contains(
                                                        value.toLowerCase()))
                                            .toList();
                                      });
                                    },
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 8,
                                      ),
                                      hintText: 'Search for a manchanic...',
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
                                  manchaniccontroller.clear();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      addhorizontalSpace(10),
                      SizedBox(
                        width: 50,
                        child: InkWell(
                          onTap: () {
                            Get.to(Staff_master())!
                                .then((value) => SelectMachanicDeta());
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
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColor.kWhite,
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          child: DropdownButtonHideUnderline(
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
                                'Select Manager',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.kBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              items: workManager
                                  .map((item) => DropdownMenuItem(
                                        onTap: () {
                                          managerId = item['id'];
                                        },
                                        value: item,
                                        child: Text(
                                          item['name'].toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))
                                  .toList(),
                              value: selectedManagerValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedManagerValue = value;
                                  managerId = value!['id'];
                                  print('manager ID: $managerId');
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
                                searchController: managerController,
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
                                    controller: managerController,
                                    onChanged: (value) {
                                      setState(() {
                                        workManager
                                            .where((item) => item['name']
                                                .toString()
                                                .toLowerCase()
                                                .contains(value.toLowerCase()))
                                            .toList();
                                      });
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColor.kWhite,
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 8,
                                      ),
                                      hintText: 'Search for a manager...',
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
                                  managerController.clear();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      addhorizontalSpace(10),
                      SizedBox(
                        width: 50,
                        child: InkWell(
                          onTap: () {
                            Get.to(Staff_master())!
                                .then((value) => fetchWorkManager());
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
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text("Vehicle Accessories details",
                            style: vishalstayl),
                      ),
                      InkWell(
                        onTap: () {
                          index = index;
                          setState(() {
                            // visiable = !visiable;
                          });
                        },
                        child: Checkbox(
                          value: _switchValue,
                          onChanged: (bool? value) {
                            setState(() {
                              _switchValue = !_switchValue;
                              visiable = !visiable;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  // Visibility(
                  //   visible: visiable,
                  //   child: Column(
                  //     children: [
                  //       chackbox(
                  //         isshow,
                  //         (e) {
                  //           setState(() {
                  //             isshow = !isshow;
                  //           });
                  //         },
                  //         "Booklet/documets",
                  //       ),
                  //       chackbox(
                  //         isgear,
                  //         (e) {
                  //           setState(() {
                  //             isgear = !isgear;
                  //           });
                  //         },
                  //         "Spar Wheel",
                  //       ),
                  //       chackbox(
                  //         isbrake,
                  //         (e) {
                  //           setState(() {
                  //             isbrake = !isbrake;
                  //           });
                  //         },
                  //         "Jack handle",
                  //       ),
                  //       chackbox(
                  //         iscool,
                  //         (e) {
                  //           setState(() {
                  //             iscool = !iscool;
                  //           });
                  //         },
                  //         "Mats",
                  //       ),
                  //       chackbox(
                  //         isbattry,
                  //         (e) {
                  //           setState(() {
                  //             isbattry = !isbattry;
                  //           });
                  //         },
                  //         "Carpets",
                  //       ),
                  //       chackbox(
                  //         iscluth,
                  //         (e) {
                  //           setState(() {
                  //             iscluth = !iscluth;
                  //           });
                  //         },
                  //         "Stereo",
                  //       ),
                  //       chackbox(
                  //         isfree,
                  //         (e) {
                  //           setState(() {
                  //             isfree = !isfree;
                  //           });
                  //         },
                  //         "Clock",
                  //       ),
                  //       chackbox(
                  //         isallhouse,
                  //         (e) {
                  //           setState(() {
                  //             isallhouse = !isallhouse;
                  //           });
                  //         },
                  //         "Wheel Cap.Cover",
                  //       ),
                  //       chackbox(
                  //         isunderbody,
                  //         (e) {
                  //           setState(() {
                  //             isunderbody = !isunderbody;
                  //           });
                  //         },
                  //         "Mudflaps",
                  //       ),
                  //       chackbox(
                  //         istyre,
                  //         (e) {
                  //           setState(() {
                  //             istyre = !istyre;
                  //           });
                  //         },
                  //         "Tool Kit",
                  //       ),
                  //       chackbox(
                  //         isnozzle,
                  //         (e) {
                  //           setState(() {
                  //             isnozzle = !isnozzle;
                  //           });
                  //         },
                  //         "perfume",
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Visibility(
                    visible: visiable,
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
                  addVerticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      addVerticalSpace(20),
                      Text(
                        "Labour Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      addhorizontalSpace(5),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: AppColor.kGray,
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
                                filled: true,
                                fillColor: AppColor.kWhite,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.black),
                                ),
                                contentPadding: EdgeInsets.all(5),
                                labelText: "Job in Date",
                                prefixIcon: Icon(
                                  Icons.edit_calendar,
                                  color: AppColor.kBlack,
                                ),
                                border: OutlineInputBorder(
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
                            color: AppColor.kWhite,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Center(
                            child: Text(
                              "${selectedTime.format(context)}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
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
                          child: TextFormField(
                        readOnly: true,
                        controller: nextsearvicesdete,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColor.kWhite,
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
                          // Apply bold font weight to the text
                          labelText: "Job out Date",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, // Make the text bold
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
                              nextsearvicesdete.text =
                                  DateFormat('dd-MM-yyyy').format(selectedDate);
                            }
                          });
                        },
                      )),
                      addhorizontalSpace(10),
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          _selectTime2(context);
                        },
                        child: Container(
                          height: 47,
                          decoration: BoxDecoration(
                            color: AppColor.kWhite,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Center(
                            child: Text(
                              "${selectedTime.format(context)}",
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
                      onTap: () async {
                        var data = await Get.to(() => Addlabourjobcard(
                              jobcardlabour: false,
                              loctionvalue: 2,
                            ));
                        if (data != null)
                          datacontroller.updateTransactionData(data);
                      },
                      child: Button("Add Labour")),
                  addVerticalSpace(10),
                  Obx(() => Rowdata("Total Labour",
                      "${datacontroller.transactionData.value.gross}")),
                  addVerticalSpace(10),
                  Obx(() => Rowdata(igsttext,
                      "${datacontroller.transactionData.value.igst}")),
                  addVerticalSpace(10),
                  Obx(() => Rowdata(cgsttxt,
                      "${datacontroller.transactionData.value.igst / 2}")),
                  addVerticalSpace(10),
                  Obx(() => Rowdata(sgstxt,
                      "${datacontroller.transactionData.value.igst / 2}")),
                  addVerticalSpace(10),
                  Obx(() => Rowdata('netamount',
                      "${datacontroller.transactionData.value.net}")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      addVerticalSpace(20),
                      Text(
                        "Next Service*",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      addhorizontalSpace(5),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: AppColor.kGray,
                        ),
                      )
                    ],
                  ),
                  addVerticalSpace(10),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: numberOfDaysController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              int numberOfDays = int.parse(value);
                              updateDate(numberOfDays);
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColor.kWhite,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.red),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            labelText: ("Number of days"),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      addhorizontalSpace(10),
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          controller: joboutdeate,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColor.kWhite,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            hintText: "Date",
                            prefixIcon: Icon(
                              Icons.edit_calendar,
                              color: AppColor.kBlack,
                            ),
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
                                setState(() {
                                  joboutdeate.text = DateFormat('dd-MM-yyyy')
                                      .format(selectedDate);
                                });
                              }
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  addVerticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      addVerticalSpace(20),
                      Text(
                        "Insurance reminder*",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      addhorizontalSpace(5),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: AppColor.kGray,
                        ),
                      )
                    ],
                  ),
                  addVerticalSpace(10),
                  Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColor.kWhite,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.red),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            labelText: ("days"),
                            border: OutlineInputBorder()),
                      )),
                      addhorizontalSpace(10),
                      Expanded(
                        child: TextFormField(
                            readOnly: true,
                            // textAlignVertical: TextAlignVertical.bottom,
                            controller: insurancedate,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColor.kWhite,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.black),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2.0, color: Colors.red),
                                ),
                                contentPadding: EdgeInsets.all(5),
                                labelText: "Date",
                                prefixIcon: Icon(
                                  Icons.edit_calendar,
                                  color: AppColor.kBlack,
                                ),
                                border: OutlineInputBorder(
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
                                  insurancedate.text = DateFormat('dd-MM-yyyy')
                                      .format(selectedDate);
                                }
                              });
                            }),
                      ),
                    ],
                  ),
                  addVerticalSpace(10),
                  InkWell(
                      onTap: () {
                        if (_formaKey.currentState!.validate()) {
                          if (modelid == 0) {
                            Get.snackbar('Error', 'Please select a Model.',
                                backgroundColor: AppColor.kGreen);
                          } else if (manchanicid == 0) {
                            Get.snackbar('Error', 'Please select a Manchanic',
                                backgroundColor: AppColor.kGreen);
                          } else if (managerId == 0) {
                            Get.snackbar('Error', 'Please select a Manager.',
                                backgroundColor: AppColor.kGreen);
                          } else if (Manufacturerid == 0) {
                            Get.snackbar(
                                'Error', 'Please select a Coustomer Name.',
                                backgroundColor: AppColor.kGreen);
                          } else {
                            postJobCard();
                          }
                        }
                      },
                      child: Button(savetxt)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          _showBottomSheet(context);
                        },
                        child: Text('Print')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<CheckboxItem> checkboxItems = List.generate(
    11,
    (index) => CheckboxItem(name: "Checkbox ${index + 1}", value: false),
  );
  String generateCheckboxString() {
    return checkboxItems.map((item) => item.value ? '1' : '0').join('');
  }

  Future<void> colorDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=17');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        color.clear();
        color.add({'id': 0, 'name': 'Colors'});
        for (var item in goruppartmodelList) {
          color.add({'id': item.id, 'name': item.name});
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

  Future<void> SearviceNumbarDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=29');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        SearviceNumbar.clear();
        SearviceNumbar.add({'id': 0, 'name': 'Service Number*'});
        for (var item in goruppartmodelList) {
          SearviceNumbar.add({'id': item.id, 'name': item.name});
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

  Future<void> SelectMachanicDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetStaffDetailsLocationwiseDesinationwise?locationid=2&Deginationid=3');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        setState(() {
          SelectMachanic.clear();

          SelectMachanic.addAll((jsonData as List)
              .map((item) => {'id': item['id'], 'name': item['staff_Name']})
              .toList());
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchWorkManager() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetStaffDetailsLocationwiseDesinationwise?locationid=2&Deginationid=1');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          workManager.clear();
          workManager.addAll((jsonData as List)
              .map((item) => {'id': item['id'], 'name': item['staff_Name']})
              .toList());
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> CoustomerDetails() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetLedger?LedgerGroupId=10');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Manufacturemodeldeta> manufacturerList =
            manufacturemodeldetaFromJson(response.body);

        setState(() {
          manufacturers = manufacturerList
              .map((item) =>
                  {'id': item.titleId, 'ledger_Name': item.ledgerName})
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

  Row chackbox(
    bool? Fristchack,
    Function(bool?)? Fristchange,
    String txt,
  ) {
    return Row(
      children: [
        Checkbox(value: Fristchack, onChanged: Fristchange),
        Text(
          txt,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Future<void> sourceDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=29');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        drop.clear();
        drop.add({'id': 0, 'name': 'Activity'});
        for (var item in goruppartmodelList) {
          drop.add({'id': item.id, 'name': item.name});
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

  Future<void> prefixdeta() async {
    // ignore: prefer_const_declarations
    final url =
        'http://lms.muepetro.com/api/UserController1/GetInvoiceNo?Tblname=Job_Card&Fldname=Job_No&transdatefld=Job_Date&varprefixtblname=Prefix_Name&prefixfldnText=%27Online%27&varlocationid=2';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        setState(() {
          jobcardnumbarcontroller.text = jsonData
              .toString(); // Directly assign the value without accessing a specific field
        });
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Row Rowdata(String txt, String txt1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          txt,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          height: 35,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.kBlack),
            // border: (),
            color: AppColor.kWhite,
            borderRadius: BorderRadius.circular(5),
            // boxShadow: [BoxShadow(blurRadius: 2, color: AppColor.kGray)]
          ),
          child: Center(
            child: Text(
              txt1,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  TextEditingController _controller = TextEditingController();
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> fetchModelData() async {
    print(1);
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetVehicleMasterLocationwise?locationid=1');
    print(2);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          modelvalue.addAll((jsonData as List)
              .map((item) => {
                    'model_Group': item['model_Name'].toString(),
                    'model_Id':
                        item['model_Id'], // Assuming this is the model ID
                  })
              .toList());
        });
        print(3);
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
      print(4);
    }
  }

  List<bool> _isSelected = [false, false, false];
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: _isSelected[0]
                            ? Color.fromARGB(255, 99, 240, 18).withOpacity(0.5)
                            : null,
                      ),
                      child: ListTile(
                        leading: Icon(Icons.message),
                        title: Text('Send SMS'),
                        onTap: () {
                          _launchInBrowser(Uri.parse(
                              "sms://send?phone=+91${_controller.text}&text=hello"));
                        },
                        selected: _isSelected[0],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isSelected[1] = !_isSelected[1];
                        });
                      },
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: _isSelected[1]
                              ? Color.fromARGB(255, 99, 240, 18)
                                  .withOpacity(0.5)
                              : null,
                        ),
                        child: ListTile(
                          leading: Icon(Icons.wechat),
                          title: Text('Send WhatsApp Message'),
                          selected: _isSelected[1],
                          onTap: () {
                            _launchInBrowser(Uri.parse(
                                "whatsapp://send?phone=+91${_controller.text}&text=hello"));
                          },
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.print),
                      title: Text('Print'),
                      onTap: () async* {
                        //    final pdfFile = await PdfInvoiceApi.generate(
                        //   );
                        // FileHandleApi.openFile(pdfFile);
                        setState(() {
                          _isSelected[2] = !_isSelected[2];
                        });
                      },
                      selected: _isSelected[2],
                      tileColor:
                          _isSelected[2] ? Colors.blue.withOpacity(0.5) : null,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CheckboxItem {
  final String name;
  bool value;

  CheckboxItem({required this.name, required this.value});
}
