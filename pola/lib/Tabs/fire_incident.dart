import 'package:flutter/material.dart';

class FireIncidents extends StatefulWidget {
  const FireIncidents({super.key});

  @override
  State<FireIncidents> createState() => _FireIncidentsState();
}

class _FireIncidentsState extends State<FireIncidents> {
  @override
  Widget build(BuildContext context) {
  
  return const Column(
    children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Fire Accidents"),
          )
    ],
  );
  }
}