import 'package:flutter/material.dart';
import 'package:pola/Admin/displays/fullscreenpic.dart';

class UsersWall extends StatelessWidget {

  final String name;
  final String username;
  final String address;
  final String phonenumber;
  final String photourl;

  const UsersWall({super.key,
  required this.name,
  required this.username,
  required this.address,
  required this.phonenumber,
  required this.photourl
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.only(top: 10,),
      padding: const EdgeInsets.all(10),

      decoration: const BoxDecoration(
        color: Colors.white,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text("Name: $name"),
                ),
              )
            ],
          ),

          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text("Username: $username"),),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text('Address: $address'),),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text('Phone Number: $phonenumber'),),
          ),

          const SizedBox(
            height: 10,
          ),

          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => FullScreenImage(imageUrl: photourl),));
            },
            child: photourl.isNotEmpty ? Image.network(photourl,
              fit: BoxFit.cover,
            )
              : const SizedBox.shrink(),
            ),

        ],
      ),
    );
  }
}