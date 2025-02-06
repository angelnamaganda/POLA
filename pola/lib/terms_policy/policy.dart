import 'package:flutter/material.dart';

class Policy extends StatelessWidget {
  const Policy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Privacy Policy'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(padding: EdgeInsets.all(10.0),
                  child: Text('Welcome to POLA: Pangkaligtasang Obheto, Layunin, at Aksyon',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold
                  ),),),
                ),

              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text('POLA is committed to protecting your privacy and safeguarding your personal information. This Privacy Policy outline how we collect your data when you use POLA App',
                  textAlign: TextAlign.justify,
                 ),
                 ),
                ),

             SizedBox(
                height: 10,),

             Align(
               alignment: Alignment.topLeft,
               child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 15),
               child: Text('Information We Collect',
                  style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.justify,)
               ),
            ),

            SizedBox(
                height: 10,),

             Align(
               alignment: Alignment.topLeft,
               child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 15),
               child: Text('* Information You Provide',
                  style: TextStyle(
                     fontSize: 15,
                     fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.justify,)
               ),
            ),

             SizedBox(
                height: 10,),

             Align(
               alignment: Alignment.topLeft,
               child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 15),
               child: Text('We may collect information you provide when using the application, including but not limited to your name, contact information, emergency reports, and any othe data voluntarily submitted.',
                textAlign: TextAlign.justify,)
               ),
            ),

             SizedBox(
                height: 10,),

             Align(
               alignment: Alignment.topLeft,
               child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 15),
               child: Text('* How We Use Your Information?',
                  style: TextStyle(
                     fontSize: 15,
                     fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.justify,)
               ),
            ),

             SizedBox(
                height: 10,),

             Align(
               alignment: Alignment.topLeft,
               child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 15),
               child: Text('We use the collected information for the following purposes:',
                textAlign: TextAlign.justify,)
               ),
            ),

            SizedBox(
                height: 10,),

             Align(
               alignment: Alignment.topLeft,
               child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 15),
               child: Text('''* To facilitate emergency communication and response in Polangui, Albay.
* To improve and enhance the functionalit of the application.
* To comply with legal obligations.
* To provide you with updates and information related to emergencies.''',
                textAlign: TextAlign.justify,)
               ),
            ),

             SizedBox(
                height: 10,),

             Align(
               alignment: Alignment.topLeft,
               child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 15),
               child: Text('* Your Choices',
                  style: TextStyle(
                     fontSize: 15,
                     fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.justify,)
               ),
            ),

            SizedBox(
                height: 10,),

             Align(
               alignment: Alignment.topLeft,
               child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 15),
               child: Text('You have the right to access, correct, or delete your personal information. You may also limit the data you provide or disable certain features within the application.',
                textAlign: TextAlign.justify,)
               ),
            ),
            SizedBox(
                height: 10,),

             Align(
               alignment: Alignment.topLeft,
               child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 15),
               child: Text('* Data Sharing and Disclosure',
                  style: TextStyle(
                     fontSize: 15,
                     fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.justify,)
               ),
            ),

            SizedBox(
                height: 10,),

             Align(
               alignment: Alignment.topLeft,
               child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 15),
               child: Text('We may share your information with authorized administrators within the POLA application, inlcuding the MDRRMO Emergency Medical Service Quick Response Team (EMS-QRT), BFP, and the Mayor. This shating is essential for effective emergency response.',
                textAlign: TextAlign.justify,)
               ),
            ),

             SizedBox(
                height: 10,),

             Align(
               alignment: Alignment.topLeft,
               child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 15),
               child: Text('We do not sell or rent your personal information to third parties. However, we may share your data as required by law or to protect our rights, privacy, safety, or property.',
                textAlign: TextAlign.justify,)
               ),
            ),

             SizedBox(
                height: 10,),

             Align(
               alignment: Alignment.topLeft,
               child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 15),
               child: Text('CONTACT US',
                  style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.justify,)
               ),
            ),

            SizedBox(
                height: 10,),

             Align(
               alignment: Alignment.topLeft,
               child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 15),
               child: Text('If you have any questions, concerns, or requests regarding this Privacy Policy or our data practices, please get in touch with us at polaappproject01@gmail.com. By using the POLA Application, you give consent to the terms of this Privacy Policy and the processing of your data as described herein.',
                textAlign: TextAlign.justify,)
               ),
            ),
            
            SizedBox(
              height: 20,
            )
                
            ],
          ),
        )),
    );
  }
}