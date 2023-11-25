import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  // List currencies;
  // MyHomePage(this.currencies);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
// Map mapResponse;

class _MyHomePageState extends State<MyHomePage> {
  late List currencies;
  late String StringResponse;
  bool isLoading = true;

  final List<MaterialColor> _colors = [
    Colors.amber,
    Colors.blue,
    Colors.red,
    Colors.indigo
  ];

  Future<void> apicalls() async {
    http.Response response = await http.get(Uri.parse(
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=abd75ba2-b9ae-44c2-89d8-80b8a044544c"));
    // http.Response response =
    // await http.get(Uri.parse("https://reqres.in/api/users?page=2"));

    if (response.statusCode == 200) {
      setState(() {
        // StringResponse = response.body;
        Map mapResponse = json.decode(response.body);
        print(mapResponse['data'][0]['name']);
        StringResponse = mapResponse['data'][0]['name'].toString();
      });

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    apicalls();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mapResponse;
    return new Scaffold(
      appBar: new AppBar(
          title: new Text(
            'Crypto App',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(94, 7, 110, 0.863)),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber,
          ),
          child: Center(
            child: isLoading
                ? CircularProgressIndicator()
                // : Text(mapResponse['data'][0]['id'].toString()),
                : Text(StringResponse),
          ),
        ),
      ),
    );
  }
}




 /* @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text(
            'Crypto App',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(94, 7, 110, 0.863)),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return new Container(
        child: Column(
      children: [
        Flexible(
          child: new ListView.builder(
              itemCount: widget.currencies.length,
              itemBuilder: (BuildContext context, int index) {
                final Map currency = widget.currencies[index];
                final MaterialColor color = _colors[index % currencies.length];

                return _getListItemUI(currency, color);
              }),
        ),
      ],
    ));
  }

  Widget _getListItemUI(Map currency, MaterialColor color) {
    final Map<String, dynamic> firstItem = currency['data'][0];
    
    final String name = firstItem['name']; // Extracting name
    final String symbol = firstItem['symbol']; // Extracting symbol
    final double price = firstItem['quote']['USD']['price']; // Extracting price
    final double percentChange = firstItem['quote']['USD']['percent_change_1h']; // Extracting price
    
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        child: new Text(symbol.toString()),
      ),
      title:
          Text(name.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
      // subtitle: _getSubTitle(currency['price'], currency['percent_change_1h']),
      subtitle: _getSubTitle(price.toString(), percentChange.toString()),
    );
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
}
*/