// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class demo extends StatefulWidget {
//   const demo({super.key});

//   @override
//   State<demo> createState() => _demoState();
// }

// class _demoState extends State<demo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text("Kalpesh"),
//       ],
//     ));
//   }
//     _fetch() async {
//     final firebaseUser = await FirebaseAuth.instance.currentUser!();
//     if (firebaseUser != null)
//       await Firestore.instance
//           .collection('Users')
//           .document(firebaseUser.uid)
//           .get()
//           .then((ds) {
//         myEmail = ds.data['email'];
//         print(myEmail);
//       }).catchError((e) {
//         print(e);
//       });
//   }
// }
