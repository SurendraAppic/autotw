// ignore_for_file: unused_element, duplicate_import, unused_import, unused_label

import 'package:autowheelapp/labour/Estimateparts.dart';
import 'package:autowheelapp/labour/Estmitatelabour.dart';
import 'package:autowheelapp/screen/Jobcard/Addpartpurchessinvoic.dart';
import 'package:autowheelapp/screen/master/Ledgermaster.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:autowheelapp/utils/image/image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:csc_picker/csc_picker.dart';

class EstimateScreen extends StatefulWidget {
  const EstimateScreen({super.key});

  @override
  State<EstimateScreen> createState() => _EstimateScreenState();
}

class _EstimateScreenState extends State<EstimateScreen> {
  TextEditingController datepickar1 = TextEditingController(
    text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
  );
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";

  int? selectedRadio;
  var isshow = false;
  var chack = false;
  var job = true;
  @override
  void initState() {
    super.initState();

    selectedRadio = 1;
  }

  setSelectedRadio(int? val) {
    setState(() {
      selectedRadio = val;
    });
  }

  TextEditingController vicalController = TextEditingController();
  TextEditingController chassisnoController = TextEditingController();
  TextEditingController EnginController = TextEditingController();
  TextEditingController customerController = TextEditingController();
  TextEditingController jobcardController = TextEditingController();
  TextEditingController DocController = TextEditingController();
  var h, w;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: AppColor.kBlack,
            ),
          )
        ],
        leading: IconButton(
            onPressed: () {
              Get.back(result: true);
              // Get.back(result: true);
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text("Estimate"),
        backgroundColor: AppColor.kappabrcolr,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: textformfiles(DocController,
                          keyboardType: TextInputType.number,
                          labelText: "Doc No.",
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              decoment,
                              height: 15,
                            ),
                          ))),
                  addhorizontalSpace(10),
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      controller:
                          datepickar1, // Use the specific controller here
                      decoration: InputDecoration(
                        labelText: "Date",
                        prefixIcon: Icon(
                          Icons.edit_calendar,
                          color: AppColor.kBlack,
                        ),
                        contentPadding: EdgeInsets.all(5),
                        hintText: datetxt,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.black),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 5.0, color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        ).then((selectedDate) {
                          if (selectedDate != null) {
                            datepickar1.text =
                                DateFormat('dd-MM-yyyy').format(selectedDate);
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
                      child: textformfiles(jobcardController,
                          labelText: "Job Card No.",
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              jobcard,
                              height: 15,
                            ),
                          ))),
                  addhorizontalSpace(10),
                  Expanded(child: Button("Find"))
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          job = true; // Set 'job' to true to select "Counter".
                        });
                      },
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: job ? Color(0xff83c5be) : AppColor.kBlack,
                              width: 2),
                          borderRadius: BorderRadius.circular(25),
                          color: job
                              ? Color(0xff83c5be)
                              : Color(
                                  0x00000000), // Add background color for selected item
                        ),
                        child: Center(
                            child: Text(
                          "Entry",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: job
                                ? Colors.white
                                : AppColor
                                    .kBlack, // Change text color based on selection
                          ),
                        )),
                      ),
                    ),
                  ),
                  addhorizontalSpace(10),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          job = false; // Set 'job' to false to select "Job".
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
                          "Ledger",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: !job
                                ? Colors.white
                                : AppColor
                                    .kBlack, // Change text color based on selection
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  addVerticalSpace(20),
                  Text(
                    "Ledger Name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
              textformfiles(customerController,
                  labelText: "Entry",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      user,
                      height: 15,
                    ),
                  )),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: textformfiles(customerController,
                        labelText: "Custome name",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            user,
                            height: 15,
                          ),
                        )),
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
              textfild("Address"),
              addVerticalSpace(10),
              CSCPicker(
                showStates: true,
                showCities: true,
                dropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: Colors.white,
                    border: Border.all(
                      width: 2,
                      color: Colors.black,
                    )),
                disabledDropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2)),
                countryDropdownLabel: "Select Country *",
                stateDropdownLabel: " Select State *",
                cityDropdownLabel: " Select City *",
                selectedItemStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                dropdownHeadingStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  addVerticalSpace(20),
                  Text(
                    "Vehicle Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
              textformfiles(vicalController,
                  labelText: VehicalNotxt,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      imgcar,
                      height: 18,
                    ),
                  )),

              addVerticalSpace(10),
              textformfiles(chassisnoController,
                  labelText: Chassistxt,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      chessisimg,
                      height: 18,
                    ),
                  )),

              addVerticalSpace(10),
              textformfiles(EnginController,
                  labelText: Engintxt,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      enginimg,
                      height: 18,
                    ),
                  )),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(child: textfild("Model Name")),
                  addhorizontalSpace(10),
                  SizedBox(
                    width: 50,
                    child: InkWell(
                      child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border.all(
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
              addVerticalSpace(10),
              textformfiles(vicalController,
                  labelText: gsttxt,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      gstimg,
                      height: 18,
                    ),
                  )),

              addVerticalSpace(10),

              // textfild("gst No."),
              addVerticalSpace(10),
              InkWell(
                  onTap: () {
                    Get.to(addpartsScreen(setclass: 0,));
                  },
                  child: Button("Add parts")),
              addVerticalSpace(10),
              InkWell(
                  onTap: () {
                    Get.to(EstmitateLabourScreen());
                  },
                  child: Button("Add Labour")),
              addVerticalSpace(10),
              addVerticalSpace(10),
              Rowdata("Total Labour", "0000"),
              addVerticalSpace(10),
              Rowdata("Discount", "0000"),
              addVerticalSpace(10),
              Rowdata("Other", "0000"),
              addVerticalSpace(10),
              Rowdata("Total Taxable", "0000"),
              addVerticalSpace(10),
              Rowdata("Gst", "0000"),
              addVerticalSpace(10),
              Rowdata("Total amt", "0000"),
              addVerticalSpace(10),

              Button("Save"),
              addVerticalSpace(10),
              addVerticalSpace(10),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField textfild(String? labelText) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      // keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      onChanged: (value) {},
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: Colors.red),
        ),
        counterText: "",
        labelText: labelText,
        contentPadding: EdgeInsets.all(5),
        border: OutlineInputBorder(),
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
            border: Border.all(
              color: AppColor.kBlack,
            ),
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
}
