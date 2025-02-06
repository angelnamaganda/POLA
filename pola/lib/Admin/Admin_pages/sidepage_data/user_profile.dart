import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pola/Admin/displays/userwall.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("U S E R S",
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[100],

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: FirebaseFirestore.instance.collection('Users').get(), 
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  if (snapshot.hasError){
                    return Center(child: Text('Error: ${snapshot.error}'),);
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty){
                    return const Center(child: Text('No Users found'),);
                  }

                  //if data is available, display it in a ListView.

                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index){
                      var userData = snapshot.data!.docs[index].data() as Map<String, dynamic>;

                      //Access user data fields such as name, username, and address
                      String name = userData['fullname'] ?? '';
                      String username = userData['username'] ?? '';
                      String address = userData['address'] ?? '';
                      String phonenumber = userData['phonenumber'] ?? '';
                      String photourl = userData['photoUrl'] ?? '';

                      return UsersWall(
                        name: name, 
                        username: 
                        username, 
                        address: address,
                        phonenumber: phonenumber,
                        photourl: photourl,);
                    });
                })

            ],
          ),
        ),
        ),
    );
  }
}