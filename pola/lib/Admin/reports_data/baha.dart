import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pola/Admin/report_display/baha_display.dart';

class Baha extends StatefulWidget {
  const Baha({super.key});

  @override
  State<Baha> createState() => _BahaState();
}

class _BahaState extends State<Baha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flood Reports"),
        backgroundColor: const Color(0xFF31B2D9),
        foregroundColor: Colors.white,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child:  StreamBuilder(
                stream: FirebaseFirestore.instance.collection('flood_reports').where('username', isEqualTo: null)
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
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.flood_outlined,
                          size: 64),
                          SizedBox(height: 16),
                          Text('No Flood Reports'),
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

                  return BahaDisplay(
                    username: data ['username'], 
                    date: data ['date'], 
                    time: data ['time'], 
                    location: data ['location'],
                    description: data ['description'], 
                    imageUrl: data ['imageUrl']);
                    });
                }),


        )
      ),
    );
  }
}