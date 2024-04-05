import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VichalScreen extends StatefulWidget {
  const VichalScreen({super.key});

  @override
  State<VichalScreen> createState() => _VichalScreenState();
}

TextEditingController DescriptionController = TextEditingController();
TextEditingController TradeController = TextEditingController();
TextEditingController FuelController = TextEditingController();
TextEditingController ExShowroomcontroler = TextEditingController();
TextEditingController Modelcontroleer = TextEditingController();
TextEditingController PurchaseController = TextEditingController();
var entrycontroller = TextEditingController();
var Pricepoolcontroller = TextEditingController();
var saccontroller = TextEditingController();
String customer = "Select Group";
List drop = ['Select Group', 'Part'];
String Hsn = "Hsn";
List code = ['Hsn', 'Part'];
String Manufature = "Select ManuFacturer";
List manu = ['Select ManuFacturer', 'Part'];
String Withbatttry = "With Battery";
List battry = ['With Battery', 'Yes', 'No'];
String Discountinue = "Discountinue";
List Dis = ['Discountinue', 'Yes', 'No'];
// ignore: unused_element
TextEditingController _dateController1 = TextEditingController(
  text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
);
var h, w;

class _VichalScreenState extends State<VichalScreen> {
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 36,
        leading: BackButton(color: AppColor.kBlack),
        centerTitle: true,
        elevation: 2,
        // leadingWidth: 20,
        backgroundColor: AppColor.kappabrcolr,

        title: Text(
          "Vehicle Masters",
          style: TextStyle(color: AppColor.kBlack),
        ),
        // SizedBox(width: 13),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              textformfiles(
                Modelcontroleer,
                labelText: "Model",
              ),
              addVerticalSpace(10),
              textformfiles(
                DescriptionController,
                labelText: "Description",
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
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton(
                        underline: Container(),
                        value: customer,
                        dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                        icon: Icon(Icons.keyboard_arrow_down_outlined,
                            size: h * 0.030, color: AppColor.kBlack),
                        isExpanded: true,
                        items: drop.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                        // Get.to(Group1Screen());
                        // Get.to(() => Group1Screen());
                        // ?.then((value) => value ? GroupData : null);
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
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton(
                        underline: Container(),
                        value: Manufature,
                        dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                        icon: Icon(Icons.keyboard_arrow_down_outlined,
                            size: h * 0.030, color: AppColor.kBlack),
                        isExpanded: true,
                        items: manu.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            Manufature = value.toString();
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
                        // Get.to(Group1Screen());
                        // Get.to(() => Group1Screen());
                        // ?.then((value) => value ? GroupData : null);
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
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton(
                        underline: Container(),
                        value: Withbatttry,
                        dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                        icon: Icon(Icons.keyboard_arrow_down_outlined,
                            size: h * 0.030, color: AppColor.kBlack),
                        isExpanded: true,
                        items: battry.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            Withbatttry = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  addhorizontalSpace(10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton(
                        underline: Container(),
                        value: Discountinue,
                        dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                        icon: Icon(Icons.keyboard_arrow_down_outlined,
                            size: h * 0.030, color: AppColor.kBlack),
                        isExpanded: true,
                        items: Dis.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            Discountinue = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(10),
              textformfiles(
                TradeController,
                labelText: "Trade Cert No.",
              ),
              addVerticalSpace(10),
              textformfiles(
                FuelController,
                labelText: "Ltrs.",
              ),
              addVerticalSpace(10),
              textformfiles(
                PurchaseController,
                labelText: "Purchase Price",
              ),
              addVerticalSpace(10),
              textformfiles(
                ExShowroomcontroler,
                labelText: "Ex-Showroom.",
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
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton(
                        underline: Container(),
                        value: Hsn,
                        dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                        icon: Icon(Icons.keyboard_arrow_down_outlined,
                            size: h * 0.030, color: AppColor.kBlack),
                        isExpanded: true,
                        items: code.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            Hsn = value.toString();
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
                        // Get.to(Group1Screen());
                        // Get.to(() => Group1Screen());
                        // ?.then((value) => value ? GroupData : null);
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
                    child: textformfiles(
                      ExShowroomcontroler,
                      labelText: "Hsn",
                    ),
                  ),
                  addhorizontalSpace(5),
                  Expanded(
                    // ignore: body_might_complete_normally_nullable
                    child: textformfiles(entrycontroller, validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter your entry fees";
                      }
                    }, onChanged: (value) {
                      if (entrycontroller.text.isNotEmpty) {
                        String poolPrice = (int.parse(entrycontroller.text) / 2)
                            .toStringAsFixed(2);
                        Pricepoolcontroller.text = poolPrice;
                        setState(() {});
                      } else {
                        Pricepoolcontroller.clear();
                        setState(() {});
                      }
                      setState(() {});
                    },
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        label: textcostam(igsttext, 14, AppColor.kBlack)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: textformfiles(
                        readOnly: true,
                        Pricepoolcontroller,
                        // ignore: body_might_complete_normally_nullable
                        validator: (p0) {},
                        label: textcostam(cgsttxt, 14, AppColor.kBlack)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: textformfiles(
                        readOnly: true,
                        Pricepoolcontroller,
                        // ignore: body_might_complete_normally_nullable
                        validator: (p0) {},
                        label: textcostam(sgstxt, 14, AppColor.kBlack)),
                  ),
                ],
              ),
              addVerticalSpace(10),
              addVerticalSpace(10),
              Button("Save"),
              addVerticalSpace(10),
              redButton("Delete"),
            ],
          ),
        ),
      ),
    );
  }
}
