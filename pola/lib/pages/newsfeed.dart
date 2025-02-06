import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pola/components/wall.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Newsfeeds'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[300],

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
                    children: [
                     StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("posts").where("username", isEqualTo: null)
                      .orderBy("TimeStamp", descending: true).snapshots(), 
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
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
                          var caption = post['caption'] ?? '';
                          var imageUrl = post['imageUrl'] ?? '';
                          var timeStamp = post['TimeStamp'];
                          var location = post['location'] ?? '';
                        
                          DateTime? dateTime;
      
                          if (timeStamp != null && timeStamp is Timestamp){
                            dateTime = timeStamp.toDate();
                          }
      
                        // Check if both caption and imageUrl are not empty or null
                        if (caption.isNotEmpty && imageUrl.isNotEmpty && dateTime != null && location.isNotEmpty) {
      
                          return UserWall(
                            caption: caption,
                            imageUrl: imageUrl,
                            timestamp: dateTime,
                            location: location,
                          );
                        } else {
                        // If any data is not ready, show CircularProgressIndicator
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                },
              ),
              ],
            ),
          ),
      ),
      );
  }
}

