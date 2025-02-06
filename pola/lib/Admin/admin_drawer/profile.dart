import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pola/Admin/admin_components/textbox.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({super.key});

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {

  //user
  final FirebaseStorage storage = FirebaseStorage.instance;
  final currentUser = FirebaseAuth.instance.currentUser!;
  final usercollection = FirebaseFirestore.instance.collection("Users.");

  //profile picture
  Future _profilePicture () async{
    final profilePic = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(profilePic != null){
      await uploadProfilePicture(profilePic.path);
    }
  }

  Future<void> uploadProfilePicture(String filePath) async {

    Reference storageReference = FirebaseStorage.instance.ref()
    .child('profile_pictures/${currentUser.uid}.jpg');

    UploadTask uploadTask = storageReference.putFile(File(filePath));

    await uploadTask.whenComplete(() async {
      //update user profile with the new image
      String downloadURL = await storageReference.getDownloadURL();
      await currentUser.updatePhotoURL(downloadURL);

      //update firestore document with the new photoUrl
      await usercollection.doc(currentUser.uid).update({'photoUrl' : downloadURL});
    });
  }

  //edit field
  Future<void> editField (String field) async {
    String newValue = "";
    await showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text("Edit $field",
        style: const TextStyle(
          color: Colors.white,
        ),),
        content: TextField(
          autofocus: true,
          style: const TextStyle(
            color: Colors.white
            ),
            decoration: InputDecoration(
              hintText: 'Enter new $field',
              hintStyle: const TextStyle(
                color: Colors.grey
              ),
            ),
            onChanged: (value) {
              newValue = value;
            },
        ),

        actions: [
          //cancel button
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: const Text('Cancel',
            style: TextStyle(
              color: Colors.white,
            ),
            ),
            ),
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: const Text('Save',
            style: TextStyle(
              color: Colors.white
            ),),
            ),
        ],

      ),
      );

      // update in firestore

        if (newValue.trim().isNotEmpty){
        await usercollection.doc(currentUser.uid).update({field: newValue});
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('Users').doc(currentUser.uid).snapshots(), 
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null){
            final userData = snapshot.data!.data() as Map <String, dynamic>?;
            String fullname = userData?['fullname'] ?? '';

            return ListView(
              children: [ 
                //profile picture
                Stack(
                  children: [
                    Padding(padding: const EdgeInsets.only(top: 20, left: 20, bottom: 10),
                    child: Align(
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
                    ),
                  ],
                ),

                //username
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(fullname,
                  style: const TextStyle(
                    fontSize: 18
                  ),
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
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                const Divider(
                  thickness: 1.0,
                ),

                const SizedBox(
                  height: 25,
                ),

                //user details
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text('My Details'),),

                const SizedBox(
                  height: 15,
                ),

                //username
                MyTextBox(
                  text: userData ? ['username'] ?? '',
                   sectionName: 'Userame',
                  onPressed: () => editField('username'),),

                //Name of the user
                const SizedBox(
                  height: 15,
                ),
                
                MyTextBox(
                  text: userData ? ['fullname'] ?? '', 
                  sectionName: 'Name', 
                  onPressed: () => editField('fullname')),

                const SizedBox(
                  height: 15,
                ),

                MyTextBox(
                  text: userData ? ['address'] ?? '', 
                  sectionName: 'Address', 
                  onPressed: () => editField('address')),
              
              ],
            );
          }
          else if (snapshot.hasError){
            return Center(
              child: Text('Error${snapshot.error}'),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },)
        );

    
      }
    
  }