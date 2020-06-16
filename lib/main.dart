import 'package:chat_dtt/screens/login_screen.dart';
import 'package:chat_dtt/screens/welcome_screen.dart';
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
        WelcomeScreen.routeName: (BuildContext context) => WelcomeScreen()
      }
    ),
  );
}

