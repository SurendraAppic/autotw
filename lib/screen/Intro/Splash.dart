

import 'package:autowheelapp/screen/Intro/slider1.dart';
import 'package:autowheelapp/utils/image/image.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              Slider1Screen(), // Replace with your signup screen
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // You can add your logo or any other content here
            Image.asset(Splashimg),
            SizedBox(height: 16),
            CircularProgressIndicator(), // You can add a loading indicator
          ],
        ),
      ),
    );
  }
}
