import 'package:flutter/material.dart';

class AdminButtons extends StatelessWidget {

  final Function()? onTap;
  final String text;

  const AdminButtons({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 60.0),
        decoration: BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          ),),
      ),
    );
  }
}