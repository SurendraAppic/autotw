import 'package:autowheelapp/screen/Intro/HomePage.dart';
import 'package:autowheelapp/showroom/FollowUpScreen.dart';
import 'package:autowheelapp/showroom/Prosepet.dart';
import 'package:autowheelapp/utils/widget/String.dart';
import 'package:autowheelapp/utils/color/Appcolor.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
final emailController = TextEditingController(text: "User");
final passwordController = TextEditingController(text: "****");
var isshow = false;
var h, w;
String? selectedOption;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 82, 198, 86),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      "assets/4696637d-04bd-47b5-9439-eb6aaff3b61a.jpg",
                    ),
                  ),
                ),
                Text(
                  "  Welcome",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  " Sign In",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: h * 0.78,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 12, color: Colors.grey)],
          color: AppColor.kWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage("assets/AutoWheel Logo.jpg"),
                    ),
                    addhorizontalSpace(8),
                                     Container(
                      height: 50,
                      width: 260,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.kBlack),
                      ),
                      child: Row(
                        children: [
                          Radio<String>(
                            value: 'Sale',
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value;
                                if (value == 'Sale') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProsepetScreen(),
                                    ),
                                  );

                                  ElevatedButton(
                                      onPressed: () {}, child: Text("data"));
                                }
                              });
                            },
                          ),
                          Text('Sale'),
                          Radio<String>(
                            value: 'Service',
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value;
                                if (value == 'Service') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FollowUpScreen(),
                                    ),
                                  );
                                }
                              });
                            },
                          ),
                          Text('Service'),
                          Radio<String>(
                            value: 'Both',
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value;
                              });
                            },
                          ),
                          Text('Both'),
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 180,
                    width: 180,
                    color: Color(0xff6799C7),
                    child: Image.asset(
                      "assets/11038.jpg",
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    errorBorder: InputBorder.none,
                    hintText: 'Username',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF090909), width: 20.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    errorBorder: InputBorder.none,
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF090909), width: 20.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      print(1);
                      isshow = !isshow;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                        child: Checkbox(
                            activeColor: AppColor.kBlue,
                            value: isshow,
                            onChanged: (e) {
                                                 }),
                      ),
                      addhorizontalSpace(20),
                      Center(
                        child: Text(
                          Remembertext,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(HomePageScreen());
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF59B8BE),
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                      ],
            ),
          ),
        ),
      ),
    );
  }
}
