
// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pola/components/button.dart';
import 'package:pola/components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pola/register/sign_in.dart';

class SignUp extends StatefulWidget {

  final Function()? onTap;

  const SignUp ({super.key , required this.onTap});

  @override
  State<SignUp > createState() => _SignUpState();
}

class _SignUpState extends State<SignUp > {

  int currentStep = 0;

 //text editing controllers
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phonenumberController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  //to control whether the password is obscure or not
  bool _obscureText = true;

 
  //sign user in
  void signUserUp() async {

    //show loading circle

    showDialog(context: context, builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },);

    //try creating the user
   try{
    //check if password is confirmed
    if (passwordController.text == confirmpasswordController.text){

    //create the user
     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text,
      );

      // after creating the user, create a new document in clooud firestore
      FirebaseFirestore.instance.collection("Users").doc(userCredential.user!.email)
      .set({
        'username' : emailController.text.split('@')[0], //initial username
        'fullname' : nameController.text,
        'age' : ageController.text,
        'address' : addressController.text,
        'phonenumber' : phonenumberController.text
      });
      Navigator.pop(context);

      Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn(onTap: (){}),));
    }
    else {

    }
      //show error message
    showErrorMessage("Password don't match");
     Navigator.pop(context);
   
   }
   on FirebaseAuthException catch (e){
    Navigator.pop(context);

    //show error message
    showErrorMessage(e.code);
   } 
 
  }

 //show error message
 void showErrorMessage(String message){
  showDialog(context: context, builder: (context) {
   return AlertDialog(
    title: Text(message),);
  },);
 }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Center(
                  child: SvgPicture.asset('assets/polaLogo.svg',
                  width: 150,
                  height: 150,),
                ),

                const Center(
                  child: Text('Create your Account to Get Started',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),),
                ),

                const SizedBox(
                  height: 24,
                ),


                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Name",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  ),),

                  const SizedBox(
                    height: 8
                  ),

                  FieldTexts(
                    decoration: const InputDecoration(), 
                    controller: nameController, 
                    hintText: "Enter your Name"),

                  const SizedBox(
                    height: 8,
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Address",
                    style: TextStyle(
                      fontSize: 16
                    ),),),

                  const SizedBox(
                    height: 8
                  ),

                  FieldTexts(
                    decoration: const InputDecoration(), 
                    controller: addressController, 
                    hintText: "Enter your Address"),

                  const SizedBox(
                    height: 8,
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Contact Number",
                    style: TextStyle(
                      fontSize: 16
                    ),
                    ),
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  //contact number
                  ContactField(
                    numberController: phonenumberController),

                  const SizedBox(
                    height: 8,
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Email",
                    style: TextStyle(
                      fontSize: 16
                    ),),
                    ),

                  const SizedBox(
                    height: 8,
                  ),

                  FieldTexts(
                    decoration: const InputDecoration(), 
                    controller: emailController, 
                    hintText: "Enter your Email Address"),

                  const SizedBox(
                    height: 8,
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Password",
                    style: TextStyle(
                      fontSize: 16
                    ),),
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

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Confirm Password",
                    style: TextStyle(
                      fontSize: 16
                    ),)
                  ),

                  const SizedBox(
                    height: 8
                  ),

                   //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: confirmpasswordController,
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
                      hintText: 'Confirm your Password',
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
                    height: 32,
                  ),

                  Buttons(
                    onTap: signUserUp, 
                    text: "Register"),

                  const SizedBox(
                    height: 32,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const Text("Already have an account?",
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
                            return LogIn(onTap: (){});
                          },));
                        },
                        child: const Text("Log In",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF31B2D9),
                          fontWeight: FontWeight.bold
                        ),),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 100,
                  )

              ],
            )
              )
      )
    );

  }

}        
