import 'package:autowheelapp/screen/Intro/Businestype2.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';

import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Business1Screen extends StatefulWidget {
  @override
  _Business1ScreenState createState() => _Business1ScreenState();
}

class _Business1ScreenState extends State<Business1Screen> {
  String singleoutlate1 = "  Single Outlet";
  List<String> outlate1 = ['  Single Outlet', '  Multi-Outlet'];
  String selectedVehicleType = 'Car';
  List<String> selectedFeatures = [];

  Map<String, List<String>> vehicleFeatures = {
    'Car': [
      'Suv',
      'Pickup',
      'Minivan',
      'Hatchback',
      'Muv',
      'Sports Car',
      'Luxury Car',
      'All Vehicles'
    ],
    'Heavy Vehicles': [
      'Truck',
      'Bus',
      'Crane',
      'Excavator',
      'Loader',
      'Bulldozer',
      ''
    ],
    'Bike': ['Scooter', 'Motercycle', 'Mountain Bike', 'Road Bicycle'],
    'Tractor': [
      'Industrial Tractor',
      'Utility Tractor',
      'Mini Tractor',
      'Farm Tractor',
      'All'
    ],
    'Electric Vehicles': [
      'E-Bike',
      'E-Scooter',
      'E-Rickshaw',
      'E-Loader',
      'E-cycle'
    ],
    'Machine': [
      'Electronics',
      'Computer',
      'Welding machines',
      'Grass-cutting machines',
      'Other'
    ],
  };

  var h, w;
  TextEditingController abc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kappabrcolr,
        leading: BackButton(color: AppColor.kBlack),
        title: Text(
          'Business Type',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      // backgroundColor: Colors.lightBlue.shade50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              addVerticalSpace(10),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Set the border color
                    width: 1.0, // Set the border width
                  ),
                  borderRadius:
                      BorderRadius.circular(5.0), // Set the border radius
                ),
                child: DropdownButton<String>(
                  isDense: true,
                  underline: Container(),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    size: h * 0.030,
                    color: Colors.black,
                  ),
                  isExpanded: true,
                  value: selectedVehicleType,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedVehicleType = newValue!;
                      selectedFeatures = [];
                    });
                  },
                  items: [
                    'Car',
                    'Heavy Vehicles',
                    'Bike',
                    'Tractor',
                    'Electric Vehicles',
                    'Machine'
                  ]
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(height: 10),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8.0,
                    children: vehicleFeatures[selectedVehicleType]!
                        .map(
                          (feature) => ChoiceChip(
                            label: Text(
                              feature,
                              style: TextStyle(fontSize: 17),
                            ),
                            selected: selectedFeatures.contains(feature),
                            onSelected: (bool selected) {
                              setState(() {
                                if (selected) {
                                  // If the feature is selected, remove it from the list
                                  // and add it to the beginning
                                  // selectedFeatures.remove(feature);
                                  selectedFeatures.insert(0, feature);
                                } else {
                                  // If the feature is unselected, remove it from the list
                                  selectedFeatures.remove(feature);
                                }
                              });
                            },
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),

              SizedBox(height: 10),
              // Text('Selected Features: ${selectedFeatures.join(', ')}'),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      child: SizedBox(
                        height: 57,
                        width: 100,
                        child: DropdownButtonFormField(
                          value: singleoutlate1,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppColor.kBlack,
                          ),
                          decoration: InputDecoration(
                            // isDense: true,
                            border: InputBorder.none, // Remove input border
                            hintText: 'Select a Model',
                            // labelText: 'Select a Model',
                            hintStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            labelStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            contentPadding: EdgeInsets.all(5),
                          ),
                          dropdownColor: Colors.white,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            size: h * 0.030,
                            color: Colors.black,
                          ),
                          isExpanded: true,
                          items: outlate1.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              singleoutlate1 = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  addhorizontalSpace(5),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 20, // Set font size to 20
                      ),
                      decoration: InputDecoration(
                        labelText: "Outlets",
                        alignLabelWithHint: true,
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        hintStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(5),
                      ),
                      // Add validation logic and set the error text accordingly
                      // validator: (value) {
                      //   if (/* your validation condition */) {
                      //     return 'Error message';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                ],
              ),

              addVerticalSpace(40),
              InkWell(
                onTap: () {
                  Get.to(BusinessType2());
                },
                child: Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.kbuttonclr,
                  ),
                  child: Center(
                      child: Text(
                    "Save Details",
                    style: TextStyle(color: AppColor.kWhite, fontSize: 22),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
