import 'package:crypto/Screens/Portfolio.dart';
import 'package:crypto/Components/Chart.dart';
import 'package:flutter/material.dart';
  
class SelectCoin extends StatefulWidget {
  var Currencies;
  SelectCoin(this.Currencies);
  @override
  State<SelectCoin> createState() => _SelectCoinState();
}

class _SelectCoinState extends State<SelectCoin> {

  List<String> _fav=[];

  List<dynamic> portfolio = []; // Portfolio list to store selected coins

  // Function to add coin to the portfolio list
  void addToPortfolio() {
    setState(() {
      // Check if the coin is not already added to the portfolio
      if (!portfolio.contains(widget.Currencies)) {
        portfolio.add(widget.Currencies); // Add the selected coin
        // You can perform any additional actions here, like showing a confirmation message
      }
    });
  }

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

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'assets/images/bitcoin.png',
                width: 25,
                height: 25,
              ),
            ),
            Text(
              'CryptoVerse',
              style: TextStyle(color: Colors.white, fontFamily: 'Open Sans'),
            ),
            SizedBox(width: 110),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      // MaterialPageRoute(builder: (context) => Portfolio(widget.Currencies)));
                      MaterialPageRoute(builder: (context) => Portfolio( )));
                },
                child: Image.asset(
                  'assets/images/digital-currency.png',
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(67, 2, 102, 1),
      ),
      body: Container(
        height: myHeight,
        width: myWidth,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: myWidth * 0.03, vertical: myHeight * 0.02),
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
                      horizontal: myWidth * 0.02, vertical: myHeight * 0.01),
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
                  child: Chart(),
                ),
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
                ),
                Divider(),
                SizedBox(height: 5),
                Center(
                  child: ElevatedButton(
                    // onPressed: addToPortfolio,
                    // Navigator.push(
                    //   context,
                    //   PageTransition(
                    //     child: MyHomePage(),
                    //     type: PageTransitionType.leftToRight,
                    //     duration: Duration(milliseconds: 700),
                    //   ),
                    // );
                    // },
                    onPressed: (){
                      // _fav.add(widget.Currencies['id'].toString()!);
                      // LocalStorage.setFav(_fav);
                    },
                    child: Text(
                      "ADD TO PORTFOLIO",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(67, 2, 102, 1),
                      ),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 35),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
