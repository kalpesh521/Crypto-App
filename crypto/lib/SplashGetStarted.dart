import 'dart:async';
import 'package:crypto/GetStarted.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:crypto/MyHomePage.dart';
import 'package:flutter/material.dart';

class SplashGetStarted extends StatefulWidget {
  @override
  State<SplashGetStarted> createState() => _SplashGetStartedState();
}

class _SplashGetStartedState extends State<SplashGetStarted> {
  void initState() {
    super.initState();

    Timer(Duration(seconds: 11152), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GetStarted(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: ClipPath(
                clipper: clip3Clipper(),
                child: Container(
                    height: 80,
                    width: 80,
                    color:
                        Color(0xFFDFFFFB)), // Adjust size and color as needed
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(width: 70),
              ClipPath(
                clipper: clip1Clipper(),
                child:
                    Container(height: 80, width: 80, color: Color(0xFFFFE8C7)),
              ),
              SizedBox(height: 25),
              SizedBox(width: 25),
              ClipPath(
                clipper: circleClipper(),
                child:
                    Container(height: 40, width: 40, color: Color(0xFFFCFABB)),
              ),
              SizedBox(width: 5),
              SizedBox(height: 55),
              ClipPath(
                clipper: circleClipper(),
                child:
                    Container(height: 20, width: 20, color: Color(0xFFFCFABB)),
              ),
            ]),

            SizedBox(height: 20),
            // SizedBox(height: 130),
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
              padding: EdgeInsets.only(left: 30),
              child: Container(
                height: 5,
                width: 130,
                color: Colors.orange,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ClipPath(
                  clipper: clip2Clipper(),
                  child: Container(
                    height: 80,
                    width: 80,
                    color: Color(0xFFEAD4EA),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class clip1Clipper extends CustomClipper<Path> {
  final double angleInRadians; // Angle in radians to rotate the clipper

  clip1Clipper({this.angleInRadians = 0.2});
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);
    final matrix = Matrix4.identity()..rotateZ(angleInRadians);
    return path.transform(matrix.storage);
    // return path;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
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

class clip3Clipper extends CustomClipper<Path> {
  Path getClip(Size size) {
    Path path = Path();
    // path.lineTo(size.width,0);
    // path.lineTo(size.width, size.height);
    // path.quadraticBezierTo(size.width, 0, 0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(0, size.height, 0, 0);

    return path;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class circleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
