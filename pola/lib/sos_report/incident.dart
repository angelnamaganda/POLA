import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pola/components/icon.dart';
import 'package:pola/sos_report/car.dart';
import 'package:pola/sos_report/fire.dart';
import 'package:pola/sos_report/flood.dart';
import 'package:pola/sos_report/other.dart';

class Incident extends StatefulWidget {
  const Incident({super.key});

  @override
  State<Incident> createState() => _IncidentState();
}

class _IncidentState extends State<Incident> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Incident Report",
        style: TextStyle(
          fontSize: 16
        ),),
        backgroundColor: const Color(0xFF31B2D9),
        foregroundColor: Colors.white,
      ),

      backgroundColor: Colors.grey[100],

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 24, left: 16, bottom: 24, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
              
                  children: [
                    SvgPicture.asset('assets/ambulance.svg'),

                    const SizedBox(
                      width: 8,
                    ),
              
                    const Expanded(
                      child: Text("Please select the type of incident you are reporting. Accurate and timely reports help us respond quickly and effectively",
                      style: TextStyle(
                        fontSize: 16
                      ),),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                      height: 32,
                    ),

              const Text("Select Incident Type",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(4.0, 4.0),
                    blurRadius: 8.0,
                    color: Color.fromARGB(100, 0, 0, 0)
                  )
                ]
              ),),

              const SizedBox(
                height: 16,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  height: 324,
                  width: size.width*1,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5E5E5),
                    borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FireReport(),));
                              },
                              child: const ReportIcons(
                                icon: Icons.whatshot_outlined, 
                                label: "FIRE", 
                                iconColor: Colors.black, 
                                backgroundColor: Color(0xFF31B2D9)),
                            ),
                      
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FloodReports(),));
                              },
                              child: const ReportIcons(
                                icon: Icons.flood_outlined, 
                                label: "Floods", 
                                iconColor: Colors.black, 
                                backgroundColor: Color(0xFF31B2D9)),
                            )
                          ],
                        ),
                      ),
                      
                      const SizedBox(
                        height: 40,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [

                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AccidentReports(),));
                            },
                            child: const ReportIcons(
                              icon: Icons.car_crash_outlined, 
                              label: "Accidents", 
                              iconColor: Colors.black, 
                              backgroundColor: Color(0xFF31B2D9)),
                          ),

                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OtherReports(),));
                            },
                            child: const ReportIcons(
                              icon: Icons.question_mark_outlined, 
                              label: "Other", 
                              iconColor: Colors.black, 
                              backgroundColor: Color(0xFF31B2D9)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 48,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("Reminder:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.red
                  ),),
                ),
              ),

              const SizedBox(
                height: 16,
              ),

               const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("Do not send false reports or information; Anyone who will falsifies reports will face a consequences.",
                  style: TextStyle(
                    fontSize: 16,
                  ),),
                ),
              ),              
             
             const SizedBox(
              height: 24,
             )
            ],
          ),
        ),
      ),
    );
  }
}