import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {

  static const String routeName = '';

  @override
  _WelcomeScreenState createState() => new _WelcomeScreenState();
 }
class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {

    Widget getButton(Color color, String name, VoidCallback onPressed){
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(30.0),
          child: SizedBox(
            height: 43.0,
            child: FlatButton(
              child: Text(name),
              onPressed: onPressed,
            )
          ) 
        )
      );
    }

    return Scaffold(
      body: Container(
        color: Colors.black,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
                Image.asset('images/logo.png'),
                getButton(
                  Colors.lightGreenAccent[400],
                  "Log In",
                  (){Navigator.pushNamed(context, '/Login');}
                ),
                getButton(
                  Colors.lightGreenAccent[400],
                  "Sign In",
                  (){}
                )
          ],
        ),
      ),
    );
  }
}
