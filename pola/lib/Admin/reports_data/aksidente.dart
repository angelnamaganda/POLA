import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pola/Admin/report_display/aksidente_display.dart';

class Aksidente extends StatefulWidget {
  const Aksidente({super.key});

  @override
  State<Aksidente> createState() => _AksidenteState();
}

class _AksidenteState extends State<Aksidente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Accident Reports"),
        backgroundColor: const Color(0xFF31B2D9),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('accident_reports').where('username', isEqualTo: null)
          .orderBy("TimeStamp", descending: true).snapshots(), 
          builder: (context, snapshot) {
            //error handling
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(snapshot.hasError){
              return Text('Error: ${snapshot.error}');
            }
            else if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/ambulance.svg'),
                    const SizedBox(height: 16),
                    const Text('No Accident Reports'),
                  ],
                ),
              );
            }

            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = snapshot.data!.docs[index];
                Map<String, dynamic>? data = document.data() as Map<String, dynamic>;

                return AksidenteDisplay(
                  username: data['username'], 
                  date: data['date'], 
                  time: data['time'], 
                  location: data['location'],
                  description: data['description'], 
                  imageUrl: data['imageUrl'],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
