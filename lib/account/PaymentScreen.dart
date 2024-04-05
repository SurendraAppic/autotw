import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

TextEditingController datepickar = TextEditingController();
var h, w;
String so = "Payment Mode";
List co = ['Payment Mode', 'Case Book', 'Sbi Bank'];
String so1 = "Customer Account";
List co2 = ['Customer Account', 'Case Book', 'Sbi Bank'];
// String cr = "Customer A/c";
// List dr = ['Customer A/c', 'Case Book', 'Sbi Bank'];
var isshow1 = false;

class _PaymentScreenState extends State<PaymentScreen> {
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
        title: Text('Payment'),
        toolbarHeight: 35,
        leading: BackButton(color: AppColor.kBlack),
        backgroundColor: AppColor.kappabrcolr,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        // textAlignVertical: TextAlignVertical.bottom,
                        controller: datepickar,
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
                            contentPadding: EdgeInsets.all(5),
                            // filled: true,
                            // fillColor: Colors.white,
                            hintText: "Date",
                            // suffixIcon: Image.asset("assets/calender.png"),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        onTap: () async {
                          // ignore: unused_local_variable
                          DateTime date = DateTime(1900);
                          FocusScope.of(context).requestFocus(FocusNode());
                          await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now())
                              .then((selectedDate) {
                            if (selectedDate != null) {
                              datepickar.text =
                                  DateFormat('dd-MM-yyyy').format(selectedDate);
                            }
                          });
                        }),
                  ),
                  addhorizontalSpace(10),
                  Expanded(child: textfild("Pv no")),
                ],
              ),
              addVerticalSpace(10),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      // margin: const EdgeInsets.only(right: 10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
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
                      child: Text(
                    "Totla Amt",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                  // addhorizontalSpace(10),
                  Expanded(child: textfild("00.0")),
                  addhorizontalSpace(10),
                  SizedBox(width: 50, child: textfild("0.1.0")),
                ],
              ),

              addVerticalSpace(10),
              Row(
                children: [
                  // addhorizontalSpace(50),
                  Expanded(
                      child: Text(
                    "Paid Amt",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                  // addhorizontalSpace(10),
                  SizedBox(width: 202, child: textfild("1.0")),
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Balance Amt",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                  // addhorizontalSpace(10),
                  Expanded(child: textfild("00.0")),
                  addhorizontalSpace(10),
                  SizedBox(width: 50, child: textfild("0.1.0")),
                ],
              ),

              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      // margin: const EdgeInsets.only(right: 10),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton(
                        underline: Container(),
                        value: so1,
                        dropdownColor: const Color.fromARGB(255, 211, 247, 212),
                        icon: Icon(Icons.keyboard_arrow_down_outlined,
                            size: h * 0.030, color: AppColor.kBlack),
                        isExpanded: true,
                        items: co2.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            so1 = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  addhorizontalSpace(10),
                  // addVerticalSpace(10),
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
              textfild("Transoction No"),
              // addVerticalSpace(10),
              Row(
                children: [
                  SizedBox(
                    width: 25,
                    child: Checkbox(
                        value: isshow1,
                        onChanged: (e) {
                          setState(() {
                            isshow1 = !isshow1;
                          });
                        }),
                  ),
                  Text(
                    "  Print After save",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              addVerticalSpace(10),
              InkWell(
                onTap: () {
                  // if (_formKey.currentState!.validate()) {}
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.kbuttonclr),
                  child: Center(child: textcostam("Save", 16, AppColor.kWhite)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField textfild(String? labelText) {
    return TextFormField(
      keyboardType: TextInputType.number,
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
}
