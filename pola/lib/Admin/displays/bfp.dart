// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pola/Admin/displays/fullscreenpic.dart';

class BfpWall extends StatelessWidget {

  final String username;
  final String fireOperation;
  final String date;
  final String time;
  final String location;
  final String imageUrl;

  const BfpWall({super.key,

  required this.username,
  required this.fireOperation,
  required this.date,
  required this.time,
  required this.location,
  required this.imageUrl, 
  });

  

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

         
          Row(
            children: [

            FutureBuilder(
              future: FirebaseFirestore.instance.collection('Users').where('email', isEqualTo: email).get(), 
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

                // Assuming you want to get the first document in the query result
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

              Text(username)
            ],
          ),
          const SizedBox(
            height: 8,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('Operation: $fireOperation')),
                    
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('Date: $date')),
                    
                   
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('Time: $time')),
                     
          
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('Location: $location')),
                      
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
            ),
          )
          
        ],
       )
       );
          }
       
        }
       