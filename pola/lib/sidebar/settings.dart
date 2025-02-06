import 'package:flutter/material.dart';
import 'package:pola/components/textfield.dart';

class Sets extends StatefulWidget {
  const Sets({super.key});

  @override
  State<Sets> createState() => _SetsState();
}

class _SetsState extends State<Sets> {

  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('General Settings',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900
                  ),),
                ),
              ),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 190,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: const Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Language',
                            style: TextStyle(
                              fontSize: 15
                            ),)),
                        ),
                          
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Dark Mode',
                            style: TextStyle(
                              fontSize: 15
                            ),)),
                        ),
                          
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Notification',
                            style: TextStyle(
                              fontSize: 15
                            ),)),
                        ),
                          
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Text Size',
                            style: TextStyle(
                              fontSize: 15
                            ),)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        
              const SizedBox(
                height: 20,
              ),
        
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Security Settings',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900
                  ),),
                ),),
        
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: size.height * 0.5,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)
                    ),
                
                    child: Column(
                      children: [

                        const SizedBox(
                          height: 20,
                        ),

                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Change Password',
                            style: TextStyle(
                              fontSize: 15
                            ),),
                          ),
                        ),
                        FieldTexts(
                          decoration: const InputDecoration(), 
                          controller: passwordController, 
                          hintText: "New password", 
                        ),

                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Confirm Password',
                            style: TextStyle(
                              fontSize: 15
                            ),)
                          ),),

                          FieldTexts(
                            decoration: const InputDecoration(), 
                            controller: confirmPassController, 
                            hintText: "Confirm Password", 
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          ElevatedButton(
                              onPressed: (){},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.blue),
                                foregroundColor: MaterialStateProperty.all(Colors.white)
                              ), 
                              child: const Text('Change'),
                            ),

                          const SizedBox(
                            height: 60,
                          ),

                          const Divider(
                            thickness: 2.0,
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: GestureDetector(
                                child: const Center(
                                  child: Text('DELETE ACCOUNT',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red
                                  ),),
                                ),
                              ),
                            ),)
                      ],
                    ),
                  ),
                )
        
            ],
          ),
        ),
      ),
    );
  }
}