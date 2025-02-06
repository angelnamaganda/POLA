import 'package:flutter/material.dart';

class ReportIcons extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final Color backgroundColor;

  const ReportIcons({super.key, 
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Icon(
            icon,
            color: iconColor,
            size: 50.0,
          ),
        ),

        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}