import 'package:chat_dtt/src/mixins/validation_mixins.dart';
import 'package:chat_dtt/src/services/authentication.dart';
import 'package:chat_dtt/src/widgets/app_button.dart';
import 'package:chat_dtt/src/widgets/app_icon.dart';
import 'package:chat_dtt/src/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {

  static const String routeName = '/Login';

  @override
  _LoginScreenState createState() => new _LoginScreenState();
 }
class _LoginScreenState extends State<LoginScreen> with ValidationMixins{

  bool showSpinner = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController;
  TextEditingController _passwordController;

  FocusNode _focusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode = FocusNode();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void setSpinnerStatus(bool status){
    setState(() {
      showSpinner = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        color: Colors.lightGreenAccent[400],
        inAsyncCall: showSpinner,
        child: Form(
          key: _formKey,
          child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AppIcon(),
                SizedBox(height: 48.0,),
                _emailField(),
                SizedBox(height: 10.0,),
                _passwordField(),
                _submitButton()
              ],
            ),
          ),
        )
      )
    );
  }

  Widget _emailField(){
    return AppTextField(
      validator: validateEmail,
      inputText:"Ingrese correo",
      onChanged: (value) { },
      controller: _emailController,
      focusNode: _focusNode
    );        
  }

  Widget _passwordField(){
    return AppTextField(
      validator: validatePassword,
      inputText:"Ingrese contraseña",
      onChanged: (value) { },
      obscureTextPass: true,
      controller: _passwordController,
    );
  }
  Widget _submitButton(){
    return AppButton(
      color: Colors.lightGreenAccent[400],
      name: "Log In",
      onPressed:() async { 

        if(_formKey.currentState.validate()){
          setSpinnerStatus(true);
          var user = await Authentication().loginUser(email: _emailController.text, 
                                                      password: _passwordController.text);
          if(user != null){
            Navigator.pushNamed(context, '/Chat');
            _emailController.text = "";
            _passwordController.text = "";
            FocusScope.of(context).requestFocus(_focusNode);
            setSpinnerStatus(false);
          } 
        }

        

      }
    );
  }

}
