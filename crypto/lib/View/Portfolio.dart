import 'package:crypto/Model/local_storage.dart';
import 'package:flutter/material.dart';

class Portfolio extends StatefulWidget {

  final Currencies;

  Portfolio({required this.Currencies});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  
  List<String>?  _favList;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    getFav();
  }

  getFav()async{
    _favList = await LocalStorage.getFav();
    print(_favList!.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        
        itemCount: _favList?.length,
        itemBuilder: (context,index){
          // List<Map<dynamic,dynamic>> _mp = widget.Currencies.where((element){
          //    element['id']==int.parse(_favList![index]);
          // });
          List<Map<dynamic, dynamic>> _mp = [];
          for (var element in widget.Currencies) {
            if (element['id'] == int.parse(_favList![index])) {
              _mp.add(element as Map<dynamic, dynamic> );
              // If you expect only one matching element, you can break the loop here
              // break;
            }
          }

          return ListTile(
            title:  _mp[0]['name'],
          );
        },
      ),
    );
//     Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Image.asset(
//                 'assets/images/bitcoin.png',
//                 width: 25,
//                 height: 25,
//               ),
//             ),
//             Text(
//               'CryptoVerse',
//               style: TextStyle(color: Colors.white, fontFamily: 'Open Sans'),
//             ),
//           ],
//         ),
//         backgroundColor: Color.fromRGBO(67, 2, 102, 1),
//       ),
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Text(
//                   'Portfolio',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Divider(),
// widget.Currencies.isEmpty
//                   ? Center(
//                       child: Text('No Contact yet',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                               color: Colors.grey)))
//                   : Expanded(
//                       child: ListView.builder(
//                         itemCount: widget.Currencies.length,
//                         itemBuilder: (context, index) => getRow(index),
//                       ),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
  }
}

//   Widget getRow(int index) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(4.0),
//         child: ListTile(
//           leading: CircleAvatar(
//             child: Text(widget.Currencies[index].name[0]),
//             backgroundColor: index % 2 == 0 ? Colors.pink : Colors.purple,
//             foregroundColor: Colors.white,
//           ),
//           title:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Text(
//               widget.Currencies[index],
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(widget.Currencies[index].contact),
//           ]),
//           trailing: SizedBox(
//             width: 60,
//             child: Row(children: [
//               InkWell(
//                 onTap: () {
//                   setState(() {
                    
//                   });
//                 },
//                 child: Icon(Icons.delete),
//               )
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
