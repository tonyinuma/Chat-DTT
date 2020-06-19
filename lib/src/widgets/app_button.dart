import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {

  final Color color;
  final VoidCallback onPressed;
  final String name;

  const AppButton({this.color,this.onPressed,this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Material(
              color: color,
              borderRadius: BorderRadius.circular(30.0),
              child: SizedBox(
                height: 43.0,
                child: FlatButton(
                  onPressed: onPressed,
                  child: Text(name, style: TextStyle(color: Colors.white),),
                )
              ) 
            )
          );
  }
}