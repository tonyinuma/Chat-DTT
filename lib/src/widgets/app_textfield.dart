import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {

  final String inputText;
  final bool obscureTextPass;
  final ValueChanged<String> onChanged;
  const AppTextField({this.inputText, this.onChanged,this.obscureTextPass});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        hintText: inputText,
        hintStyle: TextStyle(color: Colors.white54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)), 
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.lightGreenAccent[400],width: 1)
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.lightGreenAccent[400],width: 4)
        ),
      ),
      obscureText: obscureTextPass == null ?  false : obscureTextPass,
      onChanged: onChanged,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white
      ),
    );
  }
}

