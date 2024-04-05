// ignore_for_file: unused_local_variable, unused_label, unused_import, must_be_immutable, unnecessary_import, unused_element, file_names, depend_on_referenced_packages, unnecessary_late, non_constant_identifier_names, prefer_typing_uninitialized_variables, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, avoid_print, prefer_const_declarations, empty_statements, unnecessary_null_comparison
import 'dart:convert';
import 'package:autowheelapp/account/invoiceprint.dart';
import 'package:autowheelapp/account/pdfinvoic.dart';

import 'package:autowheelapp/labour/AddLabour.dart';
import 'package:autowheelapp/models/Staffmodelpage.dart';
import 'package:autowheelapp/models/hsnmodel.dart';
import 'package:autowheelapp/models/manufacturemodel.dart';
import 'package:autowheelapp/screen/Intro/HomePage.dart';
import 'package:autowheelapp/screen/Jobcard/Addpartpurchessinvoic.dart';
import 'package:autowheelapp/screen/master/Ledgermaster.dart';
import 'package:autowheelapp/screen/master/LocationMaster.dart';
import 'package:autowheelapp/screen/master/StaffMaster.dart';
import 'package:autowheelapp/showroom/Prosepet.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/Controllerdeta.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/widgets.dart' as pw;
import 'dart:developer';
import 'dart:io';
import 'package:autowheelapp/models/invoicmodel.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';

class InvoiveScreen extends StatefulWidget {
  bool value = true;
  String? natvalue;
  final double? netAmount;
  InvoiveScreen(
      {required this.value, this.natvalue, this.netAmount, super.key});

  @override
  State<InvoiveScreen> createState() => _InvoiveScreenState();
}

late TimeOfDay selectedTime2 = TimeOfDay.now();

class _InvoiveScreenState extends State<InvoiveScreen>
    with AutomaticKeepAliveClientMixin {
  final InvoiceController invoiceController = Get.put(InvoiceController());
  TextEditingController Saledatepicker = TextEditingController(
    text: DateFormat('yyyy/MM/dd').format(DateTime.now()),
  );
  String so = "Model";
  List co = ['Model', 'Case Book', 'Sbi Bank'];

  String Place = "place of supplying";
  List Supping = ['place of supplying', 'Case Book', 'Sbi Bank'];
//////staff
  String selectedStaffId = '';
  List<String> options = [];

  List<Staffmodel> staffList = [];
  String staffName = "John Doe";
  ///////
  int selectedId3 = 0;
  var loctionid;
  var printshow = false;
  List<Map<String, dynamic>> Loctionshow = [];
  String Parsant = "Payment Mode";
  List Mode = ['Payment Mode', 'Case Book', 'Sbi Bank'];
  String countryValue = "India";
  String stateValue = "";
  String cityValue = "";
  TextEditingController mobilecontroller = TextEditingController();
  double igstamountAPi = 0.0;
  String totalamountGet = "0.0";
  // double totalIgst = 0;
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

  List<Map<String, dynamic>> dealer = [];
  List<Map<String, dynamic>> manufacturers = [];
  Map<String, dynamic>? selectedManufacturer;
  int? selectedRadio;
  final StdController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController prefixcontroller = TextEditingController();
  TextEditingController onlinecontroler = TextEditingController(text: 'online');
  TextEditingController invoiccontroller =
      TextEditingController(text: 'online');
  TextEditingController Addresscontroller = TextEditingController();
  TextEditingController partycontroller = TextEditingController();
  TextEditingController Vichalnumbarcontroller = TextEditingController();
  // TextEditingController Vichalnumbarcontroller = TextEditingController();
  TextEditingController kmcontroller = TextEditingController();
  late TextEditingController igstController;
  var isshow = false;
  var chack = false;
  var Right = false;
  var Wathsap = false;
  var job = true;
  var h, w;
  double discount = 0.0;
  List<String> addedItemList = [];
  int Manufacturerid = 0;
  TextEditingController ManufacturerController = TextEditingController();
  //  int Manufacturerid = 0;
  Map<String, dynamic>? selectedManufacturerValue;
  int selectedPaymentType = 0;
  // int selectedPaymentType = 0;
  setSelectedRadio(int? val) {
    setState(() {
      selectedRadio = val;
      if (val == 1) {
        manufutureurData(11);
      } else if (val == 2) {
        manufutureurData(7);
      } else if (val == 3) {
        manufutureurData(10);
      }
    });
  }

  refreshData() async {
    await manufutureurData(10);
    staff();
    // _fetchRefNo();
  }

  late Invocmodel invocModel;
  Invocmodel? model;
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
    selectedRadio = 1;
    manufutureurData(11);
    manufutureurData(10);
    prefixdeta();
    staff();
    loction();
    printData();
    // PdfInvoiceApi.printData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 35,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: AppColor.kBlack,
          ),
        ),
        centerTitle: true,
        title: Text(titleinvoic),
        backgroundColor: AppColor.kappabrcolr,
      ),
      body: Container(
        color: AppColor.kappabrcolr.withOpacity(0.1),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                addVerticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 47,
                          decoration: BoxDecoration(
                            color: AppColor.kWhite,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: onlinecontroler,
                                    readOnly: true,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      fillColor: AppColor.kWhite,
                                      filled: true,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      hintText: perfixtext.toString(),
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  thickness: 2,
                                  color: AppColor.kBlack,
                                ),
                                Expanded(
                                  child: TextField(
                                    onChanged: (e) {
                                      printData();
                                    },
                                    controller: prefixcontroller,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      hintText: invoicno,
                                    ),
                                  ),
                                ),
                              ])),
                    ),
                    addhorizontalSpace(
                      10,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          invoicdeta().then((value) => setState(() {
                                // total2();
                                // totaligst();
                              }));
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff83c5be), width: 2),
                              borderRadius: BorderRadius.circular(25),
                              color: Color(0xff83c5be)),
                          child: Center(
                              child: Text(
                            find,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: job ? Colors.white : AppColor.kBlack,
                            ),
                          )),
                        ),
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
                        controller: Saledatepicker,
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
                                BorderSide(width: 52.0, color: Colors.red),
                          ),
                          contentPadding: EdgeInsets.all(5),
                          labelText: "Date",
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
                              Saledatepicker.text =
                                  DateFormat('dd-MM-yyyy').format(selectedDate);
                            }
                          });
                        },
                      ),
                    ),
                    addhorizontalSpace(10),
                    Expanded(
                        child: textformfiles(
                      invoiccontroller,
                      labelText: invoicname,
                    ))
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            job = true;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    job ? Color(0xff83c5be) : AppColor.kBlack,
                                width: 2),
                            borderRadius: BorderRadius.circular(25),
                            color: job ? Color(0xff83c5be) : Color(0x00000000),
                          ),
                          child: Center(
                              child: Text(
                            countertext.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: job ? Colors.white : AppColor.kBlack,
                            ),
                          )),
                        ),
                      ),
                    ),
                    addhorizontalSpace(10),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          // invoicdeta();

                          setState(() {
                            job = false;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                color: !job ? Color(0xff83c5be) : Colors.black,
                                width: 2),
                            color: !job
                                ? Color(0xff83c5be)
                                : Colors
                                    .transparent, // Add background color for selected item
                          ),
                          child: Center(
                              child: Text(
                            searvicetxt,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: !job ? Colors.white : AppColor.kBlack,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                addVerticalSpace(10),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xff83c5be),
                  ),
                  child: // 1 corresponds to the index of 'Card'
                      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(3, (index) {
                      int radioValue = index;
                      String buttonText;

                      switch (radioValue) {
                        case 0:
                          buttonText = 'Credit';
                          break;
                        case 1:
                          buttonText = 'Card';
                          break;
                        case 2:
                          buttonText = 'Cash';
                          break;
                        default:
                          buttonText = '';
                      }

                      return GestureDetector(
                        onTap: () {
                          selectedManufacturerValue = null;
                          setSelectedRadio(radioValue);
                          setState(() {
                            selectedPaymentType = radioValue;
                          });
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                              child: Radio(
                                activeColor: Colors.black,
                                value: radioValue,
                                groupValue: selectedPaymentType,
                                onChanged: (val) {
                                  selectedManufacturerValue = null;
                                  setSelectedRadio(val);
                                  setState(() {
                                    selectedPaymentType = radioValue;
                                  });
                                },
                              ),
                            ),
                            Text(
                              '   $buttonText',
                              style: TextStyle(
                                color: AppColor.kWhite,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
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
                              selectmaanufacturetxt,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.kBlack,
                                  fontWeight: FontWeight.bold),
                            ),
                            items: manufacturers
                                .map((item) => DropdownMenuItem(
                                      onTap: () {
                                        // Manufacturerid = item['id'];
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
                                // selectedManufacturerValue = value!['id']
                                //     .toString() as Map<String, dynamic>?;
                                selectedManufacturerValue = value;
                                // ignore: avoid_print
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
                                    contentPadding: const EdgeInsets.symmetric(
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
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => LedgerScreen()))
                              .then((value) => setState(() {
                                    refreshData();
                                  }));
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
                    )
                  ],
                ),
                addVerticalSpace(10),
                textformfiles(partycontroller, labelText: partyname),
                addVerticalSpace(10),
                textformfiles(
                  Addresscontroller,
                  labelText: addresstext.toString(),
                ),
                addVerticalSpace(10),
                textformfiles(mobilecontroller, validator: (value) {
                  if (value == null || value.isEmpty) {
                    return mobilenmbarreq;
                  }
                  if (value.length != 10 ||
                      !RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Enter a valid 10-digit mobile number.';
                  }
                  return null;
                },
                    keyboardType: TextInputType.number,
                    labelText: mobilenumbar,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Image.asset(
                        'assets/mobilenumbar.png',
                        height: 20,
                      ),
                    )),
                addVerticalSpace(10),
                CSCPicker(
                  showStates: true,
                  showCities: true,
                  defaultCountry: CscCountry.India,
                  dropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: AppColor.kWhite,
                      border: Border.all(
                        width: 2,
                        color: AppColor.kBlack,
                      )),
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: AppColor.kWhite,
                      border: Border.all(color: AppColor.kBlack, width: 2)),
                  countryDropdownLabel: "Select Country",
                  stateDropdownLabel: " Select State",
                  cityDropdownLabel: " Select City",
                  // selectedItemStyle:
                  //     rubikTextStyle(16, FontWeight.w500, AppColor.colBlack),
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
                Row(
                  children: [
                    Expanded(
                      child: textformfiles(Vichalnumbarcontroller,
                          keyboardType: TextInputType.number,
                          labelText: Vehicleno),
                    ),
                    addhorizontalSpace(10),
                    Expanded(
                        child: textformfiles(kmcontroller, labelText: "Km"))
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(5),
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColor.kWhite,
                          border: Border.all(color: Colors.black, width: 2),
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
                                items: options.map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                            ),
                          ],
                        ),
                      ),
                    ),
                    addhorizontalSpace(10),
                    SizedBox(
                      width: 50,
                      child: InkWell(
                        onTap: () {
                          Get.to(Staff_master())!.then((value) => staff());
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
                            color: AppColor.kWhite,
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButton(
                          underline: Container(),
                          value: Place,
                          dropdownColor:
                              const Color.fromARGB(255, 211, 247, 212),
                          icon: Icon(Icons.keyboard_arrow_down_outlined,
                              size: h * 0.030, color: AppColor.kBlack),
                          isExpanded: true,
                          items: Supping.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              Place = value.toString();
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
                          // Get.to(ColorsScreen());
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
                        padding: EdgeInsets.all(5),
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColor.kWhite,
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
                InkWell(
                    onTap: () {
                      // final result = await
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => addpartsScreen(
                              setclass: 1,
                              invocnumbar: int.parse(prefixcontroller.text),
                              loctionvalue: selectedId3,
                              traindate: Saledatepicker.text.toString()),
                        ),
                      );
                    },
                    child: Button("Add Parts")),
                addVerticalSpace(10),
                InkWell(
                    onTap: () {
                      // final result1 =
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Addlabourjobcard(
                            jobcardlabour: true,
                            loctionvalue: 2,
                          ),
                        ),
                      );
                    },
                    child: Button("Add Labour")),
                addVerticalSpace(10),
                Obx(() => Rowdata("Total Spare",
                    "${invoiceController.totalParts.toStringAsFixed(2)}")),
                addVerticalSpace(10),
                Obx(() => Rowdata("Total Labour",
                    "${invoiceController.totalLabours.toStringAsFixed(2)}")),
                addVerticalSpace(10),
                Obx(() => Rowdata(igsttext.toString(),
                    "${invoiceController.totalGst.toStringAsFixed(2)}")),
                addVerticalSpace(10),
                Obx(() => Rowdata(sgstxt,
                    "${(invoiceController.totalGst / 2).toStringAsFixed(2)}")),
                addVerticalSpace(10),
                Obx(() => Rowdata(cgsttxt,
                    "${(invoiceController.totalGst / 2).toStringAsFixed(2)}")),
                addVerticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Discount",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 154,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        controller: discountController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          discount = double.tryParse(value) ?? 0.0;
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColor.kWhite,
                          hintText: "0.00",
                          hintStyle: TextStyle(
                              fontSize: 16,
                              color: AppColor.kBlack,
                              fontWeight: FontWeight.w600),
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          alignLabelWithHint: true,
                        ),
                      ),
                    )
                  ],
                ),
                Obx(() => Rowdata("Net Amount",
                    "${(invoiceController.totalParts + invoiceController.totalLabours + invoiceController.totalGst - discount).toStringAsFixed(2)}")),
                addVerticalSpace(5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                      onPressed: () async {
                        final pdfFile = await PdfInvoiceApi.generate(
                            partynamedeta: partyName,
                            datetimedeta: datetime,
                            addressdeta: address,
                            gst: gstdeta,
                            vichalnumbar: vehicleNumbar,
                            modelname: modelname,
                            saleItemList: itemsdeta,
                            invoicnumbar: invoicnumbar,
                            TexiablAmount: TexiablAmount,
                            km: kmnumbar,
                            Phonenumbar: phonenumbar,
                            jobnumbar: jobnumbar,
                            discountamount: double.parse(discount.toString()),
                            igsttext: igstvalue);
                        FileHandleApi.openFile(pdfFile);
                      },
                      child: Text("Invoic Print")),
                ),
                addVerticalSpace(10),
                InkWell(
                    onTap: () async {
                      postSaleInvoice();
                    },
                    child: Button(savetxt)),
                addVerticalSpace(10),
                addVerticalSpace(10),
                InkWell(onTap: () {}, child: redButton(delettxt)),
                addVerticalSpace(50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String partyName = '';
  String TexiablAmount = '';
  String igstvalue = '';
  String phonenumbar = '';
  String datetime = '';
  String address = '';
  int gstdeta = 0;
  int invoicnumbar = 0;
  String modelname = '';
  String vehicleNumbar = '';
  String kmnumbar = '';
  int jobnumbar = 0;

  List<dynamic> itemsdeta = [];

  // List<String> stringItemList = [];

  Future<void> printData() async {
    final String refNumget = prefixcontroller.text;
    print('1');
    final String apiUrl =
        'http://lms.muepetro.com/api/UserController1/GetSaleInvoice?prefix=online&refno=$refNumget&locationid=2';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      print('2');
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final Invocmodel invocModel = Invocmodel.fromJson(data);
        print('item Name: ${invocModel.saleInvoiceItems[0].gst}');
        partyName = invocModel.partyName;
        datetime = invocModel.invoiceDate;
        address = invocModel.address;
        vehicleNumbar = invocModel.vehicleNo;
        // gstdeta = invocModel.gst;
        gstdeta = int.parse(invocModel.gst);
        invoicnumbar = int.parse(invocModel.invoiceNo.toString());

        modelname = invocModel.modelName;
        kmnumbar = invocModel.b;
        phonenumbar = invocModel.mob;
        jobnumbar = invocModel.jobCardNo;

        itemsdeta = invocModel.saleInvoiceItems;
        TexiablAmount = '${invocModel.saleInvoiceItems[0].taxable}';
        igstvalue = '${invocModel.saleInvoiceItems[0].igstAmount.toDouble()}';

        debugPrint(itemsdeta.length.toString());

        setState(() {});
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> invoicdeta() async {
    print(1);
    final String refNum = prefixcontroller.text;
    final String apiUrl =
        'http://lms.muepetro.com/api/UserController1/GetSaleInvoice?prefix=online&refno=$refNum&locationid=2';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          Addresscontroller.text = data['prefix_Name'] ?? '';
          partycontroller.text = data['party_Name'] ?? '';
          Vichalnumbarcontroller.text = data['vehicle_No'] ?? '';
          Saledatepicker.text = data['Invoice_Date'] ?? '';
          mobilecontroller.text = data['mob'] ?? '';
          Saledatepicker.text = data['invoice_Date'] ?? '';
          kmcontroller.text = data['b'] ?? '';
          so = data['model_Name'] ?? '';
          selectedId3 = data['location_Id'] ?? 0;
          Manufacturerid = data['ledger_Id'] ?? 0;
          igstamountAPi = data['sale_Invoice_Items'][0]['igstAmount'] ?? 0;
          totalamountGet = data['sale_Invoice_Items'][0]['total_Price'] ?? '0';
          selectedPaymentType =
              int.tryParse(data['payment_Type'] ?? '')?.toInt() ?? 0;
          setSelectedRadio(selectedPaymentType);

          if (manufacturers.isNotEmpty) {
            selectedManufacturerValue = manufacturers.firstWhere(
              (item) => item['id'] == Manufacturerid,
              // orElse: () => null,
            );

            if (selectedManufacturerValue == null) {
              print('No matching manufacturer found for id: $Manufacturerid');
            } else {
              print(
                  'Manufacturer found: ${selectedManufacturerValue.toString()}');
              print(3);
            }
          } else {
            print('Manufacturers list is empty.');
            selectedManufacturerValue = null;
          }

          int paymentType = int.tryParse(data['payment_Type'] ?? '') ?? 0;

          switch (paymentType) {
            case 1:
              selectedManufacturerValue = manufacturers.firstWhere(
                (item) => item['id'] == 1,
                // orElse: () => null,
              );
              break;
            case 2:
              selectedManufacturerValue = manufacturers.firstWhere(
                (item) => item['id'] == 2,
                // orElse: () => null,
              );
              break;
            case 3:
              selectedManufacturerValue = manufacturers.firstWhere(
                (item) => item['id'] == 3,
                // orElse: () => null,
              );
              break;
            default:
              selectedManufacturerValue = null;
          }
          print(4);
        });
      } else {
        print('Error Response: ${response.body}');
      }
    } catch (error) {
      selectedManufacturerValue = null;
      print('Error: $error');
    }
    print(5);
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
            selectedStaffId = staffList.first.staffName;
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

  Future<void> manufutureurData(int ledgerGroupId) async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetLedger?LedgerGroupId=$ledgerGroupId');
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

  Future<void> prefixdeta() async {
    final url =
        'http://lms.muepetro.com/api/UserController1/GetInvoiceNo?Tblname=Sale_Invoice&Fldname=Invoice_No&transdatefld=Invoice_Date&varprefixtblname=Prefix_Name&prefixfldnText=%27Online%27&varlocationid=2';

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
          prefixcontroller.text = jsonData
              .toString(); // Directly assign the value without accessing a specific field
        });
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  double TotalLabour() {
    double amount0 = 0;
    for (var i = 0; i < invoiceController.addlabourlist.length; i++) {
      invoiceController.addlabourlist.length == 0
          ? amount0 +=
              double.parse(invoiceController.addlabourlist[i]['netamtValue'])
          : 0;
    }
    return amount0;
  }

  double totaligst() {
    double totalIgst = igstamountAPi ?? 0;

    for (var i = 0; i < invoiceController.addlabourlist.length; i++) {
      double igstAmountGet =
          invoiceController.addlabourlist[i]['igstAmountGet'] ?? 0;
      totalIgst += igstAmountGet;
    }
    return totalIgst;
  }

  double total2() {
    double amount2 = double.parse(totalamountGet) ?? 0;
    for (var i = 0; i < invoiceController.addlabourlist.length; i++) {
      invoiceController.addlabourlist.length == 0
          ? amount2 += double.parse(invoiceController.addlabourlist[i]['gross'])
          : 0;
    }
    return amount2;
  }

  double addparttotal1() {
    double amount4 = 0;
    for (var i = 0; i < invoiceController.addpartlist.length; i++) {
      amount4 +=
          double.parse(invoiceController.addpartlist[i]['Igst'].toString());
    }
    return amount4;
  }

  double addparttotal2() {
    double amount5 = 0;
    for (var i = 0; i < invoiceController.addpartlist.length; i++) {
      amount5 +=
          double.parse(invoiceController.addpartlist[i]['gross'].toString());
    }
    return amount5;
  }

  Future<void> postSaleInvoice() async {
    print(1);
    final String apiUrl =
        'http://lms.muepetro.com/api/UserController1/PostSaleInvoice';

    // Ensure "Igst_Text" is converted to double before adding to the requestBody
    // double igstTextValue = invoiceController.totalGst.toDouble();

    Map<String, dynamic> requestBody = {
      "Location_Id": selectedId3,
      "Prefix_Name": "online",
      "Invoice_No": int.parse(prefixcontroller.text.toString()),
      "Invoice_Date": Saledatepicker.text.toString(),
      "Ledger_Id": Manufacturerid,
      "Ledger_Name": "Ledger_Name",
      "Vehicle_No": Vichalnumbarcontroller.text.toString(),
      "Model_Name": 'so.toString()',
      "Party_Name": partycontroller.text.toString(),
      "Address": Addresscontroller.text.toString(),
      "Mob": mobilecontroller.text.toString(),
      "City_Name": "City_Name",
      "Gross_Amount": "0",
      "Taxable_Amount":
          "${(invoiceController.totalParts + invoiceController.totalLabours - discount).toStringAsFixed(2)}",
      "Gst": "18",
      "Discount": "0",
      "Net_Amount":
          "${(invoiceController.totalParts + invoiceController.totalLabours).toStringAsFixed(2)}",
      "Cash_Sale": "${selectedPaymentType == 0 ? Manufacturerid : 0}",
      "Credit_Sale": "${selectedPaymentType == 1 ? Manufacturerid : 0}",
      "Card_Sale": "${selectedPaymentType == 2 ? Manufacturerid : 0}",
      "Payment_Type": selectedPaymentType.toString(),
      "Other_Charge": "0",
      "Sale_Type": "1",
      "Remarks": "Remarks",
      "a": "1",
      "b": kmcontroller.text,
      "c": "3",
      "d": "4",
      "e": "5",
      "f": "6",
      "Misc_Charge_Id": 1,
      "Misc_Charge": "0",
      "Misc_Per": 0,
      "Igst_Text": double.parse(invoiceController.totalGst.toStringAsFixed(2)),
      // .toStringAsFixed(2), // Convert to string with 2 decimal places
      "Cgst_Tax": 0,
      "Sgst_Tax": 0,
      // "Cgst_Tax": (invoiceController.totalGst / 2).toStringAsFixed(2),
      // "Sgst_Tax": (invoiceController.totalGst / 2).toStringAsFixed(2),
      "Cess_Tax": 0,
      "Extra1": "",
      "Extra2": "",
      "Extra3": "",
      "Extra4": "",
      "Prefix_Name_Job": "",
      "ReceiptNo": 0,
      "AdvanceAmt": 0,
      "Mode_Id": 0,
      "BalanceAmt": 0,
      "EinvoiceStatus": "0",
      "Sale_Invoice_Items": [...labourListdeta, ...apiList],
    };
    print(2);
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );
      print(3);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['result'] == true) {
          Get.snackbar('Success', 'Invoice posted successfully',
              backgroundColor: AppColor.kGreen);
          print('Response Data: $data');
          print(4);
        } else {
          Get.snackbar('Error', 'Duplicate Invoice Number',
              backgroundColor: AppColor.kRed);
          print('Error Response: ${response.statusCode} - ${response.body}');
        }
        clearValues();
        print(5);
      } else {
        print('Error Response: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void updateUIWithData(updatedData) {
    invoiceController.addlabourlist.add(updatedData);
    setState(() {});
  }

  void updateUILabourData(updatedLabourData) {
    invoiceController.addpartlist.add(updatedLabourData);
    setState(() {});
  }

  void clearValues() {
    prefixcontroller.clear();
    Saledatepicker.clear();
    Vichalnumbarcontroller.clear();
    Saledatepicker.clear();
    mobilecontroller.clear();
    Addresscontroller.clear();
    partycontroller.clear();
    prefixcontroller.clear();
    kmcontroller.clear();
    invoiceController.clearValues();
    // selectedStaffId = null;
  }
}
