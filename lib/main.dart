import 'package:chat_dtt/src/screens/chat_screen.dart';
import 'package:chat_dtt/src/screens/login_screen.dart';
import 'package:chat_dtt/src/screens/signup_screen.dart';
import 'package:chat_dtt/src/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: WelcomeScreen(),
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white)
        )
      ),
      initialRoute: WelcomeScreen.routeName,
      routes: <String, WidgetBuilder>{
        LoginScreen.routeName: (BuildContext context) => LoginScreen(),
        WelcomeScreen.routeName: (BuildContext context) => WelcomeScreen(),
        SignupScreen.routeName: (BuildContext context) => SignupScreen(),
        ChatScreen.routeName: (BuildContext context) => ChatScreen()
      }
    ),
  );
}

