import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

final List<MaterialColor> _colors = [
  Colors.amber,
  Colors.blue,
  Colors.red,
  Colors.indigo
];

class MyHomePageState extends State<MyHomePage> {
  String StrResponse = "";

  bool isLoading = true;
  List<dynamic> currencies = [];
  bool init = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!init) {
      getCurrencies();
    }
    setState(() {
      init = true;
    });
  }

  Future<void> getCurrencies() async {
    String cryptpurl =
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=abd75ba2-b9ae-44c2-89d8-80b8a044544c";
    var response = await http.get(Uri.parse(cryptpurl));
    if (response.statusCode == 200) {
      final Map<dynamic, dynamic> temp = json.decode(response.body);
      setState(() {
        temp['data'].forEach((e) => currencies.add(e));
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(currencies);
    return Scaffold(
      appBar: new AppBar(
          title: new Text(
            'Crypto App',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(94, 7, 110, 0.863)),
      body: currencies == null
          ? CircularProgressIndicator()
          : _cryptoWidget(currencies),
    );
  }
}

Widget _cryptoWidget(List<dynamic> currencies) {
  print(currencies[0]['symbol']);
  return Container(
      child: Column(
    children: <Widget>[
      Flexible(
        child: (currencies.length == 0)
            ? Container()
            : ListView.builder(
                itemCount: currencies.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: new CircleAvatar(
                      backgroundColor: Colors.green,
                      child: new Text(currencies[index]['symbol'].toString()),
                    ),
                    title: Text(currencies[index]['name'].toString(),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(
                        currencies[index]['quote']['USD']['price'].toString()),
                    // isThreeLine: true,
                  );
                }),
      ),
    ],
  ));
}

Widget _getSubTitle(String priceUsd, String percentChange) {
  TextSpan priceWidget =
      TextSpan(text: "\$$priceUsd\n", style: TextStyle(color: Colors.black));
  String percentageChangeText = "$percentChange%\n";
  TextSpan percentageChangeTextWidget;
  if (double.parse(percentChange) > 0) {
    percentageChangeTextWidget = new TextSpan(
        text: percentageChangeText, style: TextStyle(color: Colors.green));
  } else {
    percentageChangeTextWidget = new TextSpan(
        text: percentageChangeText, style: TextStyle(color: Colors.red));
  }
  return new RichText(
      text: TextSpan(children: [priceWidget, percentageChangeTextWidget]));
}
