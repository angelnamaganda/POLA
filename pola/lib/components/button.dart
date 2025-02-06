import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {

  final Function()? onTap;
  final String text;

  const Buttons({super.key, 
  required this.onTap, 
  required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(color: const Color(0xFF31B2D9),
        borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white
          ),
          ),),
      ),
    );
  } 
}

