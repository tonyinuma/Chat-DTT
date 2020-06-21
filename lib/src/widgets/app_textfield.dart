import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {

  final String inputText;
  final bool obscureTextPass;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FormFieldValidator<String> validator;
  final bool autoValidate;

  const AppTextField({this.inputText,this.onChanged,this.obscureTextPass,this.controller,this.focusNode,
                      this.validator,this.autoValidate});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidate: autoValidate,
      validator: validator,
      focusNode: focusNode,
      controller: controller,
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

