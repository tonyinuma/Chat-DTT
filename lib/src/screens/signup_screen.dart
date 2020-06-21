import 'package:chat_dtt/src/mixins/validation_mixins.dart';
import 'package:chat_dtt/src/services/authentication.dart';
import 'package:chat_dtt/src/widgets/app_button.dart';
import 'package:chat_dtt/src/widgets/app_icon.dart';
import 'package:chat_dtt/src/widgets/app_textfield.dart';
import 'package:chat_dtt/src/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignupScreen extends StatefulWidget {

  static const String routeName = '/Signup';

  @override
  _SignupScreenState createState() => new _SignupScreenState();
 }
class _SignupScreenState extends State<SignupScreen> with ValidationMixins{

  bool _autoValidate = false;
  bool showSpinner = false;
  String _errorMessage = "";
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
          child:  Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AppIcon(),
                SizedBox(height: 48.0,),
                _emailField(),
                SizedBox(height: 8.0,),
                _passwordField(),
                SizedBox(height: 18.0,),
                _showErrorMessage(),
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
      autoValidate: _autoValidate,
      validator: validateEmail,
      inputText:"Ingrese correo",
      onChanged: (value) {},
      controller: _emailController,
      focusNode: _focusNode
    );        
  }

  Widget _passwordField(){
    return AppTextField(
      autoValidate: _autoValidate,
      validator: validatePassword,
      inputText:"Ingrese contraseña",
      onChanged: (value) {},
      controller: _passwordController,
      obscureTextPass: true,
    );        
  }

  Widget _submitButton(){
    return AppButton(
      color: Colors.lightGreenAccent[400],
      name: "Signup",
      onPressed: () async { 
        if(_formKey.currentState.validate()){
          setSpinnerStatus(true);
          var auth = await Authentication().createUser(email: _emailController.text, 
                                                          password: _passwordController.text);
          if(auth.sucess){
            Navigator.pushNamed(context, '/Chat');
            _emailController.text = "";
            _passwordController.text = "";
            FocusScope.of(context).requestFocus(_focusNode);
           }else{
            setState(()=> _errorMessage = auth.errorMessage);
          }
          setSpinnerStatus(false);

        }else{
          setState(() => _autoValidate = true );
        }
      }
    );
  }

   Widget _showErrorMessage(){
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return ErrorMessage(errorMessage: _errorMessage,);
    }else{
      return Container(height: 0.0,);
    }
  }
}
