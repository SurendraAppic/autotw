// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:autowheelapp/models/jobcardtotaldeta.dart';
import 'package:autowheelapp/screen/Jobcard/JobColse.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SlidScreen extends StatefulWidget {
  int initialIndex = 0;
  SlidScreen({required this.initialIndex, super.key});

  @override
  _SlidScreenState createState() => _SlidScreenState();
}

class _SlidScreenState extends State<SlidScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // fetchModelData();
    fetchData();
    _tabController = TabController(
        initialIndex: widget.initialIndex, length: 6, vsync: this);
  }

  List<ModeljobcardAlldeta> jobCards = [];

//   Future<void> fetchData() async {
//     print(1);
//     final url =
//         'http://lms.muepetro.com/api/UserController1/GetJobCardALLocationwise?locationid=2';

//     final response = await http.get(Uri.parse(url));
//      print(2);

//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body) as List<dynamic>;
//  print(3);
//       final List<ModeljobcardAlldeta> fetchedCards = jsonData.map((e) {
//         return ModeljobcardAlldeta.fromJson(e);

//       }).toList();
//        print(4);

//       setState(() {
//         jobCards = fetchedCards;
//       });
//        print(5);
//     } else {
//       print('Failed to load data: ${response.statusCode}');
//     }
//   }
  Future<void> fetchData() async {
    print(1);
    final url =
        'http://lms.muepetro.com/api/UserController1/GetJobCardALLocationwise?locationid=2';

    final response = await http.get(Uri.parse(url));
    print(2);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List<dynamic>;
      print(3);

      final List<ModeljobcardAlldeta> fetchedCards = jsonData.map((e) {
        return ModeljobcardAlldeta.fromJson(e);
      }).toList();
      print(4);

      if (mounted) {
        // Check if the widget is mounted
        setState(() {
          jobCards = fetchedCards;
        });
      }
      print(5);
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.search),
          Icon(
            Icons.more_vert,
            color: AppColor.kBlack,
          ),
        ],
        leading: BackButton(color: Colors.black),
        toolbarHeight: 39,
        backgroundColor: Colors.white,
        title: Text('Job Cards'),
        bottom: TabBar(
          controller: _tabController,
          labelPadding: EdgeInsets.all(5.0),
          labelStyle: TextStyle(fontSize: 14.0),
          tabs: [
            Tab(
              text: 'Job Card ',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'in Progess',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'Spare panding',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'Ready ',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'Insurance ',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'Vehicles ',
              icon: Icon(Icons.home),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    // height: 400,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: jobCards.length,
                      itemBuilder: (BuildContext context, int index) {
                        final jobCard = jobCards[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          height: 190,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColor.kBlack),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                height: 30,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 186, 248, 188),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      // "RJ14cu222",
                                      "${jobCard.vehicleNo}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " /Honda LIvo disc ALLoy",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.kBlack),
                                    ),
                                    Icon(
                                      Icons.groups,
                                      color: AppColor.kBlack,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: ListTile(
                                  dense: true,
                                  minVerticalPadding: 0,
                                  title: Text("Aman"),
                                  trailing: Text("E- 0.00"),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: ListTile(
                                    dense: true,
                                    minVerticalPadding: 0,
                                    title: Text("Ubar (Jaipur)"),
                                    trailing: Text(
                                      "${jobCard.jobIn}",
                                    )
                                    //  Text("20-10-2024"),
                                    ),
                              ),
                              SizedBox(
                                height: 20,
                                child: ListTile(
                                  dense: true,
                                  minVerticalPadding: 0,
                                  title: Text("9024240876"),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.message),
                                        iconSize: 18,
                                        onPressed: () {
                                          print('Message tapped');
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        iconSize: 18,
                                        onPressed: () {
                                          print('Delete tapped');
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.picture_as_pdf),
                                        iconSize: 18,
                                        onPressed: () {
                                          print('PDF tapped');
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.thumb_up),
                                        iconSize: 18,
                                        onPressed: () {
                                          Get.to(JobColseScreen());
                                          print('deleat');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              addVerticalSpace(18),
                              Divider(
                                thickness: 1,
                                color: Color.fromARGB(255, 125, 170, 160),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total Amount"),
                                  Divider(),
                                  Text("Total paid"),
                                  Text("Total due  ")
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text("2"),
          Text("3"),
          Text("4"),
          Text("5"),
          Text("6"),
        ],
      ),
      floatingActionButton: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Color(0xffd2daff)),
        child: Row(
          children: [
            Icon(Icons.add),
            Text(
              "  Job Card",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ),
        // backgroundColor: Colors.blue,
      ),
    );
  }
}
