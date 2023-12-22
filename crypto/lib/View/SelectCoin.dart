import 'dart:convert';
import 'package:crypto/Model/CoinModel.dart';
import 'package:crypto/Model/ChartModel.dart';
import 'package:crypto/View/MyHomePage.dart';
import 'package:crypto/Widget/Chart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';

class SelectCoin extends StatefulWidget {
  var Currencies;
  SelectCoin(this.Currencies);
  @override
  State<SelectCoin> createState() => _SelectCoinState();
}

class _SelectCoinState extends State<SelectCoin> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    double percent_change_1h = double.tryParse(widget.Currencies['quote']['USD']
                ['percent_change_1h']
            .toStringAsFixed(2)) ??
        0.0;
    double volume_change_24h = double.tryParse(widget.Currencies['quote']['USD']
                ['volume_change_24h']
            .toStringAsFixed(2)) ??
        0.0;

    return SafeArea(
        child: Scaffold(
      body: Container(
        height: myHeight,
        width: myWidth,
        child: Column(children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: myWidth * 0.06, vertical: myHeight * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 255, 157, 20),
                      radius: 25,
                      child: Text(
                        widget.Currencies['symbol'],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: myWidth * 0.03,
                    ),
                    Text(
                      widget.Currencies['name'],
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$' +
                          widget.Currencies['quote']['USD']['price']
                              .toStringAsFixed(2),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: myHeight * 0.01,
                    ),
                    Text(
                      widget.Currencies['quote']['USD']['percent_change_1h']
                              .toStringAsFixed(2) +
                          '%',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: percent_change_1h >= 0
                              ? Colors.green
                              : Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: myWidth * 0.04, vertical: myHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Market Cap',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: myHeight * 0.01,
                          ),
                          Text(
                            '\$' +
                                widget.Currencies['quote']['USD']['market_cap']
                                    .toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Volume(24h)',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: myHeight * 0.01,
                          ),
                          Text(
                            '\$' +
                                widget.Currencies['quote']['USD']['volume_24h']
                                    .toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Volume%',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: myHeight * 0.01,
                          ),
                          Text(
                            widget.Currencies['quote']['USD']
                                        ['volume_change_24h']
                                    .toStringAsFixed(2) +
                                '%',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: volume_change_24h >= 0
                                    ? Colors.green
                                    : Colors.red),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  child: Chart(widget.Currencies),
                ),
                SizedBox(height: 1),
                Divider(),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: myWidth * 0.02,
                            vertical: myHeight * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Total Supply',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                SizedBox(
                                  height: myHeight * 0.01,
                                ),
                                Text(
                                  '\$' +
                                      widget.Currencies['total_supply']
                                          .toStringAsFixed(0),
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Circulating Supply',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                SizedBox(
                                  height: myHeight * 0.01,
                                ),
                                Text(
                                  '\$' +
                                      widget.Currencies['circulating_supply']
                                          .toStringAsFixed(0),
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Market Dominance',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                SizedBox(
                                  height: myHeight * 0.01,
                                ),
                                Text(
                                    widget.Currencies['quote']['USD']
                                                ['market_cap_dominance']
                                            .toStringAsFixed(2) +
                                        '%',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.purple,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
