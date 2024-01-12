import 'package:crypto/View/GetStarted.dart';
import 'package:crypto/View/SelectCoin.dart';
import 'package:crypto/View/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:crypto/View/HomePage.dart';
import 'package:crypto/View/LoginPage.dart';
import 'package:crypto/View/SignUp.dart';
import 'package:crypto/View/SignIn.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
      apiKey:
          "AIzaSyDCkkn_WaFeTHK-70iTaGwRVh-sjwSjGEI", // paste your api key here
      appId:
          "1:441796468460:android:17603a58bdf4fe16e78fc9", //paste your app id here
      messagingSenderId: "441796468460", //paste your messagingSenderId here
      projectId: "cryptoverse-f002a", //paste your project id here
    ),
  );
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
      home:  HomePage(),
      // home: MyHomePage(),
      // home: SelectCoin(Selectitem),
      debugShowCheckedModeBanner: false, 
       routes: {
        // '/': (context) =>  SplashScreen() ,
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUp(),
        '/home': (context) => GetStarted(),
      },
    );
  }
}
