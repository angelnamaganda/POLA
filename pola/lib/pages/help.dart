
import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

class SOS extends StatefulWidget {
  const SOS({super.key});

  @override
  State<SOS> createState() => _SOSState();
}

class _SOSState extends State<SOS> {

  bool isFlashlightOn = false;
  String sosMorseCode = "...---...";
  int currentSignalIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Emergency Signal',
       ),
        backgroundColor: const Color(0xFF31B2D9),
        foregroundColor: Colors.white, 
      ),

      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // row of red dots and dashes representing SOS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(sosMorseCode.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Container(
                    width: sosMorseCode[index] == '.' ? 10 : 30,
                    height: 10,
                    decoration: BoxDecoration(
                      color: currentSignalIndex == index ? Colors.red : Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  )
                  );
              })
            ),

            const SizedBox(
              height: 48,
            ),

            Icon(
              isFlashlightOn ? Icons.flashlight_on_outlined : Icons.flashlight_off_outlined,
              size: 280,
            ),

            const SizedBox(
              height: 40,
            ),

            GestureDetector(
              onTap: toggleFlashlight,
              child: Container(
                width: 296,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF31B2D9),
                  borderRadius: BorderRadius.circular(8.0)
                ),
                child: Center(
                  child: Text(isFlashlightOn ? 'ON' : 'OFF',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

void toggleFlashlight(){
    setState(() {
      isFlashlightOn = !isFlashlightOn;
      currentSignalIndex = -1;
    });

    if (isFlashlightOn){
      flashSOS();
    }
    else{
      TorchLight.disableTorch();
    }
  }  
  void flashSOS() async{
    const String sosMorseCode = "...---...";
    const int dotDuration = 200;
    const int dashDuration = 600;
    const int pauseDuration = 200;

   for (int i = 0; i < sosMorseCode.length; i++){
    setState(() {
      currentSignalIndex = 0;
    });

    if (sosMorseCode[i] == '.'){
      await toggleTorchLight(dotDuration);
    }
    if(sosMorseCode[i] == '-'){
      await toggleTorchLight(dashDuration);
    }
    await Future.delayed(const Duration(milliseconds: pauseDuration));
   }

    await Future.delayed(const Duration(seconds: 5));
    
    if (isFlashlightOn){
      flashSOS();
    }
  }

   Future<void> toggleTorchLight(int duration) async{
      TorchLight.enableTorch();
      await Future.delayed(Duration(milliseconds: duration));
      TorchLight.disableTorch();
    }
}