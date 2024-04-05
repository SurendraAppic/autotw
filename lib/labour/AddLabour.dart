// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unused_import, unnecessary_import

import 'dart:convert';

import 'package:autowheelapp/controller/getx_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:autowheelapp/account/InvoiceScreen.dart';
import 'package:autowheelapp/labour/AddLabour.dart';
import 'package:autowheelapp/main.dart';
import 'package:autowheelapp/models/Addinvoicpurchaiss.dart';
import 'package:autowheelapp/screen/Jobcard/JobCard.dart';
import 'package:autowheelapp/screen/master/PartmasterScreen.dart';
import 'package:autowheelapp/screen/master/Searvicemaster.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/Controllerdeta.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/widget/widget.dart';

List labourList = [];
List labourListdeta = [];

class Addlabourjobcard extends StatefulWidget {
  int? loctionvalue = 0;
  bool jobcardlabour = false;

  Addlabourjobcard({
    Key? key,
    required this.loctionvalue,
    required this.jobcardlabour,
  }) : super(key: key);

  @override
  State<Addlabourjobcard> createState() => _AddlabourjobcardState();
}

class _AddlabourjobcardState extends State<Addlabourjobcard> {
  final InvoiceController invoiceController = Get.find<InvoiceController>();

  // final MainController datacontroller = Get.put(MainController());
  TextEditingController igstcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController amtController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController salePriceController = TextEditingController();
  TextEditingController sgstcontroller = TextEditingController();
  TextEditingController cgstcontroller = TextEditingController();
  TextEditingController netamtConrroller = TextEditingController();
  TextEditingController GrossAmt = TextEditingController();
  TextEditingController workDiscController = TextEditingController();
  TextEditingController MrpController = TextEditingController();
  TextEditingController hsncodeController = TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchFollowupData();
    quantityController.addListener(_updateGrossAmt);
    amtController.addListener(_updateGrossAmt);
    gstController.addListener(_updateNetAmt);
  }

  Map<String, dynamic>? selectedfollowupValue;
  int? followupid;
  final TextEditingController FollowupController = TextEditingController();
  final TextEditingController FollowupController1 = TextEditingController();
  List<Map<String, dynamic>> hsnModels = [
    {'id': 0, 'name': 'Follow type*'}
  ];
  String singleoutlate1 = "Single Outlet";
  List<Widget> containers = [];
  List addedItemList = [];
  List addedItemListLabour = [];
  double _NetAmountDouble = 0.0;
  double _grossAmountDouble = 0.0;
  double igstvalue = 0.0;
  bool _switchValue = false;
  static const double DEFAULT_VALUE = 0.0;

  void addLabor(List<double> laborPrices, double gst) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: AppColor.kBlack,
        ),
        actions: [
          Text("inclusive Tex"),
          SizedBox(
            height: 15,
            child: CupertinoSwitch(
              value: _switchValue,
              activeColor: AppColor.kBlue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                  _updateNetAmt();
                });
              },
            ),
          )
        ],
        toolbarHeight: 32,
        centerTitle: true,
        title: Text("Add labour "),
        backgroundColor: AppColor.kappabrcolr,
      ),
      body: hsnModels.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                                    'Select part',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.kBlack,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  items: hsnModels
                                      .map((item) => DropdownMenuItem(
                                            value: item,
                                            child: Row(
                                              children: [
                                                Text(
                                                  "${item['item_Id'].toString()}-${item['item_Name'].toString()}",
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedfollowupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedfollowupValue = value;
                                      workDiscController.text =
                                          selectedfollowupValue!['item_Des'];
                                      igstcontroller.text =
                                          selectedfollowupValue!['igst']
                                              .toString();
                                      cgstcontroller.text =
                                          selectedfollowupValue!['cgst']
                                              .toString();
                                      sgstcontroller.text =
                                          selectedfollowupValue!['sgst']
                                              .toString();
                                      gstController.text =
                                          selectedfollowupValue!['gst']
                                              .toString();
                                      quantityController.text =
                                          selectedfollowupValue!['order_Qty']
                                              .toString();
                                      amtController.text =
                                          selectedfollowupValue!['ndp']
                                              .toString();
                                      MrpController.text =
                                          selectedfollowupValue!['mrp']
                                              .toString();
                                      hsncodeController.text =
                                          selectedfollowupValue!['hsn_Code']
                                              .toString();
                                      _NetAmountDouble =
                                          double.parse(netamtConrroller.text);
                                      igstvalue =
                                          double.parse(igstcontroller.text);
                                      _grossAmountDouble =
                                          double.parse(GrossAmt.text);
                                    });
                                  },
                                  buttonStyleData: const ButtonStyleData(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
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
                                    searchController: FollowupController,
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
                                        controller: FollowupController,
                                        onChanged: (value) {
                                          setState(() {
                                            hsnModels
                                                .where((item) =>
                                                    item['item_Name']
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
                                          hintText: 'Search for a part...',
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
                                      FollowupController.clear();
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
                              onTap: () async {
                                SearvicemasterScreen();
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
                      textformfiles(
                        workDiscController,
                        labelText: "Work Disc.",
                      ),
                      addVerticalSpace(10),
                      Row(
                        children: [
                          Expanded(
                            child: textformfiles(
                              keyboardType: TextInputType.number,
                              quantityController,
                              labelText: "Quantity",
                            ),
                          ),
                          addhorizontalSpace(5),
                          Expanded(
                            child: textformfiles(
                              onChanged: (e) {
                                setState(() {});
                                _NetAmountDouble = double.parse(
                                    netamtConrroller.text.toString());
                                _grossAmountDouble =
                                    double.parse(GrossAmt.text.toString());
                                igstvalue = double.parse(
                                    igstcontroller.text.toString());
                              },
                              amtController,
                              labelText: 'Amount',
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      addVerticalSpace(10),
                      Row(
                        children: [
                          Expanded(
                            child: textformfiles(
                              keyboardType: TextInputType.number,
                              gstController,
                              labelText: "Gst",
                            ),
                          ),
                          addhorizontalSpace(5),
                          Expanded(
                            child: textformfiles(
                              igstcontroller,
                              labelText: 'Igst',
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      addVerticalSpace(10),
                      Row(
                        children: [
                          Expanded(
                            child: textformfiles(
                              keyboardType: TextInputType.number,
                              sgstcontroller,
                              labelText: "Sgst",
                            ),
                          ),
                          addhorizontalSpace(5),
                          Expanded(
                            child: textformfiles(
                              cgstcontroller,
                              labelText: 'Cgst',
                            ),
                          ),
                        ],
                      ),
                      addVerticalSpace(10),
                      Row(
                        children: [
                          Expanded(
                            child: textformfiles(
                              keyboardType: TextInputType.number,
                              GrossAmt,
                              labelText: "grossAmt",
                            ),
                          ),
                          addhorizontalSpace(5),
                          Expanded(
                            child: textformfiles(
                              netamtConrroller,
                              labelText: 'Netamt',
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      addVerticalSpace(10),
                      InkWell(
                        onTap: () {
                          addButtonPressed();
                        },
                        child: Button("Details"),
                      ),
                      addVerticalSpace(10),
                      InkWell(
                        onTap: () {
                          // Get.back();
                          labourListdeta.add({
                            "Location_Id": widget.loctionvalue,
                            "Prefix_Name": "online",
                            "Job_No": 117,
                            "Item": "Item",
                            "Item_Name": workDiscController.text.toString(),
                            "Hsn_Code": hsncodeController.text.toString() ?? "",
                            "Qty": quantityController.text.toString() ?? "",
                            "Mrp": MrpController.text.toString() ?? "",
                            "Sale_Price": "100",
                            "Total_Price": "200",
                            "Gst": gstController.text.toString() ?? "",
                            "Gst_Amount": igstcontroller.text.toString(),
                            "Cess": 0,
                            "Cess_Amount": 0,
                            "Taxable": netamtConrroller.text.toString(),
                            "Labour": "0",
                            "Discount_Item": "0",
                            "Type": "2",
                            "TranDate": "2024/01/27",
                            "Form_Type": "4",
                            "Warranty_TypeId": 12,
                            "Mechnic_Id": 10,
                            "Issue_Date": "2024/01/27",
                            "ItemId": 0,
                            "Hsn_Id": 0,
                            "JobCard_No": 0,
                            "Prefix_Name_Job": "",
                            "IgstAmount": 18,
                            "CgstAmount": 9,
                            "SgstAmount": 9
                          });

                          widget.jobcardlabour
                              ? datacontroller.updateTransactionData(
                                  TransactionData(
                                      igst: double.parse(igstcontroller.text),
                                      net: double.parse(netamtConrroller.text),
                                      gross: double.parse(GrossAmt.text)))
                              : invoiceController.addLabor(
                                  double.parse(netamtConrroller.text),
                                  double.parse(igstcontroller.text));
                          Get.back();
                          // double.parse(netamtConrroller.text),
                          // double.parse(igstcontroller.text));
                        },
                        child: Button("Save"),
                      ),
                      addVerticalSpace(10),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: addedItemList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var item = addedItemList[index];
                          return InkWell(
                            onDoubleTap: () {},
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              margin: EdgeInsets.all(4),
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(blurRadius: 2, color: Colors.grey),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Work Disc:  ${item["workDisc"]}"),
                                      addhorizontalSpace(22),
                                      Text('Gross Amt ${item["netamt"]}'),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Quantity:  ${item["quantity"]}"),
                                      addhorizontalSpace(30),
                                      Text("Gst:  ${item["gst"]}"),
                                      Text(
                                        'Total Net Amt: ${item['netamtValue']}',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      Text(
                        "Net amount : ${total()}",
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Future<void> fetchFollowupData() async {
    try {
      final response = await http.get(Uri.parse(
          'http://lms.muepetro.com/api/UserController1/GetItem?ItemGroupId=9'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        List<Map<String, dynamic>> apiData =
            List<Map<String, dynamic>>.from(jsonData);
        setState(() {
          hsnModels = apiData;
        });
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void _updateGrossAmt() {
    try {
      double quantity = double.parse(quantityController.text);
      double amt = double.parse(amtController.text);
      double grossAmt = quantity * amt;
      GrossAmt.text = grossAmt.toStringAsFixed(2);
      _updateNetAmt();
    } catch (e) {
      print('Error calculating gross amount: $e');
    }
  }

  void _updateNetAmt() {
    try {
      double mrp = double.parse(GrossAmt.text);
      double gstPercentage = double.parse(gstController.text);

      double gstAmountIncludedInMrp, grossAmtExcludingGst, netAmtExcludingGst;
      double cgstAmount, sgstAmount, igstAmount;

      if (_switchValue) {
        gstAmountIncludedInMrp = (gstPercentage / (100 + gstPercentage)) * mrp;
        grossAmtExcludingGst = mrp - gstAmountIncludedInMrp;
        cgstAmount = gstAmountIncludedInMrp / 2;
        sgstAmount = gstAmountIncludedInMrp / 2;
        netAmtExcludingGst = grossAmtExcludingGst;
        igstAmount = mrp - grossAmtExcludingGst;
      } else {
        grossAmtExcludingGst = mrp;
        gstAmountIncludedInMrp = (gstPercentage * mrp) / 100;
        cgstAmount = gstAmountIncludedInMrp / 2;
        sgstAmount = gstAmountIncludedInMrp / 2;
        netAmtExcludingGst = mrp + gstAmountIncludedInMrp;
        igstAmount = gstAmountIncludedInMrp;
      }

      netamtConrroller.text = netAmtExcludingGst.toStringAsFixed(2);
      cgstcontroller.text = cgstAmount.toStringAsFixed(2);
      sgstcontroller.text = sgstAmount.toStringAsFixed(2);
      igstcontroller.text = igstAmount.toStringAsFixed(2);
      setState(() {});
    } catch (e) {
      print('Error calculating net amount: $e');
    }
  }

  void addButtonPressed() {
    String gross = GrossAmt.text.toString();
    addedItemList.add({
      "workDisc": workDiscController.text,
      "quantity": quantityController.text,
      "gst": gstController.text,
      "Igst": igstcontroller.text,
      "gross": GrossAmt.text.toString(),
      "netamt": double.parse(gross),
      "netamtValue": netamtConrroller.text
    });
    invoiceController.addlabourlist.add({
      "workDisc": workDiscController.text,
      "quantity": quantityController.text,
      "gst": gstController.text,
      "Igst": igstcontroller.text,
      "gross": GrossAmt.text.toString(),
      "netamt": double.parse(gross),
      "netamtValue": netamtConrroller.text,
    });
    labourList.add({
      "Location_Id": widget.loctionvalue,
      "Prefix_Name": "online",
      "Job_No": 117,
      "Item": "Item",
      "Item_Name": "Item_Name",
      "Hsn_Code": hsncodeController.text.toString() ?? "",
      "Qty": quantityController.text.toString() ?? "",
      "Mrp": MrpController.text.toString() ?? "",
      "Sale_Price": "100",
      "Total_Price": "200",
      "Gst": gstController.text.toString() ?? "",
      "Gst_Amount": igstcontroller.text.toString(),
      "Cess": 0,
      "Cess_Amount": 0,
      "Taxable": netamtConrroller.text.toString(),
      "Labour": "0",
      "Discount_Item": "0",
      "Type": "2",
      "TranDate": "2024/01/27",
      "Form_Type": "4",
      "Warranty_TypeId": 12,
      "Mechnic_Id": 10,
      "Issue_Date": "2024/01/27",
      "ItemId": 0,
      "Hsn_Id": 0,
      "JobCard_No": 0,
      "Prefix_Name_Job": "",
      "IgstAmount": 18,
      "CgstAmount": 9,
      "SgstAmount": 9
    });

    debugPrint(
        "Hello total saving list saved  ${invoiceController.addlabourlist.toString()}");
    invoiceController.addlabourlist.refresh();
    invoiceController.clearValues();
    datacontroller.clearvalue();

    setState(() {});
    clearControllers();
  }

  double total() {
    double amount = 0;
    for (var item in addedItemList) {
      var netamtValue = item['netamtValue'];
      if (netamtValue != null && netamtValue is String) {
        var parsedValue = double.tryParse(netamtValue);
        if (parsedValue != null) {
          amount += parsedValue;
        }
      }
    }
    return amount;
  }

  void clearControllers() {
    workDiscController.clear();
    quantityController.clear();
    amtController.clear();
    gstController.clear();
    salePriceController.clear();
    gstController.clear();
    netamtConrroller.clear();
    GrossAmt.clear();
    igstcontroller.clear();
    sgstcontroller.clear();
    cgstcontroller.clear();
  }
}
