import 'dart:async';

// import 'package:bmi/main.dart';
// import 'package:flutter/cupertino.dart';
import 'package:crypto/MyHomePage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(
              // title: 'BMI',
            ),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 48, 13, 71),
        child: Center(
          child: Image.asset(
            'assets/images/bitcoin.png',
            width: 120, // Set the width here
            height: 120,
          ),
        ),
      ),
    );
  }
}