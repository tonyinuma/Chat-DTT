import 'package:chat_dtt/src/services/authentication.dart';
import 'package:chat_dtt/src/services/message_service.dart';
import 'package:chat_dtt/src/widgets/chat_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  static const String routeName = '/Chat';

  @override
  _ChatScreenState createState() => new _ChatScreenState();
 }
class _ChatScreenState extends State<ChatScreen> {
 
  FirebaseUser loggedInUser;

  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    _getMessage();
  }
  void getCurrentUser() async{ 
      var user = await Authentication().getCurrentUser();
      if(user != null){
        loggedInUser = user;
        print(loggedInUser.email);
      } 
  }

  void _getMessage()async{
     await for(var snapshot in MessageService().getMessageStream()) {
      for (var message in snapshot.documents) {
        print(message.data);
      }
    }
  }

  InputDecoration _messageTextFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    hintText: 'Ingresar su mensaje Aquí',
    hintStyle: TextStyle(color: Colors.lightGreenAccent[100],),
    border: InputBorder.none,
  );

  BoxDecoration _messageContainerDecoration = BoxDecoration(
    border: Border(
      top: BorderSide(color: Colors.lightGreenAccent[400],)
    )
  );

  TextStyle _sendButtonStyle = TextStyle(
    color: Colors.lightGreenAccent[400],
    fontWeight: FontWeight.bold,
    fontSize: 18.0
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Chat Screen"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () async {
              Authentication().logoutUser();
              print("Session Cerrada");
              Navigator.pop(context);
            }
          )
        ],
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: MessageService().getMessageStream(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  var messages = snapshot.data.documents;
                  List<ChatItem> chatItems = [];
                  for (var message in messages) {
                    final messageValue = message.data["value"];
                    final messageSender = message.data["sender"];
                    chatItems.add(ChatItem(message: messageValue, sender: messageSender,));
                  }
                  return Flexible(
                    child: ListView(
                      children: chatItems,
                    )
                  );
                }
              }
            ),
            Container(
              decoration: _messageContainerDecoration,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: _messageTextFieldDecoration,
                      controller: _messageController,
                      style: TextStyle(color: Colors.white),
                    )
                  ),
                  FlatButton(
                    child: Text("Enviar", style: _sendButtonStyle,),
                    onPressed: () {
                      MessageService().save(
                        collectionName: "messages",
                        collectionValues: {
                          'value': _messageController.text,
                          'sender': loggedInUser.email
                        }
                      );
                    }, 
                  ) 
                ],
              )
            )
          ],
        )
      ),
    );
  }
}