import 'dart:async';
import 'package:crypto/GetStarted.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:crypto/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class GetStarted extends StatefulWidget {
  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: ClipPath(
                clipper: Clip3Clipper(),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Color(0xFFFFE8C7),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 120),
                Image.asset(
                  'assets/images/Crypto.jpg',
                  width: 330,
                  height: 330,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 30),
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
                Row(
                  children: [
                    SizedBox(width: 30),
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
                  padding: EdgeInsets.only(left: 30),
                  child: Container(
                    height: 5,
                    width: 130,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(height: 45),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: MyHomePage(),
                          type: PageTransitionType.leftToRight,
                          duration: Duration(milliseconds: 700),
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
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: ClipPath(
                      clipper: clip2Clipper(),
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Color(0xFFEAD4EA),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class clip2Clipper extends CustomClipper<Path> {
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(size.width, 0, 0, 0);

    return path;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class Clip3Clipper extends CustomClipper<Path> {
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(0, size.height, 0, 0);

    return path;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
