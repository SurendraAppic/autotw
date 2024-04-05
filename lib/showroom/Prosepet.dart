// ignore_for_file: unused_import, unnecessary_import, unused_local_variable, unused_element, unused_label, unnecessary_null_comparison

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:autowheelapp/account/InvoiceScreen.dart';
import 'package:autowheelapp/models/Staffmodelpage.dart';
import 'package:autowheelapp/models/groupmodel.dart';
import 'package:autowheelapp/screen/master/Group1.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class ProsepetScreen extends StatefulWidget {
  const ProsepetScreen({super.key});
  @override
  State<ProsepetScreen> createState() => _ProsepetScreenState();
}

String countryValue = "";
String stateValue = "";
String cityValue = "";
var ischack = false;
var h, w;
String interset = "Interst";
List set = ['Interst', 'Part'];
String Sale = "SaleEX";
List ex = ['SaleEX', 'Part'];
// Api
String product = "product";
List uct = ['product', 'Part'];
// Api
String relation = "M/s";
List _relate = ['M/s', 'Mr.', 'Mrs.', "Miss", "Dr."];
TextEditingController NameController = TextEditingController();
TextEditingController SoController = TextEditingController();
TextEditingController Addresscontroller = TextEditingController();
TextEditingController PinController = TextEditingController();
TextEditingController MobileControleer = TextEditingController();
TextEditingController StdController = TextEditingController();
TextEditingController Emailcontroller = TextEditingController();
TextEditingController SchemeController = TextEditingController();
TextEditingController IncomeController = TextEditingController();
TextEditingController RemarksController = TextEditingController();
TextEditingController RemarksController2 = TextEditingController();
TextEditingController SplRemarks = TextEditingController();
TextEditingController refController = TextEditingController();

TextEditingController datepickar1 = TextEditingController(
  text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
);
TextEditingController datepickar2 = TextEditingController(
  text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
);
TextEditingController datepickar3 = TextEditingController(
  text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
);
TextEditingController datepickar4 = TextEditingController(
  text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
);
TextEditingController datepickar5 = TextEditingController(
  text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
);
TextEditingController datepickar6 = TextEditingController(
  text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
);
List<String> detailsList1 = []; // List to store details
bool isLoading = false;
// Api
List<Map<String, dynamic>> drop = [
  {'id': 0, 'name': 'Activity'}
];
String selectedGroupName = "Activity";
int? selecteddropId;
Map<String, dynamic>? selecteddropValue;
// int colorId = 0;
final TextEditingController dropController = TextEditingController();
//Api colors
List<Map<String, dynamic>> color = [
  {'id': 0, 'name': 'Colors'}
];
String selectedcolorName = "Colors";
int? selectedcolorsId;
Map<String, dynamic>? selectedcolorValue;
// int colorId = 0;
final TextEditingController colorController = TextEditingController();

//Api Enq.type
List<Map<String, dynamic>> Enqtype = [
  {'id': 0, 'name': 'Praven'}
];
String selectedEnqtypeName = "Praven";
int? selectedEnqtypeId;
Map<String, dynamic>? selectedEnqtypeValue;

final TextEditingController EnqtypeController = TextEditingController();
// Api Occuption
List<Map<String, dynamic>> Occuption = [
  {'id': 0, 'name': 'Bussniss'}
];
String selectedOccuptionName = "Bussniss";
int? selectedOccuptionId;
Map<String, dynamic>? selectedOccuptionValue;
// int colorId = 0;
final TextEditingController OccuptionController = TextEditingController();
// api Prionaity
List<Map<String, dynamic>> Prionaity = [
  {'id': 0, 'name': 'Prionaity'}
];
String selectedPrionaityName = "Prionaity";
int? selectedPrionaityId;
// api produst
List<Map<String, dynamic>> produst = [
  {'id': 0, 'name': 'produst'}
];
String selectedprodustName = "produst";
int? selectedprodustId;
// Api test ride
List<Map<String, dynamic>> Test = [
  {'id': 0, 'name': 'Test'}
];
String selectedTestName = "Test";
int? selectedTestId;
Map<String, dynamic>? selectedtestValue;
int testId = 0;
final TextEditingController testController = TextEditingController();
// Api title
List<Map<String, dynamic>> title = [
  {'id': 0, 'name': 'title'}
];
String selectedtitleName = "title";
int? selectedtitleId;

class _ProsepetScreenState extends State<ProsepetScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int selectedId3 = 0;
  var loctionid;
  List<Map<String, dynamic>> Loctionshow = [];
  List<String> options = [];
  List<Staffmodel> staffList = [];
  String staffName = "John Doe";
  String selectedStaffId = '';
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

  //Location
  var latitude;
  var longitude;

  late TimeOfDay selectedTime1;
  void startTimer() {
    Timer.periodic(Duration(minutes: 1), (Timer timer) {
      setState(() {
        selectedTime1 = TimeOfDay.now();
      });
    });
  }

  Future<void> Refdeta() async {
    final response = await http.get(Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetInvoiceNo?Tblname=Prospect&Fldname=Ref_No&transdatefld=Ref_Date&varprefixtblname=Prefix_Name&prefixfldnText=%27Online%27&varlocationid=1'));

    if (response.statusCode == 200) {
      refController.text = response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    selectedTime1 = TimeOfDay.now();
    startTimer();
    // selectedTime2;
    loction();
    staff();
    sourceDeta();
    colorDeta();
    enqtypeDeta();
    occuptionDeta();
    prionaityDeta();
    produstDeta();
    TestDeta();
    titleDeta();
    // _fetchRefNo();
    Refdeta();
    // postProspect();
  }

  refreshData() async {
    await sourceDeta();
    colorDeta();
    enqtypeDeta();
    occuptionDeta();
    prionaityDeta();
    produstDeta();
    TestDeta();
    titleDeta();
    // _fetchRefNo();
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 36,
        leading: BackButton(color: AppColor.kBlack),
        centerTitle: true,
        elevation: 2,
        backgroundColor: AppColor.kappabrcolr,
        title: Text(
          "Prospect Masters",
          style: TextStyle(color: AppColor.kBlack),
        ),
        // SizedBox(width: 13),
      ),
      body: Loctionshow.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                              loctionid =
                                  selectedId3; // Assign the selected ID directly
                            });
                          },
                        ),
                      ),
                      addVerticalSpace(10),
                      textformfiles(refController,
                          keyboardType: TextInputType.number,
                          readOnly: true,
                          labelText: "Ref.No"),
                      addVerticalSpace(10),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              controller: datepickar1,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.black),
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
                                labelText: "date",
                                labelStyle: TextStyle(
                                  fontWeight:
                                      FontWeight.bold, // Make the text bold
                                ),
                              ),
                              onTap: () async {
                                DateTime date = DateTime(1900);
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                ).then((selectedDate) {
                                  if (selectedDate != null) {
                                    datepickar1.text = DateFormat('yyyy/MM/dd')
                                        .format(selectedDate);
                                    print(datepickar1.text.toString());
                                  }
                                });
                              },
                            ),
                          ),
                          addhorizontalSpace(10),
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              _selectTime1(context);
                            },
                            child: Container(
                              height: 47,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.black, width: 2),
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 80,
                            child: dropdownTextfield(
                              "Any",
                              DropdownButton(
                                underline: Container(),
                                value: selectedtitleName,
                                dropdownColor:
                                    const Color.fromARGB(255, 211, 247, 212),
                                icon: Icon(Icons.keyboard_arrow_down_outlined,
                                    size: h * 0.030, color: AppColor.kBlack),
                                isExpanded: true,
                                items: title.map((item) {
                                  return DropdownMenuItem(
                                    value: item['name'],
                                    child: Text(
                                      item['name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedtitleName = value.toString();
                                    selectedtitleId = title
                                            .firstWhere(
                                                (item) => item['name'] == value)
                                            .containsKey('id')
                                        ? title.firstWhere((item) =>
                                            item['name'] == value)['id']
                                        : null;
                                    log(selectedtitleId.toString());
                                  });
                                },
                              ),
                            ),
                          ),
                          addhorizontalSpace(10),
                          Expanded(
                            child: textformfiles(NameController,
                                validator: (value) {
                              if (value!.isEmpty) {
                                return "please Name Value Fill in Blank";
                              }
                              return null;
                            }, labelText: "Name*"),
                          ),
                        ],
                      ),
                      addVerticalSpace(10),
                      textformfiles(SoController,
                        labelText: "S/o"),
                      addVerticalSpace(10),
                      textformfiles(Addresscontroller,
                          labelText: "Address"),
                      addVerticalSpace(10),
                      CSCPicker(
                        showStates: true,
                        showCities: true,
                        dropdownDecoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            color: Colors.white,
                            border: Border.all(
                              width: 2,
                              color: Colors.black,
                            )),
                        disabledDropdownDecoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 2)),
                        countryDropdownLabel: "Select Country *",
                        stateDropdownLabel: " Select State *",
                        cityDropdownLabel: " Select City *",
                        selectedItemStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        dropdownHeadingStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        dropdownItemStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        dropdownDialogRadius: 10.0,
                        searchBarRadius: 10.0,
                        onCountryChanged: (value) {
                          setState(() {
                            countrySearchPlaceholder:
                            "$cityValue";
                            stateSearchPlaceholder:
                            "$cityValue";
                            citySearchPlaceholder:
                            "City";

                            countryValue = value;
                          });
                        },
                        onStateChanged: (value) {
                          setState(() {
                            stateValue = "$stateValue";
                          });
                        },
                        onCityChanged: (value) {
                          setState(() {
                            cityValue = "$countryValue";
                          });
                        },
                      ),
                      addVerticalSpace(10),
                      textformfiles(PinController,
                          labelText: "Pin",
                          keyboardType: TextInputType.number),
                      addVerticalSpace(10),
                      textformfiles(MobileControleer,
                          labelText: "Mobile*",
                          keyboardType: TextInputType.number),
                      addVerticalSpace(10),
                      textformfiles(StdController,
                         labelText: "Std"),
                      addVerticalSpace(10),
                      textformfiles(Emailcontroller,
                         labelText: "Email"),
                      addVerticalSpace(10),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              controller: datepickar2,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.black),
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
                                labelText: "Date",
                                labelStyle: TextStyle(
                                  fontWeight:
                                      FontWeight.bold, // Make the text bold
                                ),
                              ),
                              onTap: () async {
                                DateTime date = DateTime(1900);
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                ).then((selectedDate) {
                                  if (selectedDate != null) {
                                    datepickar2.text = DateFormat('yyyy/MM/dd')
                                        .format(selectedDate);
                                    print(datepickar2.text.toString());
                                  }
                                });
                              },
                            ),
                          ),
                          addhorizontalSpace(10),
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              controller: datepickar3,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.black),
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
                                labelText: "To",
                                labelStyle: TextStyle(
                                  fontWeight:
                                      FontWeight.bold, // Make the text bold
                                ),
                              ),
                              onTap: () async {
                                DateTime date = DateTime(1900);
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                ).then((selectedDate) {
                                  if (selectedDate != null) {
                                    datepickar3.text = DateFormat('yyyy/MM/dd')
                                        .format(selectedDate);
                                    print(datepickar3.text.toString());
                                  }
                                });
                              },
                            ),
                          ),
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
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<Map<String, dynamic>>(
                                  isExpanded: true,
                                  hint: Text(
                                    'Select Enqtype',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.kBlack,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  items: Enqtype.map((item) => DropdownMenuItem(
                                        onTap: () {
                                          selectedEnqtypeId = item['id'];
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
                                  value: selectedEnqtypeValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedEnqtypeValue = value;
                                    });
                                  },
                                  buttonStyleData: const ButtonStyleData(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
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
                                    searchController: EnqtypeController,
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
                                        controller: EnqtypeController,
                                        onChanged: (value) {
                                          setState(() {
                                            // Filter the Prionaity list based on the search value
                                            Enqtype.where((item) => item['name']
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
                                          hintText: 'Search for a Enqtype...',
                                          hintStyle:
                                              const TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onMenuStateChange: (isOpen) {
                                    if (!isOpen) {
                                      EnqtypeController.clear();
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
                                print("Enqtype");
                                Get.to(() => Group1Screen(SourecID: 18))
                                    ?.then((value) => refreshData());
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
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<Map<String, dynamic>>(
                                  isExpanded: true,
                                  hint: Text(
                                    'Select Occuption',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.kBlack,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  items:
                                      Occuption.map((item) => DropdownMenuItem(
                                            onTap: () {
                                              selectedOccuptionId = item['id'];
                                            },
                                            value: item,
                                            child: Row(
                                              children: [
                                                Text(
                                                  item['name'].toString(),
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          )).toList(),
                                  value: selectedOccuptionValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOccuptionValue = value;
                                    });
                                  },
                                  buttonStyleData: const ButtonStyleData(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
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
                                        controller: OccuptionController,
                                        onChanged: (value) {
                                          setState(() {
                                            // Filter the Prionaity list based on the search value
                                            Occuption.where((item) =>
                                                    item['name']
                                                        .toString()
                                                        .toLowerCase()
                                                        .contains(value
                                                            .toLowerCase()))
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
                                          hintText: 'Search for a Occuption...',
                                          hintStyle:
                                              const TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onMenuStateChange: (isOpen) {
                                    if (!isOpen) {
                                      OccuptionController.clear();
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
                                Get.to(() => Group1Screen(SourecID: 23))
                                    ?.then((value) => refreshData());
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
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: dropdownTextfield(
                      //         "Staff",
                      //         Row(
                      //           children: [
                      //             Expanded(
                      //               child: DropdownButton<String>(
                      //                 icon: Icon(
                      //                   Icons.keyboard_arrow_down_rounded,
                      //                   color: AppColor.kWhite,
                      //                 ),
                      //                 underline: Container(),
                      //                 value: selectedStaffId,
                      //                 onChanged: (String? newValue) {
                      //                   setState(() {
                      //                     selectedStaffId = newValue!;
                      //                   });
                      //                 },
                      //                 items:
                      //                     options.map<DropdownMenuItem<String>>(
                      //                   (String value) {
                      //                     return DropdownMenuItem<String>(
                      //                       value: value,
                      //                       child: Text(value),
                      //                     );
                      //                   },
                      //                 ).toList(),
                      //               ),
                      //             ),
                      //             Icon(Icons.keyboard_arrow_down_rounded),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     addhorizontalSpace(10),
                      //     SizedBox(
                      //       width: 50,
                      //       child: InkWell(
                      //         onTap: () {
                      //           // Get.to(Group1Screen());
                      //           // Get.to(() => Group1Screen());
                      //           // ?.then((value) => value ? GroupData : null);
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
                      //     )
                      //   ],
                      // ),
                      // addVerticalSpace(10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              // padding: const EdgeInsets.all(8),
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
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
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
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
                                          hintText: 'Search for a Sourch...',
                                          hintStyle:
                                              const TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                Get.to(() => Group1Screen(SourecID: 10))!
                                    .then((value) => refreshData());
                                // ?.then((value) => value ? GroupData : null);
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
                                  border:
                                      Border.all(color: Colors.black, width: 2),
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
                                  items: color
                                      .map((item) => DropdownMenuItem(
                                            onTap: () {
                                              selectedcolorsId = item['id'];
                                            },
                                            value: item,
                                            child: Row(
                                              children: [
                                                Text(
                                                  item['name'].toString(),
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
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
                                        controller: colorController,
                                        onChanged: (value) {
                                          setState(() {
                                            // Filter the Prionaity list based on the search value
                                            color
                                                .where((item) => item['name']
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
                                          hintText: 'Search for a color...',
                                          hintStyle:
                                              const TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onMenuStateChange: (isOpen) {
                                    if (!isOpen) {
                                      colorController.clear();
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
                              onTap: () {},
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
                              child: dropdownTextfield(
                            "Prionarity",
                            DropdownButton(
                              underline: Container(),
                              value: selectedPrionaityName,
                              dropdownColor:
                                  const Color.fromARGB(255, 211, 247, 212),
                              icon: Icon(Icons.keyboard_arrow_down_outlined,
                                  size: h * 0.030, color: AppColor.kBlack),
                              isExpanded: true,
                              items: Prionaity.map((item) {
                                return DropdownMenuItem(
                                  value: item['name'],
                                  child: Text(
                                    item['name'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedPrionaityName = value.toString();
                                  selectedPrionaityId = Prionaity.firstWhere(
                                              (item) => item['name'] == value)
                                          .containsKey('id')
                                      ? Prionaity.firstWhere(
                                          (item) => item['name'] == value)['id']
                                      : null;
                                  log(selectedPrionaityId.toString());
                                });
                              },
                            ),
                          )),
                          addhorizontalSpace(10),
                          SizedBox(
                            width: 50,
                            child: InkWell(
                              onTap: () {
                                Get.to(() => Group1Screen(SourecID: 22))
                                    ?.then((value) => refreshData());
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
                      textformfiles(SchemeController,
                         labelText: "Scheme"),
                      addVerticalSpace(10),
                      textformfiles(IncomeController,
                          keyboardType: TextInputType.number,
                          labelText: "Income"),
                      addVerticalSpace(10),
                      Text(
                        "intersted in following product colour scheme*",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      addVerticalSpace(10),
                      Row(
                        children: [
                          Expanded(
                              child: dropdownTextfield(
                            "Product",
                            DropdownButton(
                              underline: Container(),
                              value: selectedprodustName,
                              dropdownColor:
                                  const Color.fromARGB(255, 211, 247, 212),
                              icon: Icon(Icons.keyboard_arrow_down_outlined,
                                  size: h * 0.030, color: AppColor.kBlack),
                              isExpanded: true,
                              items: produst.map((item) {
                                return DropdownMenuItem(
                                  value: item['name'],
                                  child: Text(
                                    item['name'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedprodustName = value.toString();
                                  selectedprodustId = produst
                                          .firstWhere(
                                              (item) => item['name'] == value)
                                          .containsKey('id')
                                      ? produst.firstWhere(
                                          (item) => item['name'] == value)['id']
                                      : null;
                                  log(selectedprodustId.toString());
                                });
                              },
                            ),
                          )),
                          addhorizontalSpace(10),
                          SizedBox(
                            width: 50,
                            child: InkWell(
                              onTap: () {
                                Get.to(() => Group1Screen(SourecID: 19))
                                    ?.then((value) => refreshData());
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
                                  border:
                                      Border.all(color: Colors.black, width: 2),
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
                                  items: color
                                      .map((item) => DropdownMenuItem(
                                            onTap: () {
                                              selectedcolorsId = item['id'];
                                            },
                                            value: item,
                                            child: Row(
                                              children: [
                                                Text(
                                                  item['name'].toString(),
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
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
                                        controller: colorController,
                                        onChanged: (value) {
                                          setState(() {
                                            // Filter the Prionaity list based on the search value
                                            color
                                                .where((item) => item['name']
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
                                          hintText: 'Search for a color...',
                                          hintStyle:
                                              const TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onMenuStateChange: (isOpen) {
                                    if (!isOpen) {
                                      colorController.clear();
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
                                Get.to(() => Group1Screen(SourecID: 17))!
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
                      textformfiles(RemarksController,
                          labelText: "Remmarks"),
                      addVerticalSpace(10),
                      Text(
                        "Test Ride*",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
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
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<Map<String, dynamic>>(
                                  isExpanded: true,
                                  hint: Text(
                                    'Select Test',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.kBlack,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  items: Test.map((item) => DropdownMenuItem(
                                        onTap: () {
                                          testId = item['id'];
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
                                  value: selectedtestValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedtestValue = value;
                                    });
                                  },
                                  buttonStyleData: const ButtonStyleData(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
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
                                        controller: testController,
                                        onChanged: (value) {
                                          setState(() {
                                            // Filter the Prionaity list based on the search value
                                            Test.where((item) => item['name']
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
                                          hintText: 'Search for a Test...',
                                          hintStyle:
                                              const TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onMenuStateChange: (isOpen) {
                                    if (!isOpen) {
                                      testController.clear();
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
                                Get.to(() => Group1Screen(SourecID: 21))!
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
                      TextFormField(
                        readOnly: true,
                        controller: datepickar4,
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
                          // Apply bold font weight to the text
                          labelText: "date",
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
                            lastDate: DateTime.now().add(Duration(days: 365)),
                          ).then((selectedDate) {
                            if (selectedDate != null) {
                              datepickar4.text =
                                  DateFormat('yyyy/MM/dd').format(selectedDate);
                              print(datepickar4.text.toString());
                            }
                          });
                        },
                      ),
                      addVerticalSpace(10),
                      textformfiles(RemarksController2,
                         labelText: "Remmarks"),
                      addVerticalSpace(10),
                      Text(
                        "Appointment Date and Time*",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      addVerticalSpace(10),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              controller: datepickar5,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.black),
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
                                labelText: "date",
                                labelStyle: TextStyle(
                                  fontWeight:
                                      FontWeight.bold, // Make the text bold
                                ),
                              ),
                              onTap: () async {
                                DateTime date = DateTime(1900);
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime
                                      .now(), // Set firstDate to allow only upcoming dates
                                  lastDate: DateTime.now().add(
                                      Duration(days: 365)), // Adjust as needed
                                ).then((selectedDate) {
                                  if (selectedDate != null) {
                                    datepickar5.text = DateFormat('yyyy/MM/dd')
                                        .format(selectedDate);
                                    print(datepickar5.text.toString());
                                  }
                                });
                              },
                            ),
                          ),
                          addhorizontalSpace(10),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                _selectTime1(context);
                              },
                              child: Container(
                                height: 47,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: Colors.black, width: 2),
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
                            ),
                          ),
                        ],
                      ),
                      addVerticalSpace(10),
                      textformfiles(SplRemarks,
                           labelText: "Spl Remarks"),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                            child: Checkbox(
                                activeColor: AppColor.kBlue,
                                value: ischack,
                                onChanged: (e) {
                                  setState(() {
                                    ischack = !ischack;
                                  });
                                }),
                          ),
                          Text(
                            "Sent SMS AFter Save",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      addVerticalSpace(10),
                      InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            if (loctionid == null) {
                              Get.snackbar('Error', 'Please select a location.',
                                  backgroundColor: AppColor.kGreen);
                            } else if (selectedtitleId == null) {
                              Get.snackbar('Error', 'Please select a Title.',
                                  backgroundColor: AppColor.kGreen);
                            } else if (selectedEnqtypeId == null) {
                              Get.snackbar(
                                  'Error', 'Please select an Enquiry Type.',
                                  backgroundColor: AppColor.kGreen);
                            } else if (selectedOccuptionId == null) {
                              Get.snackbar(
                                  'Error', 'Please select an Occupation.',
                                  backgroundColor: AppColor.kGreen);
                            } else if (selecteddropId == null) {
                              Get.snackbar('Error', 'Please select a Source.',
                                  backgroundColor: AppColor.kGreen);
                            } else if (selectedPrionaityId == null) {
                              Get.snackbar('Error', 'Please select a Priority.',
                                  backgroundColor: AppColor.kGreen);
                            } else if (selectedcolorsId == null) {
                              Get.snackbar('Error', 'Please select a Color.',
                                  backgroundColor: AppColor.kGreen);
                            } else if (selectedprodustId == null) {
                              Get.snackbar('Error', 'Please select a Produst.',
                                  backgroundColor: AppColor.kGreen);
                            } else if (testId == null) {
                              Get.snackbar('Error', 'Please select a Test.',
                                  backgroundColor: AppColor.kGreen);
                            } else {
                              postProspect();
                              getLocation();
                            }
                          }
                        },
                        child: Button(savetxt),
                      ),
                      addVerticalSpace(10),
                      redButton(delettxt),
                      addVerticalSpace(10),
                    ],
                  ),
                ),
              ),
            ),
    );
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

  Future<void> staff() async {
    final url =
        Uri.parse('http://lms.muepetro.com/api/UserController1/GetStaff');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List<dynamic>;

        staffList = data.map((map) => Staffmodel.fromJson(map)).toList();

        if (staffList.isEmpty) {
          print('Staff not found with Name: $staffName');
        } else {
          setState(() {
            options = staffList.map((staff) => staff.staffName).toList();
            selectedStaffId =
                staffList.first.staffName; // Set the default selected staff ID
          });
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> sourceDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=10');
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

  Future<void> enqtypeDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=18');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        Enqtype.clear();
        Enqtype.add({'id': 0, 'name': 'Praven'});
        for (var item in goruppartmodelList) {
          Enqtype.add({'id': item.id, 'name': item.name});
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

  Future<void> occuptionDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=23');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        Occuption.clear();
        Occuption.add({'id': 0, 'name': 'Bussniss'});
        for (var item in goruppartmodelList) {
          Occuption.add({'id': item.id, 'name': item.name});
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

  Future<void> produstDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=19');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        produst.clear();
        produst.add({'id': 0, 'name': 'produst'});
        for (var item in goruppartmodelList) {
          produst.add({'id': item.id, 'name': item.name});
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

  Future<void> TestDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=21');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        Test.clear();
        Test.add({'id': 0, 'name': 'Test'});
        for (var item in goruppartmodelList) {
          Test.add({'id': item.id, 'name': item.name});
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

  Future<void> titleDeta() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetMiscMaster?MiscTypeId=24');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Goruppartmodel> goruppartmodelList =
            goruppartmodelFromJson(response.body);

        title.clear();
        title.add({'id': 0, 'name': 'title'});
        for (var item in goruppartmodelList) {
          title.add({'id': item.id, 'name': item.name});
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

  void postProspect() async {
    print(1);
    final String apiUrl =
        'http://lms.muepetro.com/api/UserController1/PostProspect';
    Map<String, dynamic> postData = {
      "Location_Id": loctionid,
      "Prefix_Name": "Online",
      "Ref_No": int.parse(
        refController.text.toString(),
      ),
      "Ref_Date": datepickar1.text,
      "Ref_Time": "${selectedTime1.hour}:${selectedTime1.minute}",
      "Title_id": selectedtitleId,
      "Gender_Name": "Male",
      "Customer_Name": "${NameController.text.toString()}",
      "Contact_Name": "raj1",
      "SanOff_Name": "${SoController.text.toString()}",
      "Address_Details": "${Addresscontroller.text.toString()}",
      "City_Id": "2",
      "City": "jaipur",
      "Pin_Code": "${PinController.text.toString()}",
      "Mob_No": MobileControleer.text.toString(),
      "Phon_No": "phon",
      "Std_Code": "${StdController.text.toString()}",
      "Fax_No": "fax",
      "Email_Id": "${Emailcontroller.text.toString()}",
      "Birthday_Date": datepickar2.text,
      "Anniversary_Date": datepickar3.text,
      "Enq_Type": selectedEnqtypeId,
      "Mode_Type": "modeltype",
      "Occupation": selectedOccuptionId,
      "Income": "${IncomeController.text.toString()}",
      "EnqGenBy_Id": staffList
          .firstWhere((staff) => staff.staffName == selectedStaffId,
              orElse: () => Staffmodel(id: 0, staffName: ''))
          .id,
      "SalesEx_id": staffList
          .firstWhere((staff) => staff.staffName == selectedStaffId,
              orElse: () => Staffmodel(id: 0, staffName: ''))
          .id,
      "Source_Id": selecteddropId,
      "NoOfVisitor": "NofVisitor",
      "Scheme": SchemeController.text.toString(),
      "Priority": selectedPrionaityId,
      "InterestIn": "InterestIn",
      "Model_Id": selectedprodustId,
      "Colour_Id": selectedcolorsId,
      "Remark_interest": "Remark_interest",
      "ModelTest_Id": testId,
      "ModelTest_Date": datepickar4.text.toString(),
      "Remark_ModelTest": "${RemarksController.text.toString()}",
      "Appointment_Date": datepickar5.text,
      "Appointment_Time": "${selectedTime1.hour}:${selectedTime1.minute}",
      "Remark_Appointment": "${RemarksController2.text.toString()}",
      "Remark_Special": "${SplRemarks.text.toString()}",
      "CurrentAppointmentDate": datepickar5.text,
      "EnquiryStatus": 1,
      "Last_Remark": "jaipur",
      "LastContact_Date": datepickar5.text,
      "a": '$latitude',
      "b": '$longitude',
    };
    print("${postData}");
    String jsonString = jsonEncode(postData);
    print(3);
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonString,
      );
      print(4);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print('Response: $data');
        Get.snackbar(
          'Done',
          ' Api successfully ${response.statusCode}',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Navigator.pop(context);
        print(5);
      } else {
        var data = jsonDecode(response.body);
        print('Failed to post data. Status code: ${response.statusCode}');
        Get.snackbar(
          'Error',
          'Failed to post data. Status code: ${response.statusCode}',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print(6);
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        print(
            'Latitude: ${position.latitude}, Longitude: ${position.longitude}');
        latitude = position.latitude;
        longitude = position.longitude;
      });
    } catch (e) {
      print(e);
    }
  }
}

Widget dropdownTextfield(
  String? labelText,
  Widget? widget,
) {
  return SizedBox(
    height: 50,
    child: TextFormField(
      readOnly: true,
      initialValue: " ",
      decoration: InputDecoration(
          suffix: SizedBox(width: double.infinity, child: widget),
          labelText: labelText,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.kBlack, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.kBlack, width: 2)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.kBlack, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.kBlack, width: 2))),
    ),
  );
}
