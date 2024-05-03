import 'package:flutter/material.dart';
import 'package:shop/auth/page/login.dart';
import 'package:shop/auth/page/registerPage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool shoeLoginPage = true;
  void toggleScreen(){
    setState(() {
      shoeLoginPage = !shoeLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(shoeLoginPage){
      return LoginPage(showRegisterPage: toggleScreen);
    }else{
      return RegisterPage(showLoginPage: toggleScreen);
    }
  }
}