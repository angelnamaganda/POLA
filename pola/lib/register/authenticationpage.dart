//this is the page where the account role is identified. 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pola/Admin/Admin_pages/home.dart';
import 'package:pola/pages/homepage.dart';
import 'package:pola/register/login_or_register.dart';

class Authentication extends StatelessWidget {
  Authentication({super.key});

  final FirebaseFirestore firestore = FirebaseFirestore.instance;//initiates the database

 Future<String?> getRole(String uid) async{

    try{
      final snapshot = await FirebaseFirestore.instance.collection("Users").doc(uid).get();

      if (snapshot.exists){
        return snapshot.get('role').toString();
      }
      else {
        return ('This user does not exist');
      }
    }
    catch (e){
      return null;
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.hasError){
            return const Center(child: Text('Something went wrong!'),);
          }
          else if (snapshot.hasData){

            final user = snapshot.data!;

            return FutureBuilder<String?>(
              future: getRole(user.uid), 
              builder: (context, snapshot) {
                
                if (snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(),);
                }
                else if (snapshot.hasError){
                  return const Center(child: Text('Something Went Wrong!'),);
                }
                else {
                  final String? role = snapshot.data;

                  if (role == 'admin'){
                    return const AdminHomePage();
                  } 
                  else if (role != 'admin'){
                    return const HomePage();
                  }
                  else{
                    return const LogInOrRegister();
                  }
                }
              }

          );
          }
            else {
              return const LogInOrRegister();
            }
        }
        ),  
    );
  }
}