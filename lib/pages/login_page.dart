import 'package:flutter/material.dart';
import 'package:practice_login/pages/dashboard_page.dart';
import 'package:practice_login/routes.dart';

class LoginPage extends StatefulWidget{
  LoginPage({super.key});

  _LoginPageState createState()=> _LoginPageState();

}
class _LoginPageState extends State<LoginPage>{


  final _formKey= GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;
  String _email = "harshitpandey007@gmail.com";
  String _password ="Gp@123456";


  bool isValidEmailAndPassword(){
  return _emailController.text == _email && _passwordController.text == _password;
  }
  void _login(){
    if(_formKey.currentState!.validate() && isValidEmailAndPassword())
      {
        setState(() {
          _isLoading=true;
          _errorMessage= null;
        });

        Future.delayed(Duration(seconds: 2),(){
              Navigator.pushNamed(context,Routes.Dasboard);

        });
      }
    else{
      setState(() {
        _errorMessage="Email or Password is invalid";
      });
    }
  }
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
  return Scaffold(body:
  Center(
    child: Container(
        width: MediaQuery.of(context).size.width*0.4,
        alignment: Alignment.center,
        child:Form(
            key:_formKey,
            child :Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller:_emailController,
                  decoration: InputDecoration(labelText: "Email"),
                  validator:(value){
                    if(value==null || value.isEmpty){
                      return "Please enter the email";
                    }
                    if(!isEmailValid(value))
                    {
                      return "Please enter the valid email";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                  validator: (value){
                    if(value==null|| value.isEmpty)
                    {
                      return "Please enter the  password";
                    }
                    if(!isPasswordValid(value)){
                      return "Please enter the valid password";
                    }
                    return null;
                  },

                ),
                Container(margin: EdgeInsets.only(top:20),
                    child:   _isLoading?CircularProgressIndicator():
                    ElevatedButton(onPressed:_login, child: Text("Login")))
                ,
                _errorMessage!=null?
                Padding(
                    padding:EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                    child:Text(_errorMessage!,style:TextStyle(color: Colors.red))
                ):Text("")

              ],
            )
        )
    ),
  )
    ,);
  }
  bool isPasswordValid(String password){
    return RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$').hasMatch(password);

  }
  bool isEmailValid(String email){
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}

