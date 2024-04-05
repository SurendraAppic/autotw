// ignore_for_file: unused_import, body_might_complete_normally_nullable

import 'package:autowheelapp/screen/Jobcard/Modeldata.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';

import 'package:flutter/material.dart';

class ModelNameScreen extends StatefulWidget {
  const ModelNameScreen({super.key});

  @override
  State<ModelNameScreen> createState() => _ModelNameScreenState();
}

class _ModelNameScreenState extends State<ModelNameScreen> {
  var cetegorycon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Addmodel()));
        },
        child: Container(
          height: 45,
          width: 100,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 136, 180, 216),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.add,
                size: 20,
              ),
              textcostam("Add Model ", 10, AppColor.kBlack)
            ],
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 36,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColor.kBlack),
        backgroundColor: AppColor.kappabrcolr,
        elevation: 0,
        title: textcostam("Select Model Name", 18, AppColor.kBlack),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              textformfiles(cetegorycon,
                  validator: (p0) {},
                  label: textcostam("Type here", 15, AppColor.kGray),
                  prefixIcon: Icon(Icons.search)),
            ],
          ),
        ),
      ),
    );
  }
}
