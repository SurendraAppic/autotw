import 'package:autowheelapp/screen/Intro/SignUp.dart';
import 'package:autowheelapp/screen/Intro/autowheel.dart';
import 'package:autowheelapp/utils/image/image.dart';
import 'package:autowheelapp/utils/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Slider1Screen extends StatefulWidget {
  const Slider1Screen({Key? key}) : super(key: key);

  @override
  _Slider1ScreenState createState() => _Slider1ScreenState();
}

class _Slider1ScreenState extends State<Slider1Screen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<String> imagePaths = [jobcardimg, seavice, dashbordimg];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: List.generate(
                imagePaths.length,
                (index) => buildPage(index),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  imagePaths.length,
                  (index) => buildIndicator(index),
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 10,
              right: 10,
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        Get.to(SignupScreen());
                      },
                      child: Button('Use Trail Version')),
                  SizedBox(height: 10),
                  InkWell(
                      onTap: () {
                        Get.to(Autowheel());
                      },
                      child: Button('Already had a License')),
                  addVerticalSpace(10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage(int index) {
    return Image.asset(
      imagePaths[index],
      fit: BoxFit.fill,
      height: 40,
    );
  }

  Widget buildIndicator(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentPage == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}
