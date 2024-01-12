import 'package:crypto/User%20Auth/firebase_Services.dart';
import 'package:crypto/Widget/toast.dart';
import 'package:crypto/Widget/form_Container.dart';
import 'package:crypto/View/HomePage.dart';
import 'package:crypto/View/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSignin = false;
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(), // Remove Back Arrow
        centerTitle: true,
        title: Text("Login", style: TextStyle()),
        backgroundColor: Color.fromARGB(174, 109, 255, 211),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LOGIN",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              FormContainer(
                controller: _emailController,
                hintText: "Email",
                isPasswordField: false,
              ),
              SizedBox(
                height: 30,
              ),
              FormContainer(
                controller: _passwordController,
                hintText: "Password",
                isPasswordField: true,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    _signIn();
                  },
                  child: _isSignin
                      ? CircularProgressIndicator(
                          color: Colors.purple, strokeWidth: 4)
                      : Text("LOGIN")),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an Account?"),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                          (route) => false);
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSignin = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInwithEmailandPassword(email, password);
    setState(() {
      _isSignin = false;
    });
    if (user != null) {
      showToast(message: 'You are Logged In');
      Navigator.pushNamed(context, "/home");
    } else {
      showToast(message: 'Some Error Happened');
    }
  }
}
