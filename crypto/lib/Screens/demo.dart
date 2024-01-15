import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class demo extends StatelessWidget {
   final User currentUser;

  demo({required this.currentUser});

  @override
  Widget build(BuildContext context) {
    //getting current user userid
    final users = FirebaseAuth.instance.currentUser;
    final userId = users!.uid;
    // final userId = '7KVAjQAFQE1JUhPohkk9';

    print(userId);
    print(users);
     return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 233, 233),
      body: Padding(
        padding: EdgeInsets.all(115),
        child: Container(
          padding: EdgeInsets.only(left: 5.0, right: 2.0),
          child: Row(
            children: [
              Icon(Icons.people),
              SizedBox(
                width: 15,
              ),  
              FutureBuilder(
                   future: FirebaseFirestore.instance
                      .collection('Users')
                      .doc(userId)
                      .get(),
                  builder: (context, futuresnapshot) {
                    if (futuresnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Text(
                        "Waiting.....",
                        textAlign: TextAlign.end,
                        style: TextStyle(color: Colors.black),
                      );
                    }
                    return Text(
                      futuresnapshot.data!['Name'],
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
