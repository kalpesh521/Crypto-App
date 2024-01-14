import 'package:crypto/Screens/GetStarted.dart';
import 'package:crypto/Screens/SplashScreen.dart';
import 'package:crypto/Screens/demo.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:crypto/Screens/SignUp.dart';
import 'package:crypto/Screens/SignIn.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // String kWebRecaptchaSiteKey;
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey:
        "AIzaSyDCkkn_WaFeTHK-70iTaGwRVh-sjwSjGEI", // paste your api key here
    appId:
        "1:441796468460:android:17603a58bdf4fe16e78fc9", //paste your app id here
    messagingSenderId: "441796468460", //paste your messagingSenderId here
    projectId: "cryptoverse-f002a", //paste your project id here
  ));

  // await FirebaseAppCheck.instance.activate(
  //   androidProvider: AndroidProvider.debug,
  //   webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
  // );

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
      // home: SplashScreen(),
      home: SignUp(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => SignIn(),
        '/signUp': (context) => SignUp(),
        '/home': (context) => GetStarted(),
      },
    );
  }
}
