import 'package:flutter/material.dart';
import 'package:my_project/auth_page/1_login_page/login_screen.dart';

import '../1_registeration_page/registeration_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage=true;

  void toggleScreen(){
    setState(() {
      showLoginPage =!showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginScreen(showRegisterPage: toggleScreen);
    }else{
      return RegisterationScreen(showLoginPage:toggleScreen);
    }
  }
}
