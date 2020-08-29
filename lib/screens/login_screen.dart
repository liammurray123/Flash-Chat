import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

// Component Imports
import 'package:flash_chat/components/actionbutton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

// Firebase Imports
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String path = '/LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                style: TextStyle(color: Colors.black),
                decoration: kTextFieldStyle.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                style: TextStyle(color: Colors.black),
                decoration: kTextFieldStyle.copyWith(
                  hintText: 'Enter a password',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              ActionButton(
                label: 'Log In',
                color: Colors.lightBlueAccent,
                onPressed: () async {
                  try {
                    setState(() {
                      showSpinner = true;
                    });
                    final returningUser =
                        await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                    if (returningUser != null) {
                      Navigator.pushNamed(context, ChatScreen.path);
                    }
                  } catch (e) {
                    Navigator.pop(context);
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
