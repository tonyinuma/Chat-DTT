import 'package:chat_dtt/src/widgets/app_button.dart';
import 'package:chat_dtt/src/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
 
  static const String routeName = '';

  @override
  _WelcomeScreenState createState() => new _WelcomeScreenState();
 }
class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppIcon(),
            SizedBox(height: 45.0,),
            AppButton(
              color: Colors.lightGreenAccent[400],
              name: "Log In",
              onPressed: (){Navigator.pushNamed(context, '/Login');}
            ),
            AppButton(
              color: Colors.lightGreenAccent[400],
              name: "Signup",
              onPressed: (){Navigator.pushNamed(context, '/Signup');}
            ),
          ],
        ),
      ),
    );
  }
}
