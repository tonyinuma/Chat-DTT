import 'package:chat_dtt/src/widget/app_button.dart';
import 'package:chat_dtt/src/widget/app_icon.dart';
import 'package:chat_dtt/src/widget/app_textfield.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {

  static const String routeName = '/Signup';

  @override
  _SignupScreenState createState() => new _SignupScreenState();
 }
class _SignupScreenState extends State<SignupScreen> {
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
           SizedBox(height: 48.0,),
           AppTextField(inputText:"Ingrese sus Nombres"),
           SizedBox(height: 8.0,),
           AppTextField(inputText:"Ingrese correo"),
           SizedBox(height: 8.0,),
           AppTextField(inputText:"Ingrese Email"),
           SizedBox(height: 18.0,),
           AppButton(
             color: Colors.lightGreenAccent[400],
              name: "Signup",
              onPressed: (){}
           )
         ],
       ),
     ),
   );
  }
}
