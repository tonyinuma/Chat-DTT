import 'package:cloud_firestore/cloud_firestore.dart';

class MessageService{

  final _fireStore = Firestore.instance;

  void save({String collectionName, Map<String, dynamic> collectionValues}){
    _fireStore.collection(collectionName).add(collectionValues);
  }
  
}