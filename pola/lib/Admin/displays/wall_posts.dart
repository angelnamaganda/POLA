import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pola/Admin/displays/fullscreenpic.dart';

class WallPosts extends StatelessWidget {
  final String username;
  final String caption;
  final String imageUrl;
  final String postId;
  final DateTime timestamp;

  const WallPosts({
    Key? key,
    required this.username,
    required this.caption,
    required this.imageUrl,
    required this.postId,
    required this.timestamp,
  }) : super(key: key);

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/default_profile_pic.jpg'),
            ),
             
            const SizedBox(
              width: 10,
             ),

            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(username,
                  style: const TextStyle(
                    fontSize: 15,
                  ),),

                //date and time of posted data
                Text(formattedDate,
                style: const TextStyle(
                  fontSize: 12
                ),
              )

            ],
          ),
        ),
              
      ],
    ),
          const SizedBox(
            height: 8,
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(caption),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FullScreenImage(imageUrl: imageUrl),));
                },
                child: imageUrl.isNotEmpty
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ],
      ),
    );

    }
}

