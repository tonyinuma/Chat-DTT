import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {

  final String sender;
  final String message;
  final bool isLoggedInUser;

  ChatItem({this.sender,this.message,this.isLoggedInUser});

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
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)
            ),
            elevation: 5.0,
            color: isLoggedInUser ? Colors.lightGreenAccent[400] : Colors.pinkAccent,
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