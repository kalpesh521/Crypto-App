import 'package:crypto/GetStarted.dart';
import 'package:crypto/SplashGetStarted.dart';
import 'package:crypto/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:crypto/MyHomePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      // home:  SplashScreen(),
      debugShowCheckedModeBanner: false, 
      home: SplashGetStarted(),
    );
  }
}
