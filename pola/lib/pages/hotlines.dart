// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Hotlines extends StatelessWidget {
  const Hotlines({Key? key}) : super(key: key);

//to be edit, the phone number should not be built in this page
  final String _mdrrmo1 = "09277555625";
  final String _mdrrmo2 = "09852122565";
  final String _bfp1 = "09659168106";
  final String _bfp2 = "09511128688";
  final String _pnp = "09996963211";

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Emergency Hotlines',
       ),
        backgroundColor: const Color.fromARGB(255, 41, 188, 221),
        foregroundColor: Colors.white,
        
      ),
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              const SizedBox(
                height: 24
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 144,
                  width: size.width,
                  decoration: BoxDecoration( //in this part, the left and right side border should be transparent
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(0, 4.0),
                        spreadRadius: 1
                      ),

                      const BoxShadow(
                        color: Colors.white,
                        blurRadius: 0,
                        offset: Offset(0, 0),
                        spreadRadius: 1
                      ),

                    
                    ],
                  ),
                  
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24, left: 16, bottom: 24, right: 8),
                    child: Row(
                      children: [
                                
                        SvgPicture.asset('assets/image4.svg'),
                                
                        const SizedBox(
                          width: 8
                        ),

                        const Expanded(
                          child: Text("Remember To Stay Calm And Provide Accurate Information When Calling.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),),
                        ),       
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 32,
              ),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 72,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey)
                  ),

                  child: ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage('assets/default_profile_pic.jpg'),
                      ),
                      title: const Text('MDRRMO',
                      style:TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      )),
                      subtitle: const Text('09277555625'),
                      trailing: IconButton(
                        onPressed: () async{
                          final call = 'tel:$_mdrrmo1';
                          if (await canLaunch(call)){
                            await launch(call);
                          }
                        }, 
                        icon: const Icon(Icons.phone,
                        color: Colors.black)),
                    ),
                ), 
              ),

              const SizedBox(
                height: 16,
              ),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 72,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[200], 
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey)
                  ),

                  child: ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage('assets/default_profile_pic.jpg'),
                      ),
                      title: const Text('MDRRMO',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                      subtitle: const Text('09852122565'),
                      trailing: IconButton(
                        onPressed: () async {
                          final call = 'tel:$_mdrrmo2';
                          if (await canLaunch(call)){
                            await launch(call);
                          }
                        }, 
                        icon: const Icon(Icons.phone,
                        color: Colors.black,)),
                  ),
                  
                ),),

                const SizedBox(
                  height: 16,
                ),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 72,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey)
                  ),

                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/default_profile_pic.jpg'),
                    ),
                    title: const Text('BFP',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),),
                    subtitle: const Text('09659168106'),
                    trailing: IconButton(
                      onPressed: () async{
                        final call = 'tel:$_bfp1';
                        if (await canLaunch(call)){
                          await launch(call);
                        }
                      }, 
                      icon: const Icon(Icons.phone,
                      color: Colors.black,)),
                  )
                  ),),

                  const SizedBox(
                    height: 16,
                  ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 72,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey)
                  ),
                  
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/default_profile_pic.jpg'),
                    ),
                    title: const Text('BFP',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),),
                    subtitle: const Text('09511128688'),
                    trailing: IconButton(
                      onPressed: ()async{
                        final call = 'tel:$_bfp2';
                        if(await canLaunch(call)){
                          await launch(call);
                        }
                      }, 
                      icon: const Icon(Icons.phone,
                      color: Colors.black,)),
                  )
                ),
                ),

                const SizedBox(
                  height: 16,
                ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 72,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey)
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/default_profile_pic.jpg'),
                    ),
                    title: const Text('PNP',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),),
                    subtitle: const Text('09996963211'),
                    trailing: IconButton(
                      onPressed: () async{
                        final call = 'tel:$_pnp';
                        if (await canLaunch(call)){
                          await launch(call);
                        }
                      }, 
                      icon: const Icon(Icons.phone,
                      color: Colors.black,))
                  )
                ),)
        
            ],
          ),
        ),
      ),
      
    );
  }
}
