import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pola/Tabs/car_accidents.dart';
import 'package:pola/Tabs/fire_incident.dart';
import 'package:pola/Tabs/flood_incidents.dart';
import 'package:pola/pages/help.dart';
import 'package:pola/pages/hotlines.dart';
import 'package:pola/sidebar/sidebar.dart';
import 'package:pola/sos_report/incident.dart';
import 'package:pola/weather/weather.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,

      child: Scaffold(
        backgroundColor: Colors.grey[100],
       endDrawer: const EndDrawer(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey[100],
          title: SvgPicture.asset('assets/polaLogo.svg',
          height: 64,),
          
          actions: [
            IconButton(
              onPressed: (){
                //search bar should appear when search icon is pressed
              }, 
              icon: const Icon(Icons.search)),
          
        //here I wrap the icon button menu in Builder widget to open the end drawer because it is just the iconbutton itself, end drawer wont work
            Builder(
              builder: (context) => IconButton(
                onPressed: (){
                  Scaffold.of(context).openEndDrawer();
                }, 
                icon: const Icon(Icons.menu)),)
          ],

          bottom: const TabBar(
                    tabs: [
                    Tab(
                      text: "Flood Incidents", //this is where posts from flood incidents displayed
            
                    ),
                    Tab(
                      text: "Fire Incidents", //this is where the posts from fire incidents displayed
                    ),
                    Tab(
                      text: "Car Accidents", //this is where the posts from car accidents displayed
                    )
                  ]),
        ),

        body: const TabBarView(
                children: [
                  
                  FloodIncidents(), //flood incident update is displayed 
                  
                  FireIncidents(), //fire incident update is displayed
                    
                  CarAccidents(), // car accident update is displayed
                ]
              ),
                 
 
        //for this floating action button, flutter_speed_dial package is needed to have a multiple buttons inside FloatingActionButton
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
              child: const Icon(Icons.assignment),
              backgroundColor: const Color(0xFF31B2D9),
              label: "Incident Report",
              labelStyle: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              labelBackgroundColor: Colors.transparent,
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Incident(),));
              }
            ),

            SpeedDialChild(
              child: const Icon(Icons.cloudy_snowing),
              backgroundColor: const Color(0xFF31B2D9),
              label: "Weather Forecast",
              labelStyle: const TextStyle(
                fontSize: 16,
                color: Colors.white
              ),
              labelBackgroundColor: Colors.transparent,
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => WeatherForecast(),));
              }
            ),

            SpeedDialChild(
              child: const Icon(Icons.call),
              backgroundColor: const Color(0xFF31B2D9),
              label: "Emergency Hotlines",
              labelStyle: const TextStyle(
                fontSize: 16,
                color: Colors.white
              ),
              labelBackgroundColor: Colors.transparent,
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Hotlines(),));
              }
            ),

            SpeedDialChild(
            child: const Icon(Icons.flashlight_on),
            backgroundColor: const Color(0xFF31B2D9),
            label: "Emergecy Signal",
            labelStyle: const TextStyle(
              fontSize: 16,
              color: Colors.white
            ),
            labelBackgroundColor: Colors.transparent,
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SOS(),));
            },
          ),
          ],
         )
    
      ),
    );
  }
}