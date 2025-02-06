import 'package:flutter/material.dart';
import 'package:pola/components/reusable_widgets.dart';
import 'package:pola/terms_policy/conditions.dart';
import 'package:pola/terms_policy/policy.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('About Us'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 15),
                     child: logo('assets/polaLogo.png'),
                   ),

                   const SizedBox(
                    width: 25,
                   ),

                   const Column(
                     children: [
                       Text('''Pangkaligtasang 
Obheto, Layunin, at 
Aksyon''',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900
                        ),
                      ),
                     ],
                   )
                 ],
               ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text('A Software Application for Emergency Response'),
                  )),
                  
                  const SizedBox(
                    height: 10,),

                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TermsConditions()));
                      },
                      child: const Text('Terms and Conditions',
                      style: TextStyle(
                        color: Colors.red
                      ),),
                    ),
                  )),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Policy(),));
                    },
                    child: const Text('Privacy Policy',
                    style: TextStyle(
                      color: Colors.red
                    ),),
                  ),),
                ),


                 const SizedBox(
                  height: 20,
                ),

                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text('MISSION',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),),
                ),

                const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Text('To enhance the safety and well-being of Polangui, Albay residents by providing a user-friendly safety management application that enables swift and effective emergency response during natural and man=made crises. Our mission is to save lives, minimize the impact of disasters, and strengthen community resilience advanced technology and improved communication.',
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.ltr,
                    ),
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child:Text('Our Community to Privacy',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),)
                        ),
                    ),

                  const SizedBox(
                    height: 10,
                  ),
                    
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('* We Ensure Data Security Through Encryption',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),)
                        ),
                    ),

                  const SizedBox(
                    height: 10,
                  ),
                    
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('Data security is our utmost priority. We employ advanced encryption protocols to protect your information during transmission within our application. We ensure that any data shared through POLA remains confidential and shielded from unauthorized access, providing peace of mind during emergencies.',
                        textAlign: TextAlign.justify,)
                        ),
                    ),

                    const SizedBox(
                      height: 10,),

                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('* We Protect User Identities',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.justify,)
                        ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                      
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text("Your privacy is our concern. We've designed POLA to allow users to maintain anonymity if they prefer. This means you can utilize our application, report emergencies, and communicate with local authorities without disclosing your identity, offering a discreet and secure platform for all users.",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.justify,)
                        ),
                    ),

                    const SizedBox(
                      height: 10,),

                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('* We Restrict Data Access to Authorized Personnel',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.justify,)
                        ),
                    ), 

                    const SizedBox(
                      height: 10,),

                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('We take data access seriously. Only authorized administrators, such as the MDRRMO Emergency Medical Service Quick Response Team (EMS-QRT), BFP, and the Mayor, can access sensitive information within POLA. This control ensures that your data is only accessible to individuals directly involved in emergency response preventing unauthorized usage.',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.justify,)
                        ),
                    ), 

                    const SizedBox(
                      height: 10,),

                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('* We Manage Data Retention Responsibly',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.justify,)
                        ),
                    ), 

                    const SizedBox(
                      height: 10,),

                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('Responsible data handling is paramount. Our data retention policies are designed to retain information only for the duration necessary to enhance our emergency response services. Rest assured that we treat your data carefully and discard it when it is no longer needed, adhering to stringent data mannagement practices.',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.justify,)
                        ),
                    ),

                    const SizedBox(
                      height: 10,),

                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('* We Prioritize Transparent Information Practices',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.justify,)
                        ),
                    ), 

                    const SizedBox(
                      height: 10,),

                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('We believe in openness and clarity. Our comprehensive privacy policy provides a detailed account of the types of data we collect, how we use it, ad who has access to it. This transparency empowers you with knowledge about our data practices, ensuring you can trust us with your information while using POLA',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.justify,)
                        ),
                    ),

                    const SizedBox(
                      height: 10,),

                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('* We Continuously Enhance Security Measures',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.justify,)
                        ),
                    ),

                    const SizedBox(
                      height: 10,),

                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text("We are committed to enhancing our privacy and security practices continouosly, aligning them with industry standards and best practices to maintain your trust in our platform's safety and reliability",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.justify,)
                        ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    const SizedBox(
                      height: 30,),

                     const Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('Copyright',
                        textAlign: TextAlign.justify,)
                        ),
                    ),


                    const Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('2023',
                        textAlign: TextAlign.justify,)
                        ),
                    ),
                    const SizedBox(
                      height: 10,
                    )

            ],
          ),
        ),
      )
    );
  }
}