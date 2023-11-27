import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
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

final List<MaterialColor> _colors = [
  Colors.orange,
  Colors.red,
  Colors.blue,
  Colors.purple,
  Colors.pink,
  Colors.green,
];
Widget _cryptoWidget(List<dynamic> currencies) {
  return Container(
      child: Column(
    children: <Widget>[
      Padding(
          padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 16.0),
          child: Text.rich(
            TextSpan(
              text:
                  'Today\'s Cryptocurrency Prices by Market Cap\'s                    ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                // fontFamily: 'Roboto',
              ),
              children: <InlineSpan>[
                TextSpan(
                  text: 'Live Now',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.withOpacity(1.0),
                  ),
                ),
              ],
            ),
          )),
      SizedBox(height: 5),
      Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Divider(
          color: Colors.grey.shade400,
          height: 1.5,
          thickness: 1.5,
        ),
      ),
      Flexible(
        child: (currencies.length == 0)
            ? Container()
            : Padding(
                padding: EdgeInsets.fromLTRB(3.0, 10.0, 3.0, 5.0),
                child: ListView.separated(
                    itemCount: currencies.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      final MaterialColor color =
                          _colors[index % _colors.length];
                      return SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: Card(
                              elevation: 8,
                              margin: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 10),
                              child: Center(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: color,
                                    radius: 35,
                                    child: new Text(
                                      currencies[index]['symbol'].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  title: Text(
                                      currencies[index]['name'].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                    '\$${currencies[index]['quote']['USD']['price'].toStringAsFixed(2)}',
                                  ),
                                  trailing: _getSubTitle(
                                    currencies[index]['quote']['USD']
                                            ['percent_change_1h']
                                        .toStringAsFixed(2),
                                  ),
                                ),
                              )));
                    }),
              ),
      ),
    ],
  ));
}

Widget _getSubTitle(String percentChange) {
  String percentageChangeText = "$percentChange%\n";
  TextSpan percentageChangeTextWidget;

  IconData icon;
  Color iconColor;

  if (double.parse(percentChange) > 0) {
    icon = Icons.arrow_upward;
    iconColor = Colors.green;
  } else {
    icon = Icons.arrow_downward;
    iconColor = Colors.red;
  }

  if (double.parse(percentChange) > 0) {
    percentageChangeTextWidget = new TextSpan(
      text: percentageChangeText,
      style: TextStyle(
          color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
    );
  } else {
    percentageChangeTextWidget = new TextSpan(
        text: percentageChangeText,
        style: TextStyle(
            color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold));
  }
  // return new RichText(text: TextSpan(children: [percentageChangeTextWidget]));
  return RichText(
    text: TextSpan(
      children: [
        WidgetSpan(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0),
            child: Icon(icon,
                color: iconColor,
                size: 16), // Icon representing increase/decrease
          ),
        ),
        TextSpan(
          text: '$percentChange%',
          style: TextStyle(
            color: iconColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
