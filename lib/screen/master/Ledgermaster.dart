// ignore_for_file: unused_import, unused_field, unused_label, body_might_complete_normally_nullable, deprecated_member_use
import 'dart:convert';
import 'dart:io';
import 'package:autowheelapp/models/Staffmodelpage.dart';
import 'package:autowheelapp/screen/Intro/Login_screen.dart';
import 'package:autowheelapp/showroom/VihecalScreen.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class LedgerScreen extends StatefulWidget {
  @override
  _LedgerScreenState createState() => _LedgerScreenState();
}

class _LedgerScreenState extends State<LedgerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController _dateController1 = TextEditingController(
    text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
  );
  TextEditingController _dateController2 = TextEditingController(
    text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
  );
  TextEditingController LedgerController = TextEditingController();
  TextEditingController AddressControler = TextEditingController();
  TextEditingController PinController = TextEditingController();
  TextEditingController StdController = TextEditingController();
  TextEditingController MobileController = TextEditingController();
  TextEditingController DisticController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController OpenController = TextEditingController();
  TextEditingController GstController = TextEditingController();
  TextEditingController DocomentController = TextEditingController();
  TextEditingController Doc1Controller = TextEditingController();
  TextEditingController Doc2Controller = TextEditingController();
  TextEditingController Doc3Controller = TextEditingController();
  TextEditingController DistrictController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController sonoff = TextEditingController();
  List<File?> imageFiles = [];
  List<TextEditingController> controllers = [];

  String countryValue = "India";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  var LegderID;
  var selectedGstId;
  var genralid;
  var Loctionid;
  var staffid;
  String selectedStaffId = '';
  List<String> options = [];
  List<Staffmodel> staffList = [];
  String staffName = "John Doe";
  String relation = "M/s";
  List _relate = ['M/s', 'Mr.', 'Mrs.', "Miss", "Dr."];
  String so = "s/o";
  List co = ['s/o', 'D/o.', 'W/o.'];
  String StaffLedgerScreen = "Select staff";
  List Staff = [
    'Select staff',
    'Mother',
    'Guardian',
  ];
  String cr = "cr";
  List dr = [
    'cr',
    'dr',
    '',
  ];
///// lager group
  String Gstdeller = "Lagder group";
  List gst1 = [
    'Lagder group',
    'Mother',
    'Guardian',
  ];
  ///// lager group
  //////
  String gst = "Select a Group";

  List<Map<String, dynamic>> dealer = [];
//////////
  int selectedId = 0;
  List<Map<String, dynamic>> dealer0 = [];
  int selectedId1 = 0;
  List<Map<String, dynamic>> dealer1 = [];
  var h, w;
  String staffLedgerScreen = "Select staff";
  List<String> staff1 = ['Select staff'];
  int selectedId3 = 0;
  var loctionid;
  List<Map<String, dynamic>> Loctionshow = [];
  int selectedId0 = 0;
  List<Map<String, dynamic>> dealer2 = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void clearAllControllers() {
    LedgerController.clear();
    AddressControler.clear();
    PinController.clear();
    StdController.clear();
    MobileController.clear();
    DisticController.clear();
    EmailController.clear();
    OpenController.clear();
    GstController.clear();
    DistrictController.clear();
    AddressController.clear();
    sonoff.clear();
  }

  @override
  void initState() {
    super.initState();
    lagerGroupApi();
    gstCatagry();
    staff();
    catageryId15();
    loction();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  File? imageFile;
  File? imageFile2;
  // File? imageFile;

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back(result: true);
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        toolbarHeight: 25,
        backgroundColor: AppColor.kappabrcolr,
        title: Text('Legder master'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Legder'),
            Tab(text: 'Temp address.'),
            Tab(text: 'Document'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addVerticalSpace(10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.only(right: 10),
                                  height: 47,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: DropdownButton(
                                    underline: Container(),
                                    value: relation,
                                    dropdownColor: const Color.fromARGB(
                                        255, 211, 247, 212),
                                    icon: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        size: h * 0.030,
                                        color: AppColor.kBlack),
                                    isExpanded: true,
                                    items: _relate.map((value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        relation = value.toString();
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                    child: TextFormField(
                                        controller: LedgerController,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "plese enter a Legder Name. ";
                                          }
                                        },
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.person),
                                          labelText: "Legder Name",
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          contentPadding: EdgeInsets.all(5),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.black),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0, color: Colors.red),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 5),
                                          ),
                                        ))),
                              ],
                            ),

                            addVerticalSpace(10),

                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.only(right: 10),
                                  height: 47,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: DropdownButton(
                                    underline: Container(),
                                    value: so,
                                    dropdownColor: const Color.fromARGB(
                                        255, 211, 247, 212),
                                    icon: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        size: h * 0.030,
                                        color: AppColor.kBlack),
                                    isExpanded: true,
                                    items: co.map((value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        so = value.toString();
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                    child: textformfiles(
                                  sonoff,
                                  labelText: "s/o.",
                                )),
                              ],
                            ),
                            addVerticalSpace(10),
                            CSCPicker(
                              showStates: true,
                              showCities: true,
                              defaultCountry: CscCountry.India,
                              dropdownDecoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  color: AppColor.kWhite,
                                  border: Border.all(
                                    width: 2,
                                    color: AppColor.kBlack,
                                  )),
                              disabledDropdownDecoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  color: AppColor.kWhite,
                                  border: Border.all(
                                      color: AppColor.kBlack, width: 2)),
                              countryDropdownLabel: "Select Country",
                              stateDropdownLabel: " Select State",
                              cityDropdownLabel: " Select City",
                              dropdownHeadingStyle: TextStyle(
                                  color: AppColor.kBlack,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              dropdownItemStyle: TextStyle(
                                color: AppColor.kBlack,
                                fontSize: 14,
                              ),
                              dropdownDialogRadius: 10.0,
                              searchBarRadius: 10.0,
                              onCountryChanged: (value) {
                                setState(() {
                                  cityValue;
                                  cityValue;
                                  "City";
                                  countryValue = value;
                                });
                              },
                              onStateChanged: (value) {
                                setState(() {
                                  stateValue = stateValue;
                                });
                              },
                              onCityChanged: (value) {
                                setState(() {
                                  cityValue = countryValue;
                                });
                              },
                            ),

                            addVerticalSpace(10),
                            textformfiles(
                              AddressControler,
                              labelText: "Address",
                            ),
                            addVerticalSpace(10),
                            Row(
                              children: [
                                Expanded(
                                  child: textformfiles(PinController,
                                      labelText: "Pin code",
                                      keyboardType: TextInputType.number),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: textformfiles(StdController,
                                      labelText: "Std code",
                                      keyboardType: TextInputType.number),
                                )
                              ],
                            ),
                            addVerticalSpace(10),
                            textformfiles(DisticController,
                                labelText: "District",
                                keyboardType: TextInputType.text),

                            addVerticalSpace(10),
                            textformfiles(MobileController,
                                labelText: "Mobile No",
                                keyboardType: TextInputType.number),
                            addVerticalSpace(10),
                            textformfiles(EmailController,
                                labelText: "MailId@gmail.com",
                                keyboardType: TextInputType.text),

                            addVerticalSpace(10),
//////group

                            Container(
                              padding: EdgeInsets.all(5),
                              height: 50,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black54, width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButton(
                                underline: Container(),
                                value: gst,
                                dropdownColor:
                                    const Color.fromARGB(255, 211, 247, 212),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: MediaQuery.of(context).size.height *
                                      0.030,
                                  color: AppColor.kBlack,
                                ),
                                isExpanded: true,
                                items: dealer.map((value) {
                                  return DropdownMenuItem(
                                    value: value['ledger_Group_Name'],
                                    child: Text(
                                      '${value['id']} -${value['ledger_Group_Name']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  int selectedIndex = dealer.indexWhere(
                                      (item) =>
                                          item['ledger_Group_Name'] == value);
                                  LegderID =
                                      '${dealer[selectedIndex]['id'].toString()}';
                                  debugPrint(LegderID);
                                  gst = value.toString();
                                  setState(() {});
                                },
                              ),
                            ),

//////
                            addVerticalSpace(10),
                            Row(
                              children: [
                                Expanded(
                                  child: textformfiles(OpenController,
                                    
                                      labelText: "Opening Bal.",
                                      keyboardType: TextInputType.text),
                                ),
                                addhorizontalSpace(10),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black54, width: 2),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: DropdownButton(
                                      underline: Container(),
                                      value: cr,
                                      dropdownColor: const Color.fromARGB(
                                          255, 211, 247, 212),
                                      icon: Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          size: h * 0.030,
                                          color: AppColor.kBlack),
                                      isExpanded: true,
                                      items: dr.map((value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          cr = value.toString();
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            addVerticalSpace(10),
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 50,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black54, width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButton(
                                underline: Container(),
                                value: selectedId,
                                dropdownColor:
                                    const Color.fromARGB(255, 211, 247, 212),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: MediaQuery.of(context).size.height *
                                      0.030,
                                  color: AppColor.kBlack,
                                ),
                                isExpanded: true,
                                items: dealer0.map((value) {
                                  return DropdownMenuItem(
                                    value: value['id'],
                                    child: Text(
                                      '${value['id']} -${value['name']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedId = value as int;
                                    selectedGstId = value;
                                    print(selectedGstId.toString());
                                  });
                                },
                              ),
                            ),

                            addVerticalSpace(10),
                            textformfiles(GstController,
                               
                                labelText: "Gst no.",
                                keyboardType: TextInputType.text),

                            addVerticalSpace(10),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(5),
                              height: 50,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: DropdownButton<String>(
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: AppColor.kWhite,
                                      ),
                                      underline: Container(),
                                      value: selectedStaffId,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedStaffId = newValue!;
                                        });
                                      },
                                      items:
                                          options.map<DropdownMenuItem<String>>(
                                        (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                  Icon(Icons.keyboard_arrow_down_rounded),
                                ],
                              ),
                            ),
                            addVerticalSpace(10),
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 50,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black54, width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButton(
                                underline: Container(),
                                value: selectedId1,
                                dropdownColor:
                                    const Color.fromARGB(255, 211, 247, 212),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: MediaQuery.of(context).size.height *
                                      0.030,
                                  color: AppColor.kBlack,
                                ),
                                isExpanded: true,
                                items: dealer1.map((value) {
                                  return DropdownMenuItem(
                                    value: value['id'],
                                    child: Text(
                                      '${value['id']} -${value['name']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedId1 = value as int;
                                    genralid = value;
                                    print(genralid.toString());
                                  });
                                },
                              ),
                            ),
                            addVerticalSpace(10),
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 50,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black54, width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButton(
                                underline: Container(),
                                value: selectedId3,
                                dropdownColor:
                                    const Color.fromARGB(255, 211, 247, 212),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: MediaQuery.of(context).size.height *
                                      0.030,
                                  color: Colors.black,
                                ),
                                isExpanded: true,
                                items: Loctionshow.map((value) {
                                  return DropdownMenuItem(
                                    value: value['id'],
                                    child: Text(
                                      '${value['id']} -${value['location_Name']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                                      controller: _dateController1,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(5),
                                          labelText: "From Date",
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.black),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 5.0, color: Colors.red),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 5),
                                          )),
                                      onTap: () async {
                                        DateTime date = DateTime(1900);
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime.now())
                                            .then((selectedDate) {
                                          if (selectedDate != null) {
                                            _dateController1.text =
                                                DateFormat('dd-MM-yyyy')
                                                    .format(selectedDate);
                                          }
                                        });
                                      }),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                      readOnly: true,
                                      controller: _dateController1,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(5),
                                          labelText: "To Date",
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2.0,
                                                color: Colors.black),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 5.0, color: Colors.red),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 5),
                                          )),
                                      onTap: () async {
                                        DateTime date = DateTime(1900);
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime.now())
                                            .then((selectedDate) {
                                          if (selectedDate != null) {
                                            _dateController1.text =
                                                DateFormat('dd-MM-yyyy')
                                                    .format(selectedDate);
                                          }
                                        });
                                      }),
                                )
                              ],
                            ),
                            addVerticalSpace(10),
                            InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    postLedgerMaster();
                                  }
                                },
                                child: Button(savetxt)),
                            addVerticalSpace(15),
                            redButton(delettxt),
                            addVerticalSpace(10),
                          ]),
                    ),
                  ))),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Temporary address. ',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    addVerticalSpace(10),
                    CSCPicker(
                      showStates: true,
                      showCities: true,
                      defaultCountry: CscCountry.India,
                      dropdownDecoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: AppColor.kWhite,
                          border: Border.all(
                            width: 2,
                            color: AppColor.kBlack,
                          )),
                      disabledDropdownDecoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: AppColor.kWhite,
                          border: Border.all(color: AppColor.kBlack, width: 2)),
                      countryDropdownLabel: "Select Country",
                      stateDropdownLabel: " Select State",
                      cityDropdownLabel: " Select City",
                      dropdownHeadingStyle: TextStyle(
                          color: AppColor.kBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      dropdownItemStyle: TextStyle(
                        color: AppColor.kBlack,
                        fontSize: 14,
                      ),
                      dropdownDialogRadius: 10.0,
                      searchBarRadius: 10.0,
                      onCountryChanged: (value) {
                        setState(() {
                          cityValue;
                          cityValue;
                          "City";
                          countryValue = value;
                        });
                      },
                      onStateChanged: (value) {
                        setState(() {
                          stateValue = stateValue;
                        });
                      },
                      onCityChanged: (value) {
                        setState(() {
                          cityValue = countryValue;
                        });
                      },
                    ),
                    addVerticalSpace(10),
                    textformfiles(DistrictController,
                        labelText: "District",
                        keyboardType: TextInputType.number),
                    addVerticalSpace(10),
                    textformfiles(AddressControler, labelText: "Address"),
                    addVerticalSpace(10),
                    Row(
                      children: [
                        addVerticalSpace(10),
                        Expanded(
                            child: textformfiles(PinController,
                                labelText: "Pin Code",
                                keyboardType: TextInputType.number)
                            // textfild("Pin Code", TextInputType.number)

                            ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: textformfiles(StdController,
                                labelText: "Std Code",
                                keyboardType: TextInputType.number))
                      ],
                    ),
                    addVerticalSpace(10),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.kbuttonclr),
                        child: Center(
                            child: textcostam("Save", 16, AppColor.kWhite)),
                      ),
                    ),
                    addVerticalSpace(10),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.kRed,
                      ),
                      child: Center(
                          child: textcostam("Delete", 16, AppColor.kWhite)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        addhorizontalSpace(20),
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.5), // shadow color
                                      spreadRadius: 5, // spread radius
                                      blurRadius: 5, // blur radius
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 50,
                                  backgroundImage: imageFile == null
                                      ? const AssetImage(
                                          "assets/gallery-export.png",
                                        )
                                      : FileImage(imageFile!) as ImageProvider,
                                  child: imageFile == null
                                      ? Icon(Icons.add)
                                      : Container(),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _showPicker(context);
                                },
                                child: CircleAvatar(
                                  maxRadius: 15,
                                  child: Icon(
                                    Icons.edit,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        addhorizontalSpace(50),
                        SizedBox(
                            width: 170,
                            child: textformfiles(Doc1Controller,
                                labelText: "Document Name")),
                      ],
                    ),
                    addVerticalSpace(10),
                    Text(
                      "                       Doc 1",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    addVerticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        addhorizontalSpace(20),
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.5), // shadow color
                                      spreadRadius: 5, // spread radius
                                      blurRadius: 5, // blur radius
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 50,
                                  backgroundImage: imageFile2 == null
                                      ? const AssetImage(
                                          "assets/gallery-export.png",
                                        )
                                      : FileImage(imageFile2!) as ImageProvider,
                                  child: imageFile2 == null
                                      ? Icon(Icons.add)
                                      : Container(),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _showPicker2(context);
                                },
                                child: CircleAvatar(
                                  maxRadius: 15,
                                  child: Icon(
                                    Icons.edit,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        addhorizontalSpace(50),
                        SizedBox(
                            width: 170,
                            child: textformfiles(Doc2Controller,
                                labelText: "Document Name")),
                      ],
                    ),
                    addVerticalSpace(10),
                    Text(
                      "                       Doc 2",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    addVerticalSpace(10),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: imageFiles.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 20),
                                SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 5,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 50,
                                          backgroundImage: imageFiles[index] ==
                                                  null
                                              ? AssetImage(
                                                  "assets/gallery-export.png",
                                                )
                                              : FileImage(imageFiles[index]!)
                                                  as ImageProvider,
                                          child: imageFiles[index] == null
                                              ? Icon(Icons.add)
                                              : Container(),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _showPicker1(index);
                                        },
                                        child: CircleAvatar(
                                          maxRadius: 15,
                                          child: Icon(
                                            Icons.edit,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 50),
                                SizedBox(
                                    width: 170,
                                    child: textformfiles(controllers[index],
                                        labelText: "Document Name")
                                    // TextFormField(
                                    //   controller: controllers[index],
                                    //   decoration: InputDecoration(
                                    //       labelText: "Document Name"),
                                    // ),
                                    ),
                              ],
                            ),
                            SizedBox(height: 10),
                            // Text(
                            //   "Doc ${index + 1}",
                            //   style: TextStyle(fontWeight: FontWeight.bold),
                            // ),
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              imageFiles.add(null);
                              controllers.add(TextEditingController());
                            });
                          },
                          child: Text('Add more +')),
                    ),
                    addVerticalSpace(20),
                    InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: Button(savetxt)),
                    addVerticalSpace(10),
                    redButton(delettxt)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> postLedgerMaster() async {
    print('1');
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/PostLedgerMaster');
    final Map<String, dynamic> body = {
      "Title_Id": 1,
      "Ledger_Name": LedgerController.text,
      "Son_Off": "${sonoff.text}",
      "Address": "${AddressControler.text}",
      "Address2": "Jaipur",
      "City_Id": 1,
      "Std_Code": "${StdController.text}",
      "Mob": "${MobileController.text}",
      "Pin_Code": "${PinController.text}",
      "Ledger_Group_Id": int.parse(LegderID),
      "Opening_Bal": "${OpenController.text}",
      "Opening_Bal_Combo": "Dr",
      "Gst_No": "${GstController.text}",
      "Address_TA": "Address2_TA",
      "Address2_TA": "",
      "Std_Code_TA": "0151",
      "Mob_TA": "9462653836",
      "Pin_Code_TA": "302012",
      "SubcidyIdNo": " SubcidyIdNo",
      "DueDate": "17/12/2023",
      "ClosingBal": "0",
      "ClosingBal_Type": "cr",
      "Category_Id": genralid ?? 0,
      "Staff_Id": staffList
          .firstWhere((staff) => staff.staffName == selectedStaffId,
              orElse: () => Staffmodel(id: 0, staffName: ''))
          .id,
      "CreditLimit": "Address2_TA",
      "CreditDays": "",
      "WhatappNo": 122,
      "EmailId": "${emailController.text}",
      "BirthdayDate": "302012",
      "AnniversaryDate": " SubcidyIdNo",
      "DistanceKm": "17/12/2023",
      "DiscountSource": "0",
      "DiscountValid": "Dr",
      "Location_Id": loctionid ?? 0,
      "OtherNumber1": 1,
      "OtherNumber2": 2,
      "OtherNumber3": 3,
      "OtherNumber4": 4,
      "OtherNumber5": 5,
      "GSTTypeId": selectedGstId ?? 0,
      "IGST": 28,
      "CGST": 14,
      "SGST": 14,
      "CESS": 1,
      "RCMStatus": 28,
      "ITCStatus": 14,
      "ExpencesTypeId": 14,
      "RCMCategory": 1
    };
    print('2');

    try {
      final response = await http.post(
        url,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );
      print('3');

      var data = jsonDecode(response.body);
      print('API Response: $data');
      print('4');

      if (response.statusCode == 200) {
        if (data['result'] == true) {
          Get.snackbar(
            'Success',
            'API call was successful!',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          print('5');
          // clearAllControllers();
          print('API call successful');
          Navigator.pop(context);
        } else {
          print('API call failed');
          if (data['message'] != null) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Error'),
                content: Text(data['message']),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          }
        }
        print('6');
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
      print('7');
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> lagerGroupApi() async {
    final url =
        Uri.parse('http://lms.muepetro.com/api/UserController1/GetLedgerGroup');
    try {
      final response = await http.get(url);
      var data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        setState(() {
          dealer.add({'ledger_Group_Name': 'Select a Group', 'id': 0});
          dealer.addAll(data.cast<Map<String, dynamic>>());
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

  Future<void> gstCatagry() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetGstCategary?MiscTypeId=20');
    try {
      final response = await http.get(url);
      var data = jsonDecode(response.body);
      print('API Response: $data');
      if (response.statusCode == 200) {
        setState(() {
          dealer0.add({'name': 'Select a GST Catagary', 'id': 0});
          dealer0.addAll(data.cast<Map<String, dynamic>>());
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> catageryId15() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetGstCategary?MiscTypeId=15');
    try {
      final response = await http.get(url);
      var data = jsonDecode(response.body);
      print('API Response: $data');
      if (response.statusCode == 200) {
        setState(() {
          dealer1.add({'name': 'Select a Category', 'id': 0});
          dealer1.addAll(data.cast<Map<String, dynamic>>());
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
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

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Gallery'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  Future _imgFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
    }
  }

  Future _imgFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
    }
  }

  void _showPicker2(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Gallery'),
                    onTap: () {
                      _imgFromGallery1();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    _imgFromCamera1();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  Future _imgFromCamera1() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        imageFile2 = File(image.path);
      });
    }
  }

  Future _imgFromGallery1() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        imageFile2 = File(image.path);
      });
    }
  }

  void _showPicker1(int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Photo Library'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  setState(() {
                    if (pickedFile != null) {
                      imageFiles[index] = File(pickedFile.path);
                    } else {
                      print('No image selected.');
                    }
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  setState(() {
                    if (pickedFile != null) {
                      imageFiles[index] = File(pickedFile.path);
                    } else {
                      print('No image selected.');
                    }
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
