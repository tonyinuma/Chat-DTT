import 'package:chat_dtt/src/widget/app_button.dart';
import 'package:chat_dtt/src/widget/app_icon.dart';
import 'package:chat_dtt/src/widget/app_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  static const String routeName = '/Login';

  @override
  _LoginScreenState createState() => new _LoginScreenState();
 }
class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppIcon(),
            SizedBox(height: 48.0,),
            AppTextField(inputText:"Ingrese correo"),
            SizedBox(height: 10.0,),
            AppTextField(inputText:"Ingrese contraseña"),
            AppButton(
              color: Colors.lightGreenAccent[400],
              name: "Log In",
              onPressed: (){}
            )

          ],
        ),
      ),
    );
  }
}
