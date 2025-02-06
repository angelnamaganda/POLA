
import 'package:flutter/material.dart';
import 'package:pola/Admin/displays/fullscreenpic.dart';

class SunogDisplay extends StatelessWidget {

  final String username;
  final String fireOperation;
  final String date;
  final String time;
  final String location;
  final String description;
  final String imageUrl;

  const SunogDisplay({super.key,

  required this.username,
  required this.fireOperation,
  required this.date,
  required this.time,
  required this.location,
  required this.description,
  required this.imageUrl, 
  });

  

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        children: [
          
          Row(
            children: [
             const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('assets/default_profile_pic.jpg'),
              ),

             const SizedBox(
              width: 8,
             ),

              Text(username,
              style: const TextStyle(
                fontSize: 16
              ),)
            ],
          ),

          const SizedBox(
            height: 16,
          ),
        
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text("Fire Operation: $fireOperation",
            style: const TextStyle(
              fontSize: 16
            ),),
          )
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text("Date: $date",
            style: const TextStyle(
              fontSize: 16
            ),),
          )
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text("Time: $time",
            style: const TextStyle(
              fontSize: 16
            ),),
          )
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text("Location: $location",
            style: const TextStyle(
              fontSize: 16
            ),),
          )
        ),
        

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text("Description: $description",
            style: const TextStyle(
              fontSize: 16
            ),),
          )
        ),
        
        const SizedBox(
          height: 8
        ),
          
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => FullScreenImage(imageUrl: imageUrl),));
            },
            child: imageUrl.isNotEmpty ? Image.network(imageUrl, 
            fit: BoxFit.cover,) : const SizedBox.shrink(),
          )

        ],
      ),
      
    );
  }
}
       