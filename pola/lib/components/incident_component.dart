import 'package:flutter/material.dart';

//this is the button component
class ImageButton extends StatelessWidget {
  
  final Function()? onTap;
  final Icon icon;
  final String text;

  const ImageButton({super.key,
  required this.onTap,
  required this.icon,
  required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 140,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: icon,),

            const SizedBox(
              width: 8.0,
            ),

            Text(text)
          ],
        ),
      ),
    );
  }
}

//this is a text component
class TextComponent extends StatelessWidget {

  final String text;
  final String text2;

  const TextComponent({super.key,
  required this.text,
  required this.text2
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),),

        const SizedBox(
          width: 4.0,
        ),

        Text(text2,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.red
        ),
        )
      ],
    );
  }
}

class FieldContainers extends StatelessWidget {

  final Function()? onPressed;
  final TextEditingController controller;
  final String hintText;
  final Icon icons;

  const FieldContainers({super.key,
  required this.onPressed,
  required this.controller,
  required this.hintText,
  required this.icons,
  });

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      height: 48,
      width: size.width * 2,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: IconButton(
              onPressed: onPressed, 
              icon: icons)
          ),
        ), ),
    );
  }
}