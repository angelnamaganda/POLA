import 'package:flutter/material.dart';

Image logoWidget(String imageName){
    return Image.asset(
      imageName,
      fit: BoxFit.fitWidth,
      width: 5,
      height: 5,
      
    );
  }