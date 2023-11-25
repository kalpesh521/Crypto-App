import 'package:flutter/material.dart';
import 'package:crypto/MyHomePage.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'dart:convert';

void main() async {
  // List currencies = await getCurrencies();
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      // home: new MyHomePage(_currencies),
      home: MyHomePage(),
    );
  }
}



/*
class MyApp extends StatelessWidget {
  // final List _currencies;
  // MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      // home: new MyHomePage(_currencies),
      home: MyHomePage(),
    );
  }
}

*/














/*
Future<List> getCurrencies() async {
  // String cryptoUrl =
  //     'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=abd75ba2-b9ae-44c2-89d8-80b8a044544c';

  // var uri = Uri.http(
  //     'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=abd75ba2-b9ae-44c2-89d8-80b8a044544c');
  
  http.Response response = await http.get(Uri.parse(
      'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=abd75ba2-b9ae-44c2-89d8-80b8a044544c'));
  // http.Response response = await http.get(uri);
  // final response = await http.get(uri);  
  return json.decode(response.body);
} 
 
 /*
Future<List> getCurrencies() async {


  try {
    var dio = new Dio();
    dio.options.headers.addAll({'Access-Control-Host-Origin': '*'});
    // var response = await dio.get('https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=abd75ba2-b9ae-44c2-89d8-80b8a044544c');
    var response = await dio.get('https://cryptocapitalmodel.onrender.com/crypto/pastData?currency=BTC-USD');
    // var response = await dio.get('https://jsonplaceholder.typicode.com/todos/1');
    return response.data;
  } catch (e) {
    // Catch DioExceptions and print the error message
    print('Dio Error: $e');
    throw e; // Rethrow the exception if needed
  }
} */
*/