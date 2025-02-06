import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pola/Admin/report_display/sunog_display.dart';

class Sunog extends StatefulWidget {
  const Sunog({super.key});

  @override
  State<Sunog> createState() => _SunogState();
}

class _SunogState extends State<Sunog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Fire Reports"),
        backgroundColor: const Color(0xFF31B2D9),
        foregroundColor: Colors.white,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              children: [
        
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('fire_reports').where('username', isEqualTo: null)
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
                            Icon(Icons.fire_truck_outlined),
                            SizedBox(height: 16,),
                            Text("No Fire Reports")
                          ],
                        )
                      );
                    }
        
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot document = snapshot.data!.docs[index];
                        Map<String, dynamic>? data = document.data() as Map<String, dynamic>;
        
                    return SunogDisplay(
                      username: data ['username'], 
                      fireOperation: data ['fire_operation'], 
                      date: data ['date'], 
                      time: data ['time'], 
                      location: data ['location'],
                      description: data ['description'], 
                      imageUrl: data ['imageUrl']);
                      });
                  }),
        
                  const Padding(padding: EdgeInsets.only(bottom: 24))
              ],
            ),
        ),
      ),
    );
  }
}