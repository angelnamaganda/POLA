import 'package:flutter/material.dart';

Image logoWidget(String imageName){
    return Image.asset(
      imageName,
      fit: BoxFit.fitWidth,
      width: 150,
      height: 150,
      
    );
  }

Image logo(String imageName){
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 150,
    height: 150,
  );
}


Container signInSignUpbutton(
  BuildContext context, isLogin, Function onTap){

    return Container(

      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: ElevatedButton(onPressed: (){
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)){
            return Colors.black26;
          }
          return Colors.white;
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        )
        
      ), child:Text(
        isLogin ? "LOGIN" :"SIGN UP",
        style: const TextStyle(
          color: Colors.black87, fontWeight:FontWeight.bold, fontSize: 16,
        ),
      )
      ),
    );
  }