import 'package:chat_dtt/src/models/auth_request.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication{
  
  final _auth = FirebaseAuth.instance;

  Future<AuthenticationRequest> createUser({String email = "", String password =""}) async {

    AuthenticationRequest authRequest = AuthenticationRequest();

    try{
      var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (user != null) {
        authRequest.sucess = true;
      }
    }catch(e){
      _mapErrorMessage(authRequest, e.code);
    }
    return authRequest;
  }

  Future<FirebaseUser> getCurrentUser() async {
    try{
      return await _auth.currentUser();
    }catch(e){
      print(e);
    }
    return null;
  }

  Future<AuthenticationRequest> loginUser({String email = "", String password =""}) async {

    AuthenticationRequest authRequest = AuthenticationRequest();

    try{
      var user = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (user != null) {
        authRequest.sucess = true;
      }
    }catch(e){
      _mapErrorMessage(authRequest, e.code);
    }
    return authRequest;
  }

  Future<void> logoutUser() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e);
    }
    return null;
  }

  void _mapErrorMessage(AuthenticationRequest authRequest, String code){
    switch (code) {
      case "ERROR_INVALID_EMAIL":
        authRequest.errorMessage = "Su dirección de correo electrónico parece estar mal formada.";
        break;
      case "ERROR_WRONG_PASSWORD":
        authRequest.errorMessage = "Contraseña incorrecta";
        break;
      case "ERROR_USER_NOT_FOUND":
        authRequest.errorMessage = "No existe usuario con este correo";
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        authRequest.errorMessage = "El usuario ya está registrado";
        break;
      case "ERROR_USER_DISABLED":
        authRequest.errorMessage = "El usuario con este correo fue deshabilitado";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        authRequest.errorMessage = "Demasiadas solicitudes Intenta nuevamente más tarde.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        authRequest.errorMessage = "Iniciar sesión con correo electrónico y contraseña no está habilitado.";
        break;
      case "ERROR_NETWORK_REQUEST_FAILED":
        authRequest.errorMessage = "Error de Red";
        break;
      default:
        authRequest.errorMessage = code;
    }
  }
  
}
