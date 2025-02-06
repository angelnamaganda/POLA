import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pola/Admin/admin_drawer/sidebar.dart';
import 'package:pola/Admin/reports_data/aksidente.dart';
import 'package:pola/Admin/reports_data/baha.dart';
import 'package:pola/Admin/reports_data/sunog.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

   void signUserOut (){

    FirebaseAuth.instance.signOut();
  }

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[100],

      endDrawer: SideBar(),

      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        automaticallyImplyLeading: false,
        title: SvgPicture.asset('assets/polaLogo.svg',
        height: 64),
      ),


      
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: const Color(0xFF31B2D9),
        foregroundColor: Colors.white,
        visible: true,
        closeManually: false,
        curve: Curves.bounceInOut,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        shape: const CircleBorder(),

        children: [
          SpeedDialChild(
            child: const Icon(Icons.whatshot_outlined),
            backgroundColor: const Color(0xFF31B2D9),
            label: "Fire Reports",
            labelStyle: const TextStyle(
              fontSize: 16,
              color: Colors.white
            ),
            labelBackgroundColor: Colors.transparent,
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Sunog(),));
            }
          ),

          SpeedDialChild(
            child: const Icon(Icons.flood_outlined),
            backgroundColor: const Color(0xFF31B2D9),
            label: "Flood Reports",
            labelStyle: const TextStyle(
              fontSize: 16,
              color: Colors.white
            ),
            labelBackgroundColor: Colors.transparent,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Baha(),));
            },
          ),

          SpeedDialChild(
            child: const Icon(Icons.car_crash_outlined),
            backgroundColor: const Color(0xFF31B2D9),
            label: "Car Accident Reports",
            labelStyle: const TextStyle(
              fontSize: 16,
              color: Colors.white
            ),
            labelBackgroundColor: Colors.transparent,
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Aksidente(),));
            }
          ),

          SpeedDialChild(
            child: const Icon(Icons.question_mark_outlined),
            backgroundColor: const Color(0xFF31B2D9),
            label: "Other Incident Report",
            labelStyle: const TextStyle(
              fontSize: 16,
              color: Colors.white
            ),
            labelBackgroundColor: Colors.transparent
          )


        ],
      )
    );
  
   /* return Scaffold(

      endDrawer: SideBar(),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('POLA',
        style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),


      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
                children: [
                   Container(
                    height: 180,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40) ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal:100),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                          width: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white)
                          ),
                          child: ListTile(
                              leading: const Icon(Icons.post_add_outlined),
                              iconColor: Colors.white,
                              onTap: (){
                                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AdminPosts()));
                              },
                                title: const Text('Write Posts',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                              ),),
                                  ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white)
                          ),
                          child: ListTile(
                                    leading: const Icon(Icons.newspaper_outlined),
                                    iconColor: Colors.white,
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AdminWall()));
                                    },
                                    title: const Text('Newsfeed',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white
                                    ),),
                                  ),
                        )
                        
                      ],
                    ),
                     
                   ),

                  const SizedBox(
                    height: 30,
                  ),
                    Center(
                      child: Column(
                        children: [
                          const Text('SECTIONS',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),),
                          const SizedBox(
                            height: 50,
                          ),
                         
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                               Column(
                                children: [
                                  FloatingActionButton.large(onPressed: (){
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => const MdrrmoReport(),));
                                  },
                                  child: const Icon(Icons.report_outlined),),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  const Text('MDRRMO REPORTS',
                                  style: TextStyle(
                                    fontSize: 18
                                  ),
                                  ),

                                  const SizedBox(
                                    height: 50,
                                  ),

                                  FloatingActionButton.large(onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserProfile(),));
                                    },
                                    child: const Icon(Icons.person),),

                                  const SizedBox(
                                      height: 20,
                                    ),

                                  const Text('APP USERS',
                                    style: TextStyle(
                                      fontSize: 18
                                    ),)


                                ],
                              ),
                                 
                              Column(
                                children: [
                                  
                                  FloatingActionButton.large(onPressed: (){
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => const BfpReports(),));
                                  },
                                  child: const Icon(Icons.report_outlined),),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  const Text('BFP REPORTS',
                                  style: TextStyle(
                                    fontSize: 18
                                  ),
                                  ),

                                  const SizedBox(
                                    height: 50,
                                  ),

                                  FloatingActionButton.large(onPressed: (){
                                      Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => const ReportAnalysis(),));
                                    },
                                    child: const Icon(Icons.auto_graph_outlined),),

                                  const SizedBox(
                                      height: 20,
                                    ),

                                  const Text('ANALYSIS',
                                    style: TextStyle(
                                      fontSize: 18
                                    ),)
                                ],
                              ),
                            ],
                          )
                             
                          
                            ],
                          ),
                      ), 
                ]
          )
        )
      )
    ); */      
  }
}