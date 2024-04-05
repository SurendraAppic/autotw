//
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
// ignore: camel_case_types
class Staff_master2 extends StatefulWidget {
  const Staff_master2({super.key});

  @override
  State<Staff_master2> createState() => _Staff_master2State();
}

// ignore: camel_case_types
class _Staff_master2State extends State<Staff_master2> {
  var cetegorycon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 36,
        iconTheme: IconThemeData(color: AppColor.kBlack),
        backgroundColor: Color.fromARGB(255, 82, 198, 86),
        elevation: 5,
        centerTitle: true,
        title: textcostam(Loctiontxt, 22, AppColor.kBlack),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            textformfiles(cetegorycon,
                // ignore: body_might_complete_normally_nullable
                validator: (p0) {},
                label: textcostam(typetxt, 15, AppColor.kGray),
                prefixIcon: Icon(Icons.search)),
          ],
        ),
      ),
    );
  }
}
