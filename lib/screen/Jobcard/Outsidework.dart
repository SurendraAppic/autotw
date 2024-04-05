// ignore_for_file: unused_local_variable
import 'package:autowheelapp/labour/AddLabour.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OutsideWorkScreen extends StatefulWidget {
  const OutsideWorkScreen({super.key});

  @override
  State<OutsideWorkScreen> createState() => _OutsideWorkScreenState();
}

TextEditingController datepickar1 = TextEditingController(
  text: DateFormat('dd-MM-yyyy').format(DateTime.now()),
);
TextEditingController jobcardController = TextEditingController();
class _OutsideWorkScreenState extends State<OutsideWorkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("OutSide Work"),
        backgroundColor: AppColor.kappabrcolr,
        leading: BackButton(color: AppColor.kBlack),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
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
                              datepickar1.text =
                                  DateFormat('dd-MM-yyyy').format(selectedDate);
                            }
                          });
                        }),
                  ),
                  addhorizontalSpace(10),
                  Expanded(
                    child: textfild(Osw),
                  )
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                      child: textformfiles(jobcardController,
                          keyboardType: TextInputType.number,
                          labelText: 'Job card no.')),
                  addhorizontalSpace(10),
                  Expanded(child: Button(Find))
                ],
              ),
              addVerticalSpace(10),
              textfild(LedgerName),
              addVerticalSpace(10),
              Row(
                children: [
                  Expanded(
                      child: TextField(
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
                          borderSide: BorderSide(width: 2.0, color: Colors.red),
                        ),
                        labelText: "Location",
                        contentPadding: EdgeInsets.all(5),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.keyboard_arrow_down_outlined)),
                  )),
                  addhorizontalSpace(10),
                  Expanded(
                    child: textfild(VehicalNo),
                  )
                ],
              ),
              addVerticalSpace(10),
              InkWell(
                  onTap: () {
                    Get.to(Addlabourjobcard(loctionvalue: 2, jobcardlabour: true,));
                  },
                  child: Button(AddItem)),
              addVerticalSpace(10),
              Rowdata(ToTalLabour, "0000"),
              addVerticalSpace(10),
              Rowdata(Discount, "0000"),
              addVerticalSpace(10),
              Rowdata(Other, "0000"),
              addVerticalSpace(10),
              Rowdata(Totalaccesable, "0000"),
              addVerticalSpace(10),
              Rowdata("Gst", "0000"),
              addVerticalSpace(10),
              Rowdata("ToTal amount", "0000"),
              addVerticalSpace(10),
              Button(Save)
            ],
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
            color: AppColor.kWhite,
            borderRadius: BorderRadius.circular(5),
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
