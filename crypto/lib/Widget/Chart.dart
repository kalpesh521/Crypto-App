import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/Model/ChartModel.dart';
import 'package:crypto/Model/CoinModel.dart';
import 'package:flutter/material.dart';
import 'package:crypto/View/SelectCoin.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:crypto/View/MyHomePage.dart';
import 'package:crypto/View/SelectCoin.dart';

class Chart extends StatefulWidget {
  var selectItem;
  Chart(this.selectItem);
  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late TrackballBehavior trackballBehavior;

  @override
  void initState() {
    getChart();
    trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            isRefresh == true
                ? Center(
                    child: CircularProgressIndicator(
                    color: Colors.amber,
                  ))
                : itemChart != null
                    ? SfCartesianChart(
                        trackballBehavior: trackballBehavior,
                        zoomPanBehavior: ZoomPanBehavior(
                          enablePanning: true,
                          zoomMode: ZoomMode.x,
                        ),
                        series: <CandleSeries>[
                          CandleSeries<ChartModel, int>(
                              enableSolidCandles: true,
                              enableTooltip: true,
                              bullColor: Colors.green,
                              bearColor: Colors.red,
                              dataSource: itemChart!,
                              xValueMapper: (ChartModel sales, _) => sales.time,
                              lowValueMapper: (ChartModel sales, _) =>
                                  sales.low,
                              highValueMapper: (ChartModel sales, _) =>
                                  sales.high,
                              openValueMapper: (ChartModel sales, _) =>
                                  sales.open,
                              closeValueMapper: (ChartModel sales, _) =>
                                  sales.close,
                              animationDuration: 55),
                        ],
                      )
                    : Text('No data available'),
            SizedBox(height: 20),
            Container(
              height: 35,
              child: Row(children: [
                SizedBox(width: 10),
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: text.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              textBool = [
                                false,
                                false,
                                false,
                                false,
                                false,
                                false
                              ];
                              textBool[index] = true;
                            });
                            setDays(text[index]);
                            getChart();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: textBool[index] == true
                                  ? Color.fromARGB(255, 235, 235, 235)
                                      .withOpacity(1.0)
                                  : Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color.fromARGB(255, 203, 203, 203)
                                    .withOpacity(0.7),
                                width: 1,
                              ),
                            ),
                            child: Text(
                              text[index],
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      );
                    })
              ]),
            ),
          ],
        ),
      ),
    );
  }

  List<String> text = ['24H', '7D', '30D', '3M', '6M', 'Y'];
  List<bool> textBool = [false, false, true, false, false, false];
  List<ChartModel>? itemChart;
  int days = 30;
  bool isRefresh = true;
  setDays(String txt) {
    if (txt == '24H') {
      setState(() {
        days = 1;
      });
    } else if (txt == '7D') {
      setState(() {
        days = 7;
      });
    } else if (txt == '30D') {
      setState(() {
        days = 30;
      });
    } else if (txt == '3M') {
      setState(() {
        days = 90;
      });
    } else if (txt == '6M') {
      setState(() {
        days = 180;
      });
    } else if (txt == 'Y') {
      setState(() {
        days = 365;
      });
    }
  }

  Future<void> getChart() async {
    String url =
        'https://api.coingecko.com/api/v3/coins/bitcoin/ohlc?vs_currency=usd&days=1';
    //     'https://api.coingecko.com/api/v3/coins/' +
    //         widget.selectItem.id +
    //         '/ohlc?vs_currency=usd&days=' +
    //         days.toString();
    // ;

    setState(() {
      isRefresh = true;
    });

    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    setState(() {
      isRefresh = false;
    });
    if (response.statusCode == 200) {
      Iterable x = json.decode(response.body);
      List<ChartModel> modelList =
          x.map((e) => ChartModel.fromJson(e)).toList();
      setState(() {
        itemChart = modelList;
        print(itemChart);
      });
    } else {
      print(response.statusCode);
    }
  }
}
