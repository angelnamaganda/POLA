import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {

    try{
       await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim());

        if(mounted){
          showDialog(
            context: context, 
            builder: (context) => const AlertDialog(
              content: Text("Password reset link is sent! Check your email"),
            ),);
        }

    } on FirebaseAuthException catch (e){
 
      return (e);

    /*showDialog(
      context: context, builder: (context) => AlertDialog(
          content: Text(e.message.toString()),
        ),
      );*/
  }
}

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text(''),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
        
              
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('FORGOT PASSWORD?',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.red,
                    fontWeight: FontWeight.bold
                  ),)),
              ),
        
              const SizedBox(
                height: 20,
              ),
            
              Container(
                width: size.width * 0.9,
                height: 280,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black
                  )
                ),
                child: Column(
                  children: [
        
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('Enter your email and we will send you a password reset link.',
                    style: TextStyle(
                      fontSize: 18
                    ),
                    textAlign: TextAlign.center,),
        
                    const SizedBox(
                      height: 40,
                    ),
                    
                     Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter email',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )
                      ),
                    ),
                  ),
        
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: passwordReset,
                    color: Colors.blue,
                    child: const Text('Reset Password',
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                    
                    ),
                  ],
                ),
              ),  

            ],
          ),
        ),
      ),
    );
  }
}