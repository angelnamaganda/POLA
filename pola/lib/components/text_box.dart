import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {

  final String text;
  final String sectionName;
  final Function()? onPressed;

  const MyTextBox({super.key,
  required this.text,
  required this.sectionName,
  required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(sectionName,
              style: const TextStyle(
                fontSize: 15
              ),),
              
              IconButton(
                onPressed: onPressed, 
                icon: const Icon(Icons.settings))

            ],
          ),
          Text(text),
        ],
      ),
    );
  }
}