// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pola/Admin/admin_drawer/profile.dart';
import 'package:pola/Admin/admin_drawer/settings.dart';


class SideBar extends StatelessWidget {

  SideBar({super.key, Key? sidebar });

  final currentUser = FirebaseAuth.instance.currentUser!;
  final userCollection = FirebaseFirestore.instance.collection("Users.");

  //sign user out
  void signUserOut (){

    FirebaseAuth.instance.signOut();
  }
  //edit field
  
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           UserAccountsDrawerHeader(
            accountEmail: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("Users").doc(currentUser.uid).snapshots(), 
              builder: (context, snapshot) {
                if(snapshot.hasData && snapshot.data != null){
                  final userData = snapshot.data!.data() as Map<String, dynamic>;

                  return Text(currentUser.email!,
                  style: const TextStyle(
                    fontSize: 15
                  ),);
                }
                return const CircularProgressIndicator();
              },
              ),
            accountName: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("Users").doc(currentUser.uid).snapshots(), 
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null){
                  final userData = snapshot.data!.data() as Map<String, dynamic>;
                  final userName = userData['fullname'];

                  return Text(userName);
                }
                return const CircularProgressIndicator();
              },), 
            currentAccountPicture: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("Users").doc(currentUser.uid).snapshots(), 
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null){
                  final userData = snapshot.data!.data() as Map<String, dynamic>;
                  final profilePictureUrl = userData ['photoUrl'];

                  return CircleAvatar(
                    radius: 50,
                    backgroundImage: profilePictureUrl != null
                    ? NetworkImage(profilePictureUrl)
                    : const AssetImage('assets/default_profile_pic.jpg') as ImageProvider<Object>?,
                  );
                }
                return const CircleAvatar(
                  radius: 50,
                );
              },)
          ),

          ListTile(
            leading: const Icon(Icons.person_2),
            title: const Text('User Profile'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AdminProfile(),));
            },
          ),
          
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AdminSettings()));
            }
              
            
          ),
         
          ListTile(
            onTap: signUserOut,
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Log Out'),
            
          )
        ],
      )

      );
}
}
      