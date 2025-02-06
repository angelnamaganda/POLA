// ignore_for_file: unused_local_variable, unused_label, must_be_immutable

import 'package:flutter/material.dart';
import 'package:pola/weather/weather_data/get_location.dart';
import 'package:pola/weather/weather_data/weather_data.dart';


class WeatherForecast extends StatelessWidget {

  var client = WeatherData();
  // ignore: prefer_typing_uninitialized_variables
  var data;

  WeatherForecast({super.key});

 Future<dynamic> info() async {
    var position = await getPosition();
    data = await client.getData(position.latitude, position.longitude);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF31B2D9),
        centerTitle: true,
        title: const Text('Weather Forecast'),
      ),

      backgroundColor: Colors.white,

        body: FutureBuilder(

          future: info(), 
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(snapshot.hasError){
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            else {
              return SafeArea(
                child: Column(
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                      child: Container(
                        height: 380,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: const Color(0xFF31B2D9),
                                  width: 3.0)
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 24),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text("Current Weather",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                                )),
                              ),
                            ),
                              Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('${data?.time}',
                                style: const TextStyle(
                                  fontSize: 16,
                                )),
                              ),
                            ),

                            const SizedBox(height: 16,),

                            Text('${data?.cityName}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600
                            ),),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text('${data?.temp}°',
                                      style: const TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.w400
                                      )),
                            
                                      Text('${data?.condition}',
                                      style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600
                                      ),)
                                    ],
                                  ),
                                  Image.network('https:${data?.icon}',
                                  width: 128,
                                  fit: BoxFit.fill,
                                  )
                                ],
                              ),

                              const SizedBox(
                                height: 16
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Container(
                                  width: size.width,
                                  height: 88,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[350],
                                    borderRadius: BorderRadius.circular(24)
                                  ),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [

                                        //wind
                                        Column(
                                          children: [

                                            const SizedBox(height: 8),

                                            const Icon(Icons.air),

                                            const Text("Wind",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600
                                            ),),

                                            Text('${data?.wind} km/h',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600
                                            ),)
                                          ],
                                        ),

                                        //humidity
                                        Column(
                                          children: [

                                            const SizedBox(height: 8),

                                            const Icon(Icons.water_drop),

                                            const Text("Humidity",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600
                                            ),),

                                            Text('${data?.humidity}%',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600
                                            ),)
                                          ],
                                        ),

                                        //direction
                                        Column(
                                          children: [

                                            const SizedBox(height: 8),

                                            const Icon(Icons.explore),

                                            const Text("Direction",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600
                                            ),),

                                            Text('${data?.wind_dir}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600
                                            ),)
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              )
                          ]),
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Weekly Forecast",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),),
                      ),
                    ),

                    const SizedBox(height: 24,),
                
                    //apply the slide here


                   Row(
                    children: [
                     
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 16),
                       child: Container(
                        height: 164,
                        width: 112,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: const Color(0xFF31B2D9),
                          width: 2.0)
                        ),
                     
                        child: Column(
                            children: [
                                const Padding(
                                    padding: EdgeInsets.only(left: 16, top: 16),
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text("Today",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600
                                          ),
                                        )
                                      ),
                                ),
                     
                        Row(
                          children: [
                              Image.network('https:${data?.icon}'),
                     
                                Text('${data?.temp}°',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                  ),
                                )
                          ],
                        ),
                     
                                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text('${data?.condition}',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                  ),
                              )
                            ),
                                         )
                                         ], 
                                         ),
                                         ),
                     ),

                    ],
                   )
                  ],
                ),
              );
            }
          },
        ),
  );
  }
}