// ignore_for_file: body_might_complete_normally_nullable, unnecessary_import
import 'dart:convert';
import 'package:autowheelapp/screen/master/PartmasterScreen.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

class HsnCategary extends StatefulWidget {
  const HsnCategary({super.key});
  @override
  State<HsnCategary> createState() => _HsnCategaryState();
}

class _HsnCategaryState extends State<HsnCategary> {
  var IgstController = TextEditingController();
  var Sgstcontroller = TextEditingController();
  var HsnCodeController = TextEditingController();
  var h, w;
  bool isSearchMode = false;
  @override
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back(result: true);
                // Navigator.pop(context ,"refeash");
              },
              icon: Icon(Icons.arrow_back)),
          centerTitle: true,
          toolbarHeight: 36,
          iconTheme: IconThemeData(color: AppColor.kBlack),
          elevation: 2,
          backgroundColor: AppColor.kappabrcolr,
          title: Text(
            'Hsn Code',
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              textformfiles(HsnCodeController,
                  keyboardType: TextInputType.number,
                  validator: (p0) {},
                  label: textcostam("Hsn Code", 15, AppColor.kBlack),
                  prefixIcon: Icon(
                    Icons.code,
                    color: AppColor.kGray,
                  )),
             addVerticalSpace(18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: w * 0.3,
                    child: textformfiles(IgstController, validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter your entry fees";
                      }
                    }, onChanged: (value) {
                      if (IgstController.text.isNotEmpty) {
                        String poolPrice = (int.parse(IgstController.text) / 2)
                            .toStringAsFixed(2);
                        Sgstcontroller.text = poolPrice;
                        setState(() {});
                      } else {
                        Sgstcontroller.clear();
                        setState(() {});
                      }
                      setState(() {});
                    },
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        label: textcostam("IGST", 14, AppColor.kBlack)),
                  ),
                  addhorizontalSpace(5),
                  SizedBox(
                    width: w * 0.3,
                    child: textformfiles(
                        readOnly: true,
                        Sgstcontroller,
                        validator: (p0) {},
                        label: textcostam("CGST", 14, AppColor.kBlack)),
                  ),
                  addhorizontalSpace(5),
                  SizedBox(
                    width: w * 0.3,
                    child: textformfiles(
                        readOnly: true,
                        Sgstcontroller,
                        validator: (p0) {},
                        label: textcostam("SGST", 14, AppColor.kBlack)),
                  ),
                ],
              ),
              addVerticalSpace(30),
              InkWell(
                  onTap: () {
                    posthsncatagry();
                  },
                  child: Button(savetxt)),
              addVerticalSpace(15),
              redButton(delettxt)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> posthsncatagry() async {
    final url =
        Uri.parse('http://lms.muepetro.com/api/UserController1/PostHSNMaster');
    final Map<String, dynamic> body = {
      "Hsn_Code": HsnCodeController.text,
      "Igst": double.tryParse(IgstController.text) ?? 0.0,
      "Cgst": double.tryParse(Sgstcontroller.text) ?? 0.0,
      "Sgst": double.tryParse(Sgstcontroller.text) ?? 0.0,
      "Status": 1,
      "Location_Id": 12
    };
    print(IgstController.text.toString());
    try {
      final response = await http.post(
        url,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );
      var data = jsonDecode(response.body);
      print('API Response: $data');

      if (response.statusCode == 200) {
        if (data['result'] == true) {
          Get.snackbar(
            'Success',
            'API call was successful',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          print('API call successful');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PartsMasters()));
        } else {
          print('API call failed');

          Get.snackbar(
            'Error',
            data['message'] ?? 'Unknown error',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response Data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
