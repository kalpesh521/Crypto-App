import 'package:crypto/View/GetStarted.dart';
import 'package:crypto/View/SelectCoin.dart';
import 'package:crypto/View/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:crypto/View/HomePage.dart';
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
      home:  SplashScreen(),
      // home: MyHomePage(),
      // home: SelectCoin(Selectitem),
      debugShowCheckedModeBanner: false, 
    );
  }
}
