import 'dart:async';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:crypto/MyHomePage.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatefulWidget {
  @override
  State<GetStarted> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<GetStarted> {
  void initState() {
    super.initState();

    // Timer(Duration(seconds: 4), () {
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => MyHomePage(),
    //       ));
    // });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 110),
            Image.asset(
              'assets/images/Crypto.jpg',
              width: 320,
              height: 320,
            ),
            SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text('Track',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(width: 8),
              Text(
                'Your',
                style: TextStyle(
                  color: Color.fromARGB(255, 15, 158, 34),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            Text(
              'CryptoCurrency',
              style: TextStyle(
                color: Color(0xFF0F9E22),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
