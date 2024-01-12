import 'package:animate_do/animate_do.dart';
import 'package:crypto/View/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:crypto/User%20Auth/firebase_Services.dart';
import 'package:crypto/Widget/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isSignUp = false;
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color.fromARGB(255, 55, 12, 91),
                Color.fromARGB(255, 241, 60, 159),
                Color.fromARGB(255, 255, 134, 225)
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 1300),
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1400),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(255, 88, 224, 0.298),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200)),
                                ),
                                child: TextField(
                                  controller: _usernameController,
                                  decoration: InputDecoration(
                                      hintText: "Username",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200)),
                                ),
                                child: TextField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200)),
                                ),
                                child: TextField(
                                  obscureText: true,
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      FadeInUp(
                          duration: Duration(milliseconds: 1500),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an Account?",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignIn()),
                                      (route) => false);
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 65, 11, 79),
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1600),
                        child: MaterialButton(
                          onPressed: () {
                            _signUp();
                          },
                          height: 50,
                          color: Color.fromARGB(255, 98, 34, 116),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: _isSignUp
                              ? CircularProgressIndicator(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  strokeWidth: 4)
                              : Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      _isSignUp = true;
    });
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpwithEmailandPassword(email, password);
    setState(() {
      _isSignUp = false;
    });
    if (user != null) {
      showToast(message: 'Account Created Successfully');
      Navigator.pushNamed(context, "/home");
    } else {
      showToast(message: 'Some Error Happened');
    }
  }
}
