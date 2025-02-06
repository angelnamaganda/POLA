
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pola/components/button.dart';
import 'package:pola/register/authenticationpage.dart';
import 'package:pola/register/forgot_pass.dart';
import 'package:pola/components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pola/register/sign_up.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LogIn extends StatefulWidget {

  final Function()? onTap;

  const LogIn({super.key , required this.onTap});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

 //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //to control whether the password is obscure or not
  bool _obscureText = true;

  //sign user in
  void signUserIn() async {

    //show loading circle

    showDialog(context: context, builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },);

    //try sign in
   try{
     await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text
      );
   
     Navigator.pop(context);
     Navigator.push(context, MaterialPageRoute(builder: (context) => Authentication(),));
   
   }
   on FirebaseAuthException catch (e){
    showErrorMessage(e.code);

    Navigator.pop(context);

   }
 
  }

 // error message to user
 void showErrorMessage(String message){
  showDialog(context: context, builder: (context) {
   return AlertDialog(
    title: Text(message),);
  },);

 }


  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(

      backgroundColor: Colors.grey[100],

      body: SafeArea(
        child: SingleChildScrollView(
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

             Center(
               child: SvgPicture.asset('assets/polaLogo.svg',
                  width: 150,
                  height: 150,
                  ),
             ),
              

             const Center(
                child: Text(
                  'Sign In to Resume Your Experience',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold 
                  ),
                ),
              ),

              const SizedBox(
                height: 32,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Email',
                style: TextStyle(
                fontSize: 16,
              ),

              ),),

              const SizedBox(
                height: 8,
              ),

              FieldTexts(
                decoration: const InputDecoration(), 
                controller: emailController, 
                hintText: 'Enter your Email Address', 
              ),

              const SizedBox(
                height: 8,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Password',
                style: TextStyle(
                  fontSize: 16
                ),
                ),
              ),

              const SizedBox(
                height: 8,
              ),

             //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF31B2D9)),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF31B2D9)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Enter your Password',
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        }, 
                        icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility,))
                    ),
                  ),
                ),
                
              const SizedBox(
                height: 8,
              ),
              //forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return const ForgotPassword();
                        },));
                      },
                      child: const Text('Forgot Password?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                    )
                  ],
                ),),

                const SizedBox(
                  height: 32,
                ),

                Buttons(
                  onTap: signUserIn, 
                  text: 'Sign In'),

                const SizedBox(
                  height: 32,
                ),

                const Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1.5,
                      color: Colors.black,
                      indent: 16,
                      endIndent: 8,
                    ),
                  ),
                  Text(
                    "or",
                    style: TextStyle(fontSize: 16),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1.5,
                      color: Colors.black,
                      indent: 8,
                      endIndent: 16,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 24,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  GestureDetector(
                    onTap: (){},
                    child: SvgPicture.asset('assets/google.svg',
                    width: 42,
                    height: 42,),
                  ),

                  const SizedBox(
                    width: 24,
                  ),

                  GestureDetector(
                    onTap: (){},
                    child: SvgPicture.asset('assets/facebook.svg',
                    width: 48,
                    height: 48,),
                  )

                ],
              ),

              const SizedBox(
                height: 32,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),),

                  const SizedBox(
                    width: 8,
                  ),

                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return SignUp(onTap: (){});
                      },));
                    },
                    child: const Text("Register Now",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF31B2D9)
                    ),),
                  )
                ],
              )

            ],
          ),
        ),
      ),  
      );
  }
}