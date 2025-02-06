import 'package:flutter/material.dart';

class CarAccidents extends StatefulWidget {
  const CarAccidents({super.key});

  @override
  State<CarAccidents> createState() => _CarAccidentsState();
}

class _CarAccidentsState extends State<CarAccidents> {
  @override
  Widget build(BuildContext context) {
    return const Center(
            child: Text('Car Accidents'),
          );
  }
}