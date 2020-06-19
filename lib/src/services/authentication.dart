import 'package:firebase_auth/firebase_auth.dart';

class Authentication{
  
  final _auth = FirebaseAuth.instance;

  Future<AuthResult> createUser({String email = "", String password =""}) async {
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      print(e);
    }
    return null;
  }

  Future<FirebaseUser> getCurrentUser() async {
    try{
      return await _auth.currentUser();
    }catch(e){
      print(e);
    }
    return null;
  }

  Future<AuthResult> loginUser({String email = "", String password =""}) async {
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      print(e);
    }
    return null;
  }
  
}
