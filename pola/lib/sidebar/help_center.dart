import 'package:flutter/material.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('POLA Help Center'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('How Can We Help?',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700
                    ),),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Setting up your account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                ),

              SizedBox(
                height: 10,
              ), 

              ExpansionTile(
                title: Text('Create your Account',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18
                ),),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:   20),
                    child: Text("You can create an account by downloading the POLA App. Download POLA App Register by entering your email, password, and other information needed to register.Click 'Sign Up' button",
                    style: TextStyle(
                      fontSize: 15
                    ),),
                    ),
                    SizedBox(
                      height: 10,
                    )
                ],
                ),

                
              ExpansionTile(
                title: Text('Delete your Account',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18
                ),),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('By deleting your account, it will permanently remove all of your data. This will include your profile, email, and etc.',
                    style: TextStyle(
                      fontSize: 15
                    ),),),
                    SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('''To delete your account, follow these steps:
  * Navigate to your homepage, click the menu.
  * Click Setting
  * Under Security Settings, click on "Delete Account" ''',
                        style: TextStyle(
                          fontSize: 15
                        ),),
                      ),
                    ),

                    SizedBox(height: 10,)
                ],
                ),

              SizedBox(
                height: 20,
              ),  

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Navigate the Application',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                ),), 

              ExpansionTile(
                  title: Text('Navigating the Homepage',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red
                  ),),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,),
                      child: Text('''The hompage let you know the purpose of POLA App.
                    
On the top, there are 4 categories which are the feeds, emergency hotlines, weather forecasts, and incident reporting.
                    
On he bottom right corner, there is a red cirlce button with SOS - this is the button for you to acces emergency signal flashlight.''',
                        style: TextStyle(
                          fontSize: 15
                        ),
                        textAlign: TextAlign.justify,),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    
                  ],
                ),

              ExpansionTile(
                title: Text('Navigating your profile',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red
                ),),
                children: [
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('''You can manage your profile by clicking the menu button on the upper right section of the hompage.
                 
To update your profile, click the user profile for you to:
  * Change username
  * Set your full name
  * Change the address''',
                  style: TextStyle(
                    fontSize: 15
                  ),
                  textAlign: TextAlign.justify,),
                 ),
                 
                 SizedBox(
                  height: 10,
                 )
                  
                ],),

              SizedBox(
                height: 40,
              ),

              Padding(padding: EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("FAQ's",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),),
              ),),

            ExpansionTile(
              title: Text('What is POLA?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('POLA is the acronym of "Pangkaligtasang Obehto, Layunin, at Aksyon". It is a safety management system application software for emergency response; developed specifically for the people of the selected barangay of Polangui, Albay',
                  style: TextStyle(
                    fontSize: 15
                  ),
                  textAlign: TextAlign.justify,),
                ),

              SizedBox(
                height: 10
              )
          ],
        ),
           
            ExpansionTile(
              title: Text('How does POLA works?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              children: [
                 Text(''),
            ],
          ),

            ExpansionTile(
              title: Text('Who uses POLA?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Everyone can use POLA App as long as you are in the vicinity of the town of Polanguin, Albay.',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.justify,),
                ),
                SizedBox(
                  height: 10,
                )

              ],)
           
            ],
          ),
        )),
    );
  }
}