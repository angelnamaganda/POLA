
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pola/sidebar/about_us.dart';
import 'package:pola/sidebar/contact_support.dart';
import 'package:pola/sidebar/help_center.dart';
import 'package:pola/sidebar/settings.dart';
import 'package:pola/sidebar/user_profile.dart';


class EndDrawer extends StatefulWidget {
 const EndDrawer ({super.key});

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {


  final currentUser = FirebaseAuth.instance.currentUser!;
  final userCollection = FirebaseFirestore.instance.collection("Users");


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
              stream: FirebaseFirestore.instance.collection("Users").doc(currentUser.email).snapshots(), 
              builder: (context, snapshot) {
                if(snapshot.hasData && snapshot.data != null){
                  // ignore: unused_local_variable
                  final userData = snapshot.data!.data() as Map<String, dynamic>;

                  return Text(currentUser.email!);
                }
                return const CircularProgressIndicator();
              },
              ),

            accountName: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("Users").doc(currentUser.email).snapshots(), 
              builder: (context, snapshot) {
               if (snapshot.hasData && snapshot.data != null) {
                final userData = snapshot.data!.data() as Map<String, dynamic>;
                final userName = userData['fullname'];

                return Text(userName);
               }
               return const CircularProgressIndicator();
              },
              ),
            
            currentAccountPicture: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("Users").doc(currentUser.email).snapshots(), 
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null){
                  final userData = snapshot.data!.data() as Map<String, dynamic>;
                  final profilePictureUrl = userData['photoUrl'];

                  return CircleAvatar(
                    radius: 50,
                    backgroundImage: profilePictureUrl != null 
                    ? NetworkImage(profilePictureUrl)
                    : const AssetImage('assets/default_profile_pic.jpg') as ImageProvider<Object>?
                  );
                }
                return const CircleAvatar(radius: 50);
              },
              ),
             

            decoration: const BoxDecoration(
              color:Color.fromARGB(255, 41, 188, 221)
            ),
          ),
          
          ListTile (
            leading: const Icon(Icons.person),
            title: const Text(
              'User Profile'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Profile(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Sets(),)
              );
            },
          ),
         
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('About Us'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AboutUs(),));
            },
          ),
          
          ExpansionTile(
            leading: const Icon(Icons.help),
            title: const Text('Help'),
            children: [
              ListTile(
                title: const Text('Contact Support'),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ContactSupport(),));
                },
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                title: const Text('Help Center'),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HelpCenter(),));
                },
              )
            ],
          ),

          ListTile(
            onTap: signUserOut,
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Log Out'),
            

          )
        ]
     )
    );
  }     
}

