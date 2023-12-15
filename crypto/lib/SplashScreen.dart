import 'dart:async';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:crypto/GetStarted.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    
    super.initState();

    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GetStarted(),
          ));
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 34, 9, 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/bitcoin.png',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Text('Crypto',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      )),

                  Text(
                    'Verse',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ].animate(interval: 500.ms).fade(duration: 3000.ms),
               ),
            ].animate(interval: 500.ms).slideY(duration: 3000.ms,curve: Curves.easeOut).fade(duration: 2000.ms),
          ),
        ),
      ),
    );
  }
}
 