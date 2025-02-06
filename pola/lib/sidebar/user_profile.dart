import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pola/components/text_box.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  //user
  final FirebaseStorage storage = FirebaseStorage.instance;
  final currentUser = FirebaseAuth.instance.currentUser!;
  final userCollection = FirebaseFirestore.instance.collection("Users");


  //profile picture
  Future _profilePicture () async {
    final profilePic = await ImagePicker().pickImage(source: ImageSource.gallery);

   if(profilePic != null) {
    await uploadProfilePicture(profilePic.path);
   }    
  }

  Future<void> uploadProfilePicture(String filePath) async {

    Reference storageReference = FirebaseStorage.instance.ref()
    .child('profile_pictures/${currentUser.uid}.jpg');
    UploadTask uploadTask = storageReference.putFile(File(filePath));

    await uploadTask.whenComplete(() async{
      //update user profile with the new image
      String downloadURL = await storageReference.getDownloadURL();
      await currentUser.updatePhotoURL(downloadURL);

      //update firestore document with the new photoUrl
      await userCollection.doc(currentUser.email).update({'photoUrl' : downloadURL});
    });
  }

  //edit field
  Future<void> editField (String field) async{
    String newValue = "";
    await showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text("Edit $field",
        style: const TextStyle(
          color: Colors.white,
        ) ,),
        content: TextField(
          autofocus: true,
          style: const TextStyle(
            color: Colors.white
          ),
          decoration: InputDecoration(
            hintText: 'Enter new $field',
            hintStyle: const TextStyle(color: Colors.grey)
          ),
          onChanged: (value) {
            newValue = value;
          }         
          ),

          actions: [
            //cancel button
              TextButton(
                onPressed: () => Navigator.pop(context), 
                child: const Text('Cancel', style: TextStyle(color: Colors.white),),
                ),
            //save button
            TextButton(
                onPressed: () => Navigator.pop(context), 
                child: const Text('Save', style: TextStyle(color: Colors.white),),
                ),
          ],
        ),
      
      );

      //update in firestore
      if (newValue.trim().isNotEmpty) {
        await userCollection.doc(currentUser.email).update({field: newValue});
      }
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,

      body: StreamBuilder<DocumentSnapshot>(

        stream: FirebaseFirestore.instance.collection("Users").doc(currentUser.email).snapshots(),
        builder: (context, snapshot) {

          if(snapshot.hasData && snapshot.data != null) {
            final userData = snapshot.data!.data() as Map <String, dynamic>;
            String fullname = userData['fullname'] ?? '';

          return SingleChildScrollView(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            children: [
             
              Stack(
                children:[
                  Container(
                    width: size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      )
                    ),
                    child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20, bottom: 10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: _profilePicture,
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage: currentUser.photoURL != null 
                              ? NetworkImage(currentUser.photoURL!)
                              : const AssetImage('assets/default_profile_pic.jpg') as ImageProvider<Object>?,
                            ),
                          ),
                        ),
          
                         //user name
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(fullname,
                            style: const TextStyle(
                            fontSize: 18
                          ),),
                          ),
                       ),
            
                      //user email
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              currentUser.email!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black
                            ),
                          ),
                        ),
                      ),
                      ],
                    ),
                                ),
                  ),
                
                ] 
              ),
          
          
            const SizedBox(
              height: 20,
            ),
                   
            //user details
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text('My Details',
              style: TextStyle(
                fontSize: 18
              ),),
            ),
          
            const SizedBox(
              height: 15,
            ),
            //username
            MyTextBox(
              onPressed:() => editField ('username'), 
              text: userData['username'] ?? '', 
              sectionName: 'Username'),
          
            //name of the user
            const SizedBox(
              height: 15,
            ),
            
            MyTextBox(
              text: userData['fullname'] ?? '', 
              sectionName: 'Name', 
              onPressed: () => editField('fullname')
            ),
          
            const SizedBox(
              height: 15
            ),
          
            MyTextBox(
              text: userData['age'], 
              sectionName: "Age", 
              onPressed: () => editField('age'),
            ),
          
            const SizedBox(
              height: 15,
            ),
          
            MyTextBox(
              text: userData['address'] ?? '', 
              sectionName: 'Address', 
              onPressed: () => editField('address'),
            ),
          
            const SizedBox(
              height: 15,
            ),
          
            MyTextBox(
              text: userData['phonenumber'], 
              sectionName: 'Phone Number', 
              onPressed: () => editField('phonenumber')),


            const SizedBox(
              height: 15,
            ),
          
                  ],
                ),
          );

          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error${snapshot.error}'),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );

        })
    );
  }
}