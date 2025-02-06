import 'package:flutter/material.dart';

class FloodIncidents extends StatefulWidget {
  const FloodIncidents({super.key});

  @override
  State<FloodIncidents> createState() => _FloodIncidentsState();
}

class _FloodIncidentsState extends State<FloodIncidents> {
  @override
  Widget build(BuildContext context) {
    
      return Scaffold(
        backgroundColor: Colors.grey[100],
        body: const Center(
          child: Text('Flood Incidents'),
        )
      );
  }
}