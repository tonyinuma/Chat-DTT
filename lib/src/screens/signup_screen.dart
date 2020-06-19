import 'package:chat_dtt/src/widget/app_button.dart';
import 'package:chat_dtt/src/widget/app_icon.dart';
import 'package:chat_dtt/src/widget/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {

  static const String routeName = '/Signup';

  @override
  _SignupScreenState createState() => new _SignupScreenState();
 }
class _SignupScreenState extends State<SignupScreen> {

  final auth = FirebaseAuth.instance;

  String _nombres;
  String _email;
  String _password;

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
            AppTextField(
              inputText:"Ingrese sus Nombres",
              onChanged: (value) { 
              _nombres = value; 
              print("nombres : $_nombres"); 
             },
            ),
            SizedBox(height: 8.0,),
            AppTextField(
              inputText:"Ingrese correo",
              onChanged: (value) { 
                _email = value;
                print("email : $_email"); 
              },
            ),
            SizedBox(height: 8.0,),
            AppTextField(
              inputText:"Ingrese Password",
              onChanged: (value) {
                _password = value; 
                print("passw : $_password");
              },
              obscureTextPass: true,
            ),
           SizedBox(height: 18.0,),
           AppButton(
             color: Colors.lightGreenAccent[400],
              name: "Signup",
              onPressed: () async {
                try{
                  var newUser = await auth.createUserWithEmailAndPassword(email: _email, password: _password);
                  if(newUser != null){
                    Navigator.pushNamed(context, '/Chat');
                  }
                }catch(e){
                  print(e);
                }
              }
           )
         ],
       ),
     ),
   );
  }
}
