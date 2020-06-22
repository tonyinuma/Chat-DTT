import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {

  final String sender;
  final String message;

  ChatItem({this.sender,this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(sender,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.lightGreenAccent[400]
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.lightGreenAccent[400],
            child:Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(message,
                style: TextStyle(
                fontSize: 16.0,
                color: Colors.black
                ),
              ),
            )
          )
          
        ],
      ),
    );
  }
}