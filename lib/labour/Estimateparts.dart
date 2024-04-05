// ignore_for_file: body_might_complete_normally_nullable, unused_local_variable

import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';

class EstmatepartsScreen extends StatefulWidget {
  const EstmatepartsScreen({Key? key});

  @override
  State<EstmatepartsScreen> createState() => _EstmatepartsScreenState();
}

final key = GlobalKey<FormState>();
var h, w;
String customer = "Work No.";
List<String> drop = [
  'Work No.',
  'black',
  'red',
  'green',
  "ambar",
  "gray",
  "yellow"
];

class _EstmatepartsScreenState extends State<EstmatepartsScreen> {
  TextEditingController workDiscController = TextEditingController();
  TextEditingController hsnCodeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController amtController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController salePriceController = TextEditingController();

  List<Widget> containers = [];

  @override
  void dispose() {
    workDiscController.dispose();
    quantityController.dispose();
    amtController.dispose();
    salePriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          leading: BackButton(color: AppColor.kBlack),
          toolbarHeight: 30,
          centerTitle: true,
          title: Text("Add parts"),
          backgroundColor: AppColor.kappabrcolr),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                addVerticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButton(
                          underline: Container(),
                          value: customer,
                          dropdownColor:
                              const Color.fromARGB(255, 211, 247, 212),
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: h * 0.030,
                            color: Colors.black,
                          ),
                          isExpanded: true,
                          items: drop.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              customer = value.toString();
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
                          // Get.to(AddCustomerflotScreen());
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
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                addVerticalSpace(10),
                textfild("Work Disc.", workDiscController),
                addVerticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: textfild("Hsn Code", hsnCodeController),
                    ),
                    addhorizontalSpace(10),
                    Expanded(
                      child: textfild("Quantity", quantityController),
                    ),
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: textfild("Amt", amtController),
                    ),
                    addhorizontalSpace(10),
                    Expanded(
                      child: textfild("Gst", gstController),
                    ),
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: textfild("Sale price", salePriceController),
                    ),
                    addhorizontalSpace(10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            addButtonPressed();
                          }
                        },
                        child: Text('Save'),
                      ),
                    ),
                  ],
                ),
                addVerticalSpace(10),
                ...containers,
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField textfild(String labelText, TextEditingController controller) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter is value add";
        }
      },
      controller: controller,
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

  void addButtonPressed() {
    String workDisc = workDiscController.text;
    String quantity = quantityController.text;
    String gst = gstController.text;
    String salePrice = salePriceController.text;

    setState(() {
      containers.add(
        Container(
          height: 100,
          width: double.infinity,
          margin: EdgeInsets.all(1),
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(blurRadius: 2, color: Colors.grey),
            ],
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Work no: $customer",
                ),
                Text("Work Disc:   $workDisc"),
                Text("Quantity:  $quantity"),
                Text("Gst:  $gst"),
                // Text("Sale price: $salePrice"),
              ],
            ),
          ),
        ),
      );

      workDiscController.clear();
      hsnCodeController.clear();
      quantityController.clear();
      amtController.clear();
      gstController.clear();
      salePriceController.clear();
    });
  }
}
