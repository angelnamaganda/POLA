// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:pola/Admin/displays/mdrrmo.dart';
import 'package:logger/logger.dart';

class MdrrmoReport extends StatefulWidget {
  const MdrrmoReport({super.key});

  @override
  State<MdrrmoReport> createState() => _MdrrmoReportState();
}

class _MdrrmoReportState extends State<MdrrmoReport> {

  final logger = Logger();

  Future<void> sendNotificationToAdmin(String username) async{
    final FirebaseMessaging message = FirebaseMessaging.instance;

    try{
    final message = {
      "notification":{
      "title" : "New Incident Report",
      "body": "A new incident report has been submitted by $username."
      },
      "data" : {
        "type" : "incident_report",
    },
    "topic" : "received_reports"
    };
    }
    catch (e) {
      logger.e("Error sending notification: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, 
        title: const Text('Report Summary'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[300],

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
             StreamBuilder(
                stream: FirebaseFirestore.instance.collection('mdrrmo_reports').where("username", isEqualTo: null)
                .orderBy("TimeStamp", descending: true).snapshots(),
                builder: (context, snapshot) {
                  
                  if (snapshot.connectionState == ConnectionState.waiting){
              
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  else if(snapshot.hasError){
                    return Text('Error: ${snapshot.error}');
                  }
                  else if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
                    return const Center(
                      child: Text('No incident report found.',
                      style: TextStyle(
                        fontSize: 20
                      ),));
                  }
              
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = snapshot.data!.docs[index];
                      Map<String, dynamic> data = document.data() as Map<String, dynamic>;

                    sendNotificationToAdmin(data['username']);
              
                   return MdrrmoWall(
                        username: data['username'],
                        incident: data ['incident'],
                        date: data ['date'], 
                        time: data ['time'], 
                        location: data ['location'], 
                        imageUrl: data['imageUrl'], 
                      );
                        

                    },);
                },)


            ],
          ),
        ),
      ),
      
    );
  }
}