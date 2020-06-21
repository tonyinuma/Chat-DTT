import 'package:flutter/material.dart';
class ErrorMessage extends StatelessWidget {

  final String errorMessage;

  ErrorMessage({this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: TextStyle(
        fontSize: 13.0,
        color: Colors.pinkAccent[400],
        height: 1.0,
        fontWeight: FontWeight.w400
      ),
    );
  }
}