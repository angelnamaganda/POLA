import 'package:flutter/material.dart';


class FieldTexts extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const FieldTexts({super.key, 
  required InputDecoration decoration,
  required this.controller,
  required this.hintText,
  required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: controller,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    )
                  ),
                ),
              );
  }
}