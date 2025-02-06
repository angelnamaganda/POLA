import 'package:flutter/material.dart';
import 'package:pola/register/sign_in.dart';
import 'package:pola/register/sign_up.dart';


class LogInOrRegister extends StatefulWidget {
  const LogInOrRegister({super.key});

  @override
  State<LogInOrRegister> createState() => _LogInOrRegisterState();
}

class _LogInOrRegisterState extends State<LogInOrRegister> {

  //initially show the login page

  bool showLoginPage = true;

  //toggle between the login and register page
  void togglePage(){
    setState(() {
      showLoginPage  = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LogIn(
        onTap: togglePage);
    }
    else {
      return SignUp(
        onTap: togglePage,);
    }
  }
}