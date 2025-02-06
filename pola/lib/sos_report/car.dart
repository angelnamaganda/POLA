// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:pola/components/button.dart';
import 'package:pola/components/incident_component.dart';

class AccidentReports extends StatefulWidget {
  const AccidentReports({super.key});

  @override
  State<AccidentReports> createState() => _ReportsState();
}

class _ReportsState extends State<AccidentReports> {

  final logger = Logger();

  File? selectedVideo;

    final description = TextEditingController();
    final location = TextEditingController();
    final date = TextEditingController();
    final _time = TextEditingController();
    late String username;

    final FirebaseStorage storage = FirebaseStorage.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    @override
  void initState() {
    super.initState();
    getCurrentUserName();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      logger.i("Received Message: ${message.notification?.title}");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      logger.i("Opened app from message: ${message.notification?.title}");
    });
  }

  Future<void> getCurrentUserName() async{
    try{
      final user = FirebaseAuth.instance.currentUser;
      if (user != null){
        final userDoc = await FirebaseFirestore.instance.collection("Users").doc(user.email).get();
        final userData = userDoc.data();

        if (userData != null){
          setState(() {
            username = userData['fullname'] ?? 'Unknown User';
          });
        }
      }
    }
    catch(e){
      logger.e('Error getting current user: $e');
    }
  }


   void savePost() async{

    if (_selectedImage == null){
      return;
    }
    
    final Reference storageReference = FirebaseStorage.instance.ref().child('accident_image/${DateTime.now()}.jpg');
    UploadTask uploadTask = storageReference.putFile(_selectedImage!);
    TaskSnapshot storageTaskSnapshot = await uploadTask.whenComplete(() => {});

    String imageUrl = await storageTaskSnapshot.ref.getDownloadURL();

    await FirebaseFirestore.instance.collection('accident_reports').add({
      'username' : username,
      'description' : description.text,
      'date' : date.text,
      'time' : _time.text,
      'location' : location.text,
      'imageUrl' : imageUrl,
      'TimeStamp' : Timestamp.now(),
    });


   //show a snackbar to provide feedback to the user.
    if(mounted){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Car Accident Report Submitted Successfully!'),
          duration: Duration(seconds: 10),),
      );
    }

    setState(() {
      description.clear();
      date.clear();
      _time.clear();
      location.clear();
      _selectedImage = null;
    });

  }

  //this is the confirmation dialog
  Future confirmDialog() async{
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: const SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Please ensure that all information provided are true before proceeding.",
                style: TextStyle(
                  fontSize: 16,
                ),)
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop;
              },
              child: const Text('Cancel')),

            TextButton(
              onPressed: (){
                Navigator.of(context).pop;
                savePost();
              }, 
              child: const Text('Proceed'))
          ],
        );
      }
    );
  }

  Future _takeVideo () async {
    final returnedVideo = await ImagePicker().pickVideo(
      source: ImageSource.camera);

      if(returnedVideo == null) return;
      setState(() {
        selectedVideo = File(returnedVideo.path);
      });
  }

   Future _pickImageFromGallery () async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery);

  if (returnedImage == null) return;
      setState(() {
        _selectedImage = File(returnedImage.path);
      });
  }

  Future _pickImageFromCamera () async{
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.camera);

      if (returnedImage == null) return;
        setState(() {
          _selectedImage = File(returnedImage.path);
        });
  }

  File ? _selectedImage;

 

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Car Accident Report',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16
        ),),
        backgroundColor: const Color(0xFF31B2D9),
        foregroundColor: Colors.white,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              const Padding(
                padding: EdgeInsets.only(top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.car_crash_outlined),

                    SizedBox(
                      width: 8,
                    ),

                    Text("Report an Accident",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),)
                  ]),),

                  const SizedBox(height: 16,),

              //container
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 448,
                  width: size.width * 2,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey)
                  ),

                  child: Padding(
                    padding:  const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        //date
                        const TextComponent(
                          text: "Date", 
                          text2: "*"),

                        const SizedBox(
                          height: 8,
                        ),

                        FieldContainers(
                          onPressed: () async {
                            DateTime? pickeddate = await showDatePicker(
                              context: context, 
                              initialDate: DateTime.now(), 
                              firstDate: DateTime(2010), 
                              lastDate: DateTime(5000),
                              
                              builder: (BuildContext context, Widget? child){
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    primaryColor: const Color(0xFF31B2D9),
                                    hintColor: Colors.blue,
                                    colorScheme: const ColorScheme.light(
                                      primary: Color(0xFF31B2D9),
                                      onPrimary: Colors.white,
                                      onSurface: Colors.black
                                    ),
                                    dialogBackgroundColor: Colors.white
                                  ), 
                                  child: child!
                                  );
                              }
                              );

                              if (pickeddate != null){
                                setState(() {
                                  date.text = DateFormat('MM-dd-yyyy').format(pickeddate);
                                });
                              }
                          }, 
                          controller: date, 
                          hintText: "mm/dd/yyyy", 
                          icons: const Icon(Icons.calendar_month_outlined)),

                          const SizedBox(height: 16,),

                          const TextComponent(
                            text: "Time", 
                            text2: "*"
                          ),

                          const SizedBox(height: 8),

                          FieldContainers(
                            onPressed: () async{
                              TimeOfDay? time = await showTimePicker(
                                context: context, 
                                initialTime: TimeOfDay.now(),

                                builder: (BuildContext context, Widget? child){
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary: Color(0xFF31B2D9),
                                    onPrimary: Colors.white,
                                    onSurface: Colors.black
                                  ),
                                  dialogBackgroundColor: Colors.white
                                ),
                                child: child!,
                                );
                              }
                              );

                              
                            if(time != null){
                            setState((){
                              String period = time.period == DayPeriod.am? 'AM' : 'PM';
                              _time.text = '${time.hourOfPeriod}:${time.minute.toString().padLeft(2, '0')} $period';
                            });
                          }
                            },
                            controller: _time, 
                            hintText: "00:00:00", 
                            icons: const Icon(Icons.watch_later_outlined)),

                            const SizedBox(
                              height: 16,
                            ),

                            const TextComponent(
                              text: "Location", 
                              text2: "*"
                            ),

                            const SizedBox(height: 8),

                            FieldContainers(
                              onPressed:  () async{
                            Position position = await Geolocator.getCurrentPosition(
                              desiredAccuracy: LocationAccuracy.high
                            );

                            List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

                            setState(() {
                              if(placemarks.isNotEmpty){
                                location.text = '${position.latitude.toStringAsFixed(6)}, ${position.longitude.toStringAsFixed(6)}';
                              }
                              else {
                                location.text = 'Unknown Location';
                              }
                            });
                          }, 
                              controller: location, 
                              hintText: "Write here your location", 
                              icons: const Icon(Icons.location_on_outlined)
                            ),

                        const SizedBox(height: 16),

                        const TextComponent(
                          text: "Add Aditional Description/Information", 
                          text2: "*"
                        ),

                        const SizedBox(height: 8),

                        Container(
                          height: 96,
                          width: size.width * 2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextField(
                              maxLines: null,
                              controller: description,
                              decoration: const InputDecoration(
                                hintText: "Describe the incident.",
                                border: InputBorder.none)
                              ),
                              
                            ),),

                      ],
                    ) 
                    ),
                ),
                ),

              const SizedBox( height: 16),
            
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("Proof of Incident",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),),
                ),),

                const SizedBox(
                  height: 8,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    ImageButton(
                      onTap: _takeVideo, 
                      icon: const Icon(Icons.video_camera_back_outlined), 
                      text: "Take a Video"
                    ),

                    ImageButton(
                      onTap: _pickImageFromCamera, 
                      icon: const Icon(Icons.camera_alt_outlined), 
                      text: "Take a Picture"
                    ),

                  ],
                ),

                const SizedBox(
                  height: 16,
                ),

                Center(
                  child: ImageButton(
                    onTap: _pickImageFromGallery, 
                    icon: const Icon(Icons.image_outlined), 
                    text: "Upload Media"),
                ),

                const SizedBox(
                  height: 8,
                ),

                _selectedImage != null ? Image.file(_selectedImage!) : const Text(''),

                const SizedBox(
                  height: 24,
                ),

                Buttons(
                  onTap: confirmDialog, 
                  text: "Submit"),

                const Padding(padding: EdgeInsets.only(bottom: 24))
            ],
          ),
        )),
    );

  }
}
