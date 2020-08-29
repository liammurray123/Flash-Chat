import 'package:flutter/material.dart';

// Screen Imports
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

// Firebase Imports
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
        ),
      ),
      initialRoute: WelcomeScreen.path,
      routes: {
        WelcomeScreen.path: (context) => WelcomeScreen(),
        LoginScreen.path: (context) => LoginScreen(),
        RegistrationScreen.path: (context) => RegistrationScreen(),
        ChatScreen.path: (context) => ChatScreen(),
      },
    );
  }
}
