
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pola/Admin/displays/wall_posts.dart';

class AdminWall extends StatefulWidget {

  const AdminWall({super.key,});

  @override
  State<AdminWall> createState() => _AdminWallState();
}

class _AdminWallState extends State<AdminWall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Newsfeed'),
        centerTitle: true,

      ),
      backgroundColor: Colors.grey[300],

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //the wall
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection("posts").where("username", isEqualTo: null)
                .orderBy("TimeStamp", descending: true).snapshots(), 
                builder: (context, snapshot) {
                  
                  if (!snapshot.hasData){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  var posts = snapshot.data!.docs;

                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: posts.length,
                    itemBuilder: (context, index) {

                      var post = posts[index].data();
                      var username = post ['username'] ?? '';
                      var caption =  post ['caption'] ?? '';
                      var imageUrl = post ['imageUrl'] ?? '';
                      var postId =  '';
                      var timeStamp =  post['TimeStamp'];

                      DateTime? dateTime;

                      if (timeStamp != null && timeStamp is Timestamp){
                        dateTime = timeStamp.toDate();

                        return WallPosts(
                          username: username, 
                          caption: caption, 
                          imageUrl: imageUrl, 
                          postId: postId, 
                          timestamp: dateTime,
                          );
                      }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                    },);
                },)
            ]
          ),
        ),
      )
    );
  }
}