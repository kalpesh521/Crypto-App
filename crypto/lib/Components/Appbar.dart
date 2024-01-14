import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
            SizedBox(width: 115),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: PopupMenuButton<String>(
                icon: Icon(Icons.more_vert_rounded, color: Colors.white),
                onSelected: (value) {
                  if (value == 'portfolio') {
                    // Handle portfolio action
                    print('Portfolio Selected');
                  } else if (value == 'signOut') {
                    // Handle sign out action
                    print('Sign Out Selected');
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: 'portfolio',
                      child: ListTile(
                        onTap: () {
                          //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:Portfolio()), (route) => false);
                        },
                        leading: Container(
                          child: Icon(Icons.portrait, color: Colors.pink),
                        ),
                        title: Text('Portfolio'),
                      ),
                    ),
                    PopupMenuDivider(),
                    PopupMenuItem<String>(
                      value: 'signOut',
                      child: ListTile(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushNamed(context, "/login");
                        },
                        leading: Container(
                          child: Icon(Icons.exit_to_app, color: Colors.pink),
                        ),
                        title: Text('Sign Out'),
                      ),
                    ),
                  ];
                },
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(67, 2, 102, 1),
      ),
    );
  }
}
