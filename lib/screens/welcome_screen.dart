import 'package:flutter/material.dart';

// Component Imports
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/actionbutton.dart';

// Screen Imports
import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String path = '/WelcomeScreen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    // controller = AnimationController(
    //   duration: Duration(seconds: 5),
    //   vsync: this,
    // );
    // animation = Tween(
    //   begin: Print();
    // ).animate(controller);
    // controller.forward();

    // controller.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: [
                    'Flash Chat',
                  ],
                  repeatForever: true,
                  speed: Duration(seconds: 1),
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ActionButton(
              label: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, LoginScreen.path);
              },
            ),
            ActionButton(
              label: 'Sign Up',
              color: Colors.blueAccent,
              onPressed: () {
                //Go to Sign Up screen.
                Navigator.pushNamed(context, RegistrationScreen.path);
              },
            ),
          ],
        ),
      ),
    );
  }
}
