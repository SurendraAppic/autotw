// ignore_for_file: body_might_complete_normally_nullable, unnecessary_import, unused_import

import 'dart:developer';

import 'package:autowheelapp/models/manufacturemodel.dart';
import 'package:autowheelapp/screen/master/Ledgermaster.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Addmodel extends StatefulWidget {
  const Addmodel({super.key});
  @override
  State<Addmodel> createState() => _AddmodelState();
}

String so = "Vihical Group";
List co = [
  'Vihical Group',
  'Car',
  'Bike',
  'Truck',
  "E-Rickshaw",
  "E-Bike",
  "Scooter",
  "Pikup",
  "Haul Machines",
  "Tractor",
  "Other"
];
List<Map<String, dynamic>> manufacturers = [];
int Manufacturerid = 0;
Map<String, dynamic>? selectedManufacturerValue;

class _AddmodelState extends State<Addmodel> {
  late List<Map<String, dynamic>> modelData = [];
  late List<Map<String, dynamic>> filteredData = [];
   TextEditingController modelnamecoroller = TextEditingController();
  TextEditingController filtercontroller = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController SearchController = TextEditingController();
  TextEditingController ManufacturerController = TextEditingController();

  refreshData() async {
    await manufutureurData();
  }

  @override
  void initState() {
    super.initState();
    fetchModelData();
    manufutureurData();
  }

  Future<void> fetchModelData() async {
    log('1');
    final url = Uri.parse(
        'http://lms.muepetro.com/api/UserController1/GetVehicleMasterLocationwise?locationid=1');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData is List) {
          setState(() {
            modelData = jsonData.cast<Map<String, dynamic>>();
            filteredData = modelData;
          });
          log('2');
        } else {
          print('Response is not a List');
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
      log('3');
    }
  }

  void filterData(String query) {
    setState(() {
      filteredData = modelData
          .where((item) =>
              item.containsKey('model_Name') &&
              item['model_Name']
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    });
  }

  var h, w;

  TextEditingController Addmodelcontroller = TextEditingController();
  bool isSearchMode = false;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.search,
            color: AppColor.kBlack,
          )
        ],
        centerTitle: true,
        title: Text("Model Name"),
        toolbarHeight: 36,
        iconTheme: IconThemeData(color: AppColor.kBlack),
        elevation: 2,
        backgroundColor: AppColor.kappabrcolr,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              textformfiles(Addmodelcontroller,
                  labelText: 'Model Name',
                  suffixIcon: IconButton(
                      icon: Icon(Icons.search, color: Colors.black),
                      onPressed: () {
                        fetchModelData();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Builder(
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: textformfiles(SearchController,
                                      labelText: "Model Edit"),
                                  actions: <Widget>[
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          height: 300,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            physics: BouncingScrollPhysics(),
                                            itemCount: filteredData.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                title: Text(filteredData[index]
                                                        ['model_Name'] ??
                                                    'No Name Found'),
                                                onTap: () {
                                                  setState(() {
                                                    SearchController.text =
                                                        filteredData[index][
                                                                'model_Name'] ??
                                                            '';
                                                  });
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        Button("Edit"),
                                        addVerticalSpace(5),
                                        redButton("Deleate")
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      
                      }
                      )
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
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton(
                        underline: Container(),
                        value: so,
                        dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                        icon: Icon(Icons.keyboard_arrow_down_outlined,
                            size: h * 0.030, color: AppColor.kBlack),
                        isExpanded: true,
                        items: co.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
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
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
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
                        Get.to(LedgerScreen())!.then((value) => refreshData());
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
                    postVehicleMaster();
                  },
                  child: Button("Save")),
              addVerticalSpace(15),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> postVehicleMaster() async {
    String apiUrl =
        'http://lms.muepetro.com/api/UserController1/PostVehicleMaster';
    Map<String, dynamic> requestBody = {
      "Model_Code": "Model_Code",
      "Model_Name": Addmodelcontroller.text.toString(),
      "ModelDescription": "ModelDescription",
      "Model_Group": so,
      "Manufacturer": Manufacturerid,
      "Model_GroupId": 1,
      "ManufacturerId": 1,
      "BrandId": 1,
      "WithBattery": "WithBattery",
      "Discontinue": "Discontinue",
      "TradeCertNo": "TradeCertNo",
      "FuelCapacity": "FuelCapacity",
      "PurchasePrice": "PurchasePrice",
      "ExShowRoomPrice": "ExShowRoomPrice",
      "HsnCodeId": 1,
      "HsnCode": "HsnCode",
      "Igst": "Igst",
      "Cgst": "Cgst",
      "Sgst": "Sgst",
      "Cess": "Cess",
      "RegdAmount": "RegdAmount",
      "InsuranceAmount": "InsuranceAmount",
      "HpaAmount": "HpaAmount",
      "AgreementAmount": "AgreementAmount",
      "AcessAmount": "AcessAmount",
      "OtherAmount": "OtherAmount",
      "Discount": "Discount",
      "VehicleDes1": "VehicleDes1",
      "VehicleDes2": "VehicleDes2",
      "VehicleDes3": "VehicleDes3",
      "VehicleDes4": "VehicleDes4",
      "VehicleDes5": "VehicleDes5",
      "SubcidyAplicableStatus": 1,
      "SubcidyInvoiceManualPriceStatus": 1,
      "Location_Id": 1
    };

    String requestBodyJson = jsonEncode(requestBody);

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: requestBodyJson,
      );
      if (response.statusCode == 200) {
        print('Post request successful');
        Get.snackbar("Data successful ", "'Post request successful",
            backgroundColor: AppColor.kGreen);
        Navigator.pop(context);
      } else {
        print('Post request failed with status code ${response.statusCode}');
        Get.snackbar("Data Error ",
            "Post request failed with status code ${response.statusCode}",
            backgroundColor: AppColor.kGreen);
      }
    } catch (e) {
      print('Error sending POST request: $e');
    }
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
}
