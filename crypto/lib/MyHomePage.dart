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
  List<dynamic> filteredCurrencies = [];
  TextEditingController? text_controller;

  @override
  void initState() {
    super.initState();
    text_controller = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!init) {
      getCurrencies();
    }
  }

  Future<void> getCurrencies() async {
    String cryptoUrl =
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=abd75ba2-b9ae-44c2-89d8-80b8a044544c";
    var response = await http.get(Uri.parse(cryptoUrl));
    if (response.statusCode == 200) {
      final Map<String, dynamic> temp = json.decode(response.body);
      setState(() {
        currencies = temp['data'];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load data');
    }
    init = true;
  }

  void _searchCurrencies(String query) {
    setState(() {
      filteredCurrencies = currencies.where((currency) {
        String name = currency['name'].toString().toLowerCase();
        return name.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: new Text(
          'CryptoVerse',
          style: TextStyle(color: Colors.white, fontFamily: 'Open Sans'),
        ),
        backgroundColor: Color.fromRGBO(94, 7, 110, 0.863),
      ),
      body: currencies == null
          ? CircularProgressIndicator()
          : _cryptoWidget(currencies),
    );
  }

  Widget _cryptoWidget(List<dynamic> currencies) {
    List<dynamic> Currencies =
        filteredCurrencies.isNotEmpty ? filteredCurrencies : currencies;
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
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
          child: Container(
            height: 45,
            width: 400,
            child: TextField(
              controller: text_controller,
              decoration: InputDecoration(
                prefixIconColor: Colors.amber,
                prefixIcon: Icon(Icons.search),
                labelText: 'Search Cryptocurrencies',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 13.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 255, 174, 44),
                    width: 2.0,
                  ),
                ),
              ),
              onChanged: _searchCurrencies,
            ),
          ),
        ),
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
                      itemCount: Currencies.length,
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
                                        Currencies[index]['symbol'].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    title: Text(
                                        Currencies[index]['name'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    subtitle: Text(
                                      '\$${Currencies[index]['quote']['USD']['price'].toStringAsFixed(2)}',
                                    ),
                                    trailing: _getSubTitle(
                                      Currencies[index]['quote']['USD']
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
    IconData icon;
    Color iconColor;
    double change = double.tryParse(percentChange) ?? 0.0;

    if (change > 0) {
      icon = Icons.arrow_upward;
      iconColor = Colors.green;
    } else {
      icon = Icons.arrow_downward;
      iconColor = Colors.red;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: iconColor),
        Text('$percentChange%', style: TextStyle(color: iconColor)),
      ],
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
