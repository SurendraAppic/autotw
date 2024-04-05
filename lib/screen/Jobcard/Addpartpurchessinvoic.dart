// ignore_for_file: unused_import, must_be_immutable, unused_local_variable, unnecessary_import, body_might_complete_normally_nullable

import 'package:autowheelapp/account/InvoiceScreen.dart';
import 'package:autowheelapp/screen/Intro/HomePage.dart';
import 'package:autowheelapp/screen/master/PurchaseInvoice.dart';
import 'package:autowheelapp/utils/widget/Controllerdeta.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List apiList = [];
// List labourListdeta = [];

class addpartsScreen extends StatefulWidget {
  int setclass = 0;
  int? loctionvalue = 0;
  int? invocnumbar = 0;
  String? traindate = '';
  addpartsScreen(
      {Key? key,
      required this.setclass,
      this.loctionvalue,
      this.invocnumbar,
      this.traindate})
      : super(key: key);
  @override
  State<addpartsScreen> createState() => _addpartsScreenState();
}

class _addpartsScreenState extends State<addpartsScreen> {
  final InvoiceController invoiceController = Get.find<InvoiceController>();
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
  TextEditingController mrp = TextEditingController();
  TextEditingController hsncodeController = TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchFollowupData();
    quantityController.addListener(_updateGrossAmt);
    amtController.addListener(_updateGrossAmt);
    gstController.addListener(_updateNetAmt);
  }

  Map<String, dynamic>? selectedValue;
  Map<String, dynamic>? previousValue;
  Map<String, dynamic>? selectedfollowupValue;
  // int? followupid;
  final TextEditingController FollowupController = TextEditingController();
  List<Map<String, dynamic>> hsnModels = [
    {'id': 0, 'name': 'Follow type*'}
  ];
  String singleoutlate1 = "Single Outlet";
  List<Widget> containers = [];
  List addedItemList = [];
  List addedItemListLabour = [];
  double _grossAmountDouble = 0.0;
  double igstvalue = 0.0;
  List sandapidetaList = [];

  @override
  Widget build(BuildContext context) {
    // apiList = addedItemList;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
          
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_sharp,
              color: AppColor.kBlack,
            )),
        toolbarHeight: 30,
        centerTitle: true,
        title: Text("Add Parts "),
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
                                      _grossAmountDouble =
                                          double.parse(netamtConrroller.text);
                                      igstvalue =
                                          double.parse(igstcontroller.text);
                                      mrp.text = selectedfollowupValue!['mrp']
                                          .toString();
                                      print(selectedfollowupValue!['mrp']
                                          .toString());
                                      hsncodeController.text =
                                          selectedfollowupValue!['igst']
                                              .toString();
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
                              onTap: () async {},
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
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return 'Fill in Fild';
                                }
                              },
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
                          double laborPrice = _grossAmountDouble;
                          var gst = igstcontroller.text;
                          invoiceController.addLabor(laborPrice, gst as double);
                        },
                        child: Button("Details"),
                      ),
                      addVerticalSpace(10),
                      InkWell(
                        onTap: () {
                        
                          double partPrice = _grossAmountDouble =
                              double.parse(netamtConrroller.text);
                          double gst1 = double.parse(igstcontroller.text);

                        

                          if (partPrice != null) {
                            apiList.add({
                              "Location_Id": widget.loctionvalue,
                              "Prefix_Name": "online",
                              "Invoice_No": widget.invocnumbar,
                              "Item": "Item",
                              "Item_Name": workDiscController.text.toString(),
                              "Hsn_Code": "5",
                              "Qty": quantityController.text,
                              "Mrp": mrp.text,
                              "Sale_Price": amtController.text.toString(),
                              "Total_Price": netamtConrroller.text.toString(),
                              "Gst": gstController.text.toString(),
                              "Gst_Amount": igstcontroller.text.toString(),
                              "Cess": 0,
                              "Cess_Amount": 0,
                              "Taxable": netamtConrroller.text.toString(),
                              "Labour": "0",
                              "Discount_Item": gstController.text.toString(),
                              "Type": "1",
                              "TranDate": widget.traindate.toString(),
                              "Form_Type": "4",
                              "Warranty_TypeId": 12,
                              "Mechnic_Id": 10,
                              "Issue_Date": "2024/01/27",
                              "ItemId": 0,
                              "Hsn_Id": 0,
                              "JobCard_No": 0,
                              "Prefix_Name_Job": "",
                              "IgstAmount": double.parse(igstcontroller.text),
                              "CgstAmount": double.parse(cgstcontroller.text),
                              "SgstAmount": double.parse(sgstcontroller.text)
                            });
                            // addButtonPressed();
                            invoiceController.addParts(partPrice, gst1);

                            Get.back();
                          } else {
                            // Handle error
                          }
                         
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
                            onLongPress: () {
                              _showEditDeleteDialog(context, item, index);
                            },
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

      double gstAmountIncludedInMrp =
          (gstPercentage / (100 + gstPercentage)) * mrp;

      double grossAmtExcludingGst = mrp - gstAmountIncludedInMrp;

      double cgstAmount = gstAmountIncludedInMrp / 2;
      double sgstAmount = gstAmountIncludedInMrp / 2;

      double netAmtExcludingGst = grossAmtExcludingGst;

      netamtConrroller.text = netAmtExcludingGst.toStringAsFixed(2);

      cgstcontroller.text = cgstAmount.toStringAsFixed(2);
      sgstcontroller.text = sgstAmount.toStringAsFixed(2);

      double igstAmount = mrp - grossAmtExcludingGst;
      igstcontroller.text = igstAmount.toStringAsFixed(2);

      setState(() {});
    } catch (e) {
      print('Error calculating net amount: $e');
    }
  }

  void addButtonPressed() {
    String gross = GrossAmt.text.toString();
    double igstAmount =
        igstcontroller.text != null ? double.parse(igstcontroller.text) : 0.0;
    double cgstAmount =
        cgstcontroller.text != null ? double.parse(cgstcontroller.text) : 0.0;
    double sgstAmount =
        sgstcontroller.text != null ? double.parse(sgstcontroller.text) : 0.0;

    addedItemList.add({
      "workDisc": workDiscController.text,
      "quantity": quantityController.text,
      "gst": gstController.text,
      "Igst": igstcontroller.text,
      "gross": GrossAmt.text,
      "netamt": gross,
      "netamtValue": netamtConrroller.text
    });
    apiList.add({
      "Location_Id": widget.loctionvalue,
      "Prefix_Name": "online",
      "Invoice_No": widget.invocnumbar,
      "Item": "Item",
      "Item_Name": workDiscController.text.toString(),
      "Hsn_Code": hsncodeController.text,
      "Qty": quantityController.text,
      "Mrp": mrp.text,
      "Sale_Price": amtController.text.toString(),
      "Total_Price": netamtConrroller.text.toString(),
      "Gst": gstController.text.toString(),
      "Gst_Amount": igstcontroller.text.toString(),
      "Cess": 0,
      "Cess_Amount": 0,
      "Taxable": netamtConrroller.text.toString(),
      "Labour": "0",
      "Discount_Item": gstController.text.toString(),
      "Type": "1",
      "TranDate": widget.traindate.toString(),
      "Form_Type": "4",
      "Warranty_TypeId": 12,
      "Mechnic_Id": 10,
      "Issue_Date": "2024/01/27",
      "ItemId": 0,
      "Hsn_Id": 0,
      "JobCard_No": 0,
      "Prefix_Name_Job": "",
      "IgstAmount": double.parse(igstcontroller.text),
      "CgstAmount": double.parse(cgstcontroller.text),
      "SgstAmount": double.parse(sgstcontroller.text)
    });

    // invoiceController.addpartlist.add({
    //   "Igst": igstcontroller.text,
    //   "gross": GrossAmt.text.toString(),
    //   "netamt": double.parse(gross),
    //   "netamtValue": netamtConrroller.text,
    // });
    invoiceController.purchessinvoic.add({
      "Igst": igstcontroller.text,
      "gross": GrossAmt.text.toString(),
      "netamt": double.parse(gross),
      "netamtValue": netamtConrroller.text,
    });
    debugPrint(
        "Hello total value list  ${invoiceController.addpartlist.toString()}");
    invoiceController.purchessinvoic.refresh();
    invoiceController.addpartlist.refresh();
    setState(() {});
    clearControllers();
  }

  double total() {
    double amount = 0;
    for (var i = 0; i < addedItemList.length; i++) {
      amount += double.parse(addedItemList[i]['netamtValue'].toString());
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
    // FollowupController.clear();
    selectedfollowupValue = null;
  }

  void _showEditDeleteDialog(
      BuildContext context, Map<String, dynamic> item, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;

        double dialogWidth = screenWidth * 0.9;
        double dialogHeight = screenHeight * 0.3;

        return FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: 0.3,
          child: AlertDialog(
            contentPadding: EdgeInsets.all(0), // Remove default padding
            title: Text("Edit or Delete Item"),
            content: Container(
              width: dialogWidth,
              height: dialogHeight,
              child: Column(
                children: [
                  // Add your editing fields here if needed
                  // For example, TextFields, Dropdowns, etc.

                  SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Perform edit logic
                          // You may want to update the item in your addedItemList
                          // and then call Navigator.pop(context) to close the dialog
                        },
                        child: Text("Edit"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: Text("Delete"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
