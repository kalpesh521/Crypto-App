import 'dart:async';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:crypto/MyHomePage.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatefulWidget {
  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 130),
            Image.asset(
              'assets/images/Crypto.jpg',
              width: 330,
              height: 330,
            ),
            SizedBox(height: 25),
            Row(
              children: [
                SizedBox(width: 35),
                Text(
                  'Track',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'Your',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            // Added spacing between rows
            Row(
              children: [
                SizedBox(width: 35),
                Text(
                  'Crypto',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  'currency',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 30), // Adjust the left padding as needed
              child: Container(
                height: 5,
                width: 130, // Expand line to fill the width
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 45),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ),
                  );
                },
                child: Text(
                  "GET STARTED",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromRGBO(67, 2, 102, 1),
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(
                        horizontal:
                            35), // Adjust the horizontal padding as needed
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
