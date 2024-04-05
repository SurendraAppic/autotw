// ignore_for_file: unused_import, unused_local_variable, unused_element
import 'package:autowheelapp/models/manufacturemodel.dart';
import 'package:autowheelapp/screen/Intro/HomePage.dart';
import 'package:autowheelapp/screen/Jobcard/Addpartpurchessinvoic.dart';
import 'package:autowheelapp/screen/master/Ledgermaster.dart';
import 'package:autowheelapp/utils/widget/Controllerdeta.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PurchaseInvoiceScreen extends StatefulWidget {
  PurchaseInvoiceScreen({super.key});
  @override
  State<PurchaseInvoiceScreen> createState() => _PurchaseInvoiceScreenState();
}

TextEditingController datepickar = TextEditingController(
  text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
);
final InvoiceController invoiceController = Get.put(InvoiceController());
TextEditingController Supplerinvocontroller = TextEditingController();
TextEditingController purchesasecontroller = TextEditingController();

TextEditingController ManufacturerController = TextEditingController();
TextEditingController discountamtController = TextEditingController();
TextEditingController PinvNoController = TextEditingController();
var h, w;

// String? relation2;
// List _relate2 = [];
List<Map<String, dynamic>> manufacturers = [];
int Manufacturerid = 0;
Map<String, dynamic>? selectedManufacturerValue;
double discount = 0.0;
// var manufactureValue;

class _PurchaseInvoiceScreenState extends State<PurchaseInvoiceScreen> {
  refreshData() async {
    await manufutureurData();
    // _fetchRefNo();
  }

  @override
  void initState() {
    super.initState();
    manufutureurData();
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.search,
            color: AppColor.kBlack,
          )
        ],
        centerTitle: true,
        title: Text('Purchease Invoice'),
        toolbarHeight: 35,
        leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePageScreen()));
            },
            child: Icon(Icons.arrow_back, color: AppColor.kBlack)),
        backgroundColor: AppColor.kappabrcolr,
      ),
      body: Container(
        height: Get.height,
        color: AppColor.kappabrcolr.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          readOnly: true,
                          controller: datepickar,
                          decoration: InputDecoration(
                              fillColor: AppColor.kWhite,
                              filled: true,
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
                              prefixIcon: Icon(
                                Icons.edit_calendar,
                                color: AppColor.kBlack,
                              ),
                              contentPadding: EdgeInsets.all(5),
                              hintText: datetxt,
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
                                datepickar.text = DateFormat('dd-MM-yyyy')
                                    .format(selectedDate);
                              }
                            });
                          }),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: textformfiles(PinvNoController,
                            labelText: 'Pinv No'))
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    Expanded(
                        child: textformfiles(Supplerinvocontroller,
                            labelText: "Supplier invoice")),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: textformfiles(purchesasecontroller,
                            labelText: "place of supply"))
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
                              selectmaanufacturetxt,
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
                          Get.to(LedgerScreen())!
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
                InkWell(
                    onTap: () {
                      Get.to(addpartsScreen(
                        setclass: 2,
                      ));
                    },
                    child: Button("Add parts")),
                addVerticalSpace(10),
                Rowdata("gross Amt", "${totaligst2()}"),
                addVerticalSpace(10),
                Rowdata("Other", "0.0"),
                addVerticalSpace(10),
                Rowdata("Igst", "${totaligst1()}"),
                addVerticalSpace(10),
                Rowdata("Cgst", "${((totaligst1() / 2).toStringAsFixed(1))}"),
                addVerticalSpace(10),
                Rowdata("Sgst", "${((totaligst1() / 2).toStringAsFixed(1))}"),
                addVerticalSpace(10),
                Rowdata("Cess", "0.0"),
                addVerticalSpace(10),
                // Rowdata("Discount", "0.0"),
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
                        controller: discountamtController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          discount = double.tryParse(value) ?? 0.0;
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          fillColor: AppColor.kWhite,
                          filled: true,
                          hintText: "0.0",
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

                addVerticalSpace(10),
                Rowdata("net Amt", "${totaligst3() - discount}"),
                addVerticalSpace(10),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.kbuttonclr),
                    child:
                        Center(child: textcostam("Save", 16, AppColor.kWhite)),
                  ),
                ),
                addVerticalSpace(15)
              ],
            ),
          ),
        ),
      ),
    );
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

  Future<void> manufutureurData() async {
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetLedger?LedgerGroupId=9');
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

  totaligst1() {
    double amt1 = 0;
    for (var i = 0; i < invoiceController.purchessinvoic.length; i++) {
      amt1 +=
          double.parse(invoiceController.purchessinvoic[i]['Igst'].toString());
    }
    return amt1;
  }

  totaligst2() {
    double amt2 = 0;
    for (var i = 0; i < invoiceController.purchessinvoic.length; i++) {
      amt2 +=
          double.parse(invoiceController.purchessinvoic[i]['gross'].toString());
    }
    return amt2;
  }

  totaligst3() {
    double amt3 = 0;
    for (var i = 0; i < invoiceController.purchessinvoic.length; i++) {
      amt3 += double.parse(
          invoiceController.purchessinvoic[i]['netamtValue'].toString());
    }
    return amt3;
  }
}
