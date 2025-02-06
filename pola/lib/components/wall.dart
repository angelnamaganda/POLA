import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pola/components/fullscreen.dart';

class UserWall extends StatelessWidget {
 
  final String caption;
  final String imageUrl;
  final DateTime timestamp;
  final String location;

  const UserWall({super.key,
 
  required this.caption,
  required this.imageUrl,
  required this.timestamp,
  required this.location,
  });

  @override
  Widget build(BuildContext context) {


    String formattedDate = DateFormat('MM-dd-yyyy HH:mm').format(timestamp);

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),

      child: Column(
        children: [
          Column(
            children: [
             
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                 GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FullScreen(imageUrl: imageUrl),));
                  },
                  child: imageUrl.isNotEmpty 
                  ? Image.network(imageUrl,
                  fit: BoxFit.cover,) : const SizedBox.shrink(),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Location:",
                    style: TextStyle(
                      fontSize: 16
                    ),),

                    const SizedBox(
                      width: 8,
                    ),

                    Text(location,
                    style: const TextStyle(
                      fontSize: 16
                    ),)
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Date/Time:",
                    style: TextStyle(
                      fontSize: 16
                    ),),
                    
                    const SizedBox(
                      width: 8,
                    ),

                    Text(formattedDate,
                    style: const TextStyle(
                      fontSize: 16
                    ),),
                  ],
                ),
              
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(caption) ,
                ),
              
               
              ],
             ),

            ],
          ),

        ],
      ),
    );
  }
}