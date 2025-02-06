import 'package:flutter/material.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Terms and Conditions of Use for Incident Reporting Application',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800
                  ),),
                ),
              ),

              
            ],
          ),
        )
      ),
    );
  }
}