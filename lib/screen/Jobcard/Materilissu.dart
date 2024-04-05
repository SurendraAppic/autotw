// ignore_for_file: unused_import, unused_local_variable
import 'package:autowheelapp/screen/Jobcard/Addpartpurchessinvoic.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:autowheelapp/utils/image/image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class MaterialissuScreen extends StatefulWidget {
  const MaterialissuScreen({super.key});

  @override
  State<MaterialissuScreen> createState() => _MaterialissuScreenState();
}

class _MaterialissuScreenState extends State<MaterialissuScreen> {
  // TextEditingController datepickar1 = TextEditingController();
  TextEditingController datepickar1 = TextEditingController(
      text: DateFormat('yyyy-dd-MM').format(DateTime.now()));
  TextEditingController vicalcontiner = TextEditingController();
  TextEditingController chassisnocontroller = TextEditingController();
  TextEditingController EnginController = TextEditingController();
  TextEditingController Jobcardcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: AppColor.kBlack,
            ),
          )
        ],
        centerTitle: true,
        leading: BackButton(color: AppColor.kBlack),
        backgroundColor: AppColor.kappabrcolr,
        title: Text("Materisl issue"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        controller: datepickar1,
                        decoration: InputDecoration(
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
                            labelText: datetxt,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        onTap: () async {
                          DateTime date = DateTime(1900);
                          FocusScope.of(context).requestFocus(FocusNode());
                          await await showDatePicker(
                            context: context,
                            initialDate: DateTime
                                .now(), // Set the initial date to the current date
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          ).then((selectedDate) {
                            if (selectedDate != null) {
                              datepickar1.text =
                                  DateFormat('dd-MM-yyyy').format(selectedDate);
                            }
                          });
                        }),
                  ),
                  // addVerticalSpace(10),
                  addhorizontalSpace(10),
                  Expanded(child: textfild("Mi No.")),
                  addVerticalSpace(10),
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: textformfiles(Jobcardcontroler,
                        keyboardType: TextInputType.number,
                        labelText: "Job card No.",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            'assets/jobcardnumbar.png',
                            height: 18,
                          ),
                        )),
                  ),
                  addhorizontalSpace(10),
                  Expanded(child: Button("Find"))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  addVerticalSpace(20),
                  Text(
                    "Job Card Details",
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
              addVerticalSpace(10),
              textformfiles(vicalcontiner,
                  labelText: VehicalNotxt,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      imgcar,
                      height: 18,
                    ),
                  )),
              addVerticalSpace(10),
              textformfiles(chassisnocontroller,
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
              InkWell(
                  onTap: () {
                    Get.to(addpartsScreen(
                      setclass: 0,
                    ));
                  },
                  child: Button("Issue part ")),
              addVerticalSpace(10),
              Button("Save")
            ],
          ),
        ),
      ),
    );
  }

  Future<void> postData() async {
    final String apiUrl = 'http://lms.muepetro.com/api/UserController1/PostMI';

    // Replace this with your actual JSON data
    Map<String, dynamic> data = {
      "Location_Id": 2,
      "Prefix_Name": "online",
      "Job_No": 10,
      "Job_Date": datepickar1.text.toString(),
      "Vehicle_No": vicalcontiner.text.toString(),
      "Chassis_No": chassisnocontroller.text.toString(),
      "Engine_No": EnginController.text.toString(),
      "Model_Id": 1,
      "Colour_Id": 1,
      "Source_Id": 1,
      "Service_type_id": 1,
      "Coupon_No": "Coupon_No",
      "Service_No": "Service_No",
      "Kms": "Kms",
      "Fuel": "Fuel",
      "Vehicle_Sold": "2024/01/27",
      "Mechanic_Id": 1,
      "Work_Mgr_Id": 1,
      "Ledger_Id": 1,
      "Customer_Name": "Customer_Name",
      "Job_In": "2024/01/27",
      "Job_InTime": "2024/01/27",
      "Job_Out": "2024/01/27",
      "Job_OutTime": "2024/01/27",
      "Customer_Voice": "Customer_Voice",
      "Job_Status": "Job_Status",
      "Next_ServiceInDays": "Next_ServiceInDays",
      "Next_ServiceOnDate": "2024/01/27",
      "Insurance_Renewal": "2024/01/27",
      "Remarks": "Remarks",
      "Extra1": "Extra1",
      "Extra2": "Extra2",
      "Extra3": "Extra3",
      "Extra4": "Extra4",
      "JobCard_Items": [
        {
          "Location_Id": 2,
          "Prefix_Name": "online",
          "Job_No": 10,
          "Item": "Item",
          "Item_Name": "aman",
          "Hsn_Code": "Hsn_Code",
          "Qty": "2",
          "Mrp": "100",
          "Sale_Price": "100",
          "Total_Price": "200",
          "Gst": "18",
          "Gst_Amount": "15.84",
          "Cess": 0,
          "Cess_Amount": 0,
          "Taxable": "84.15",
          "Labour": "0",
          "Discount_Item": "0",
          "Type": "1",
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
        }
      ]
    };

    // Convert the data to JSON format
    String requestBody = json.encode(data);

    try {
      // Make the POST request
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: requestBody,
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        print('Data posted successfully');
        print(response.body);
      } else {
        print('Failed to post data. Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }
}
