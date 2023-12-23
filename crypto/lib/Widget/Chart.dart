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
      height: 340,
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
          ],
        ),
      ),
    );
  }

  List<ChartModel>? itemChart;

  bool isRefresh = true;

  Future<void> getChart() async {
    String url =
        'https://api.coingecko.com/api/v3/coins/bitcoin/ohlc?vs_currency=usd&days=1';

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
      });
    } else {
      print(response.statusCode);
    }
  }
}
