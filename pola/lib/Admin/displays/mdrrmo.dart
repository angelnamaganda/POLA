// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pola/Admin/displays/fullscreenpic.dart';
import 'package:logger/logger.dart';

class MdrrmoWall extends StatelessWidget {

  final logger = Logger();

  final String username;
  final String incident;
  final String date;
  final String time;
  final String location;
  final String imageUrl;

  MdrrmoWall({super.key,
  required this.username,
  required this.incident,
  required this.date,
  required this.time,
  required this.location,
  required this.imageUrl,
  });

 Future<String?> userProfilePictureUrl(String username) async{

    try{
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('Users.').doc(username).get();

      //ensure the document exists and contains the 'photourl' field
      if(userSnapshot.exists && userSnapshot.data() != null){
        final user = userSnapshot.data()! as Map<String, dynamic>;
      }
    }
    catch (e){
      logger.e("Error fetching profile picture: $e");
    }
    return null;
  }
  
  @override
  Widget build(BuildContext context) {

    String? email;

    return Container(

       margin: const EdgeInsets.only(top: 10),
       padding: const EdgeInsets.all(10),

       decoration: const BoxDecoration(
        color: Colors.white,
       ),

       child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
               FutureBuilder(
              future: FirebaseFirestore.instance.collection('Users.').where('email', isEqualTo: email).get(), 
              builder: (context, snapshot) {

                if(snapshot.hasError){
                  return Text('Error: ${snapshot.error}');
                }

                // Check if the document exists
                if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
                return const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/default_profile_pic.jpg'),
                );
    }

                var document = snapshot.data!.docs.last;

                // Check if the field 'photoUrl' exists in the document
                String? photoUrl = document.get('photoUrl') as String?;

               // Use a default photo if 'photoUrl' is null or empty
              if(photoUrl == null || photoUrl.isEmpty){
                return const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/default_profile_pic.jpg'),
                );
              }

    return CircleAvatar(
      radius: 25,
      backgroundImage: NetworkImage(photoUrl),
    );
  },
),

              const SizedBox(
                width: 10,
              ),

              Text(username),
            ],
          ),
          const SizedBox(
            height: 8,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Incident: $incident')),

                  const SizedBox(
                    height: 10,
                  ),
                   
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Date: $date'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Time: $time'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Location: $location'),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FullScreenImage(imageUrl: imageUrl),));
                    },
                    child: imageUrl.isNotEmpty ? Image.network(imageUrl,
                    fit: BoxFit.cover,
                    )
                    : const SizedBox.shrink(),
                  ),
                
            ],
          )
          
        ],
       )
       );
          }
        }
