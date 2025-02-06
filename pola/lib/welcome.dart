
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pola/register/authenticationpage.dart';
import 'package:pola/register/sign_up.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  int current = 0;

  final CarouselController _controller = CarouselController();


  final List<Map<String, String>> imgList = [
    {'image': 'assets/image1.svg', 'description': 'Floods Can Have Devastating Effects On Communities, Causing Significant Damage To Property And Posing Serious Risks To Human Life.'},
    {'image': 'assets/image2.svg', 'description': 'Fires Can Severely Impact Communities, Leading To Extensive Property Damage And Endangering Human Lives.'},
    {'image': 'assets/image3.svg', 'description': 'A Safety Management Application Software for Emergency Response'}
  ];

  List<Widget> generateImageTiles(){
    return imgList.map((element) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        SvgPicture.asset(element['image']!,
        width: 200,
        height: 200
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          element['description']!,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        )
        
      ]
    ),
    )
    .toList();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            CarouselSlider(
                items: generateImageTiles(),
                carouselController: _controller, 
                options: CarouselOptions(
                  height: 500,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason){
                    setState(() {
                      current = index;
                    });
                  }
                )
              ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (current == entry.key ? Colors.blue : Colors.white),
                    ),
                  ),
                );
              }).toList()
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    foregroundColor: MaterialStatePropertyAll(Color(0xFF31B2D9)),
                    fixedSize: MaterialStatePropertyAll(Size(128, 32)),
                    side: MaterialStatePropertyAll(BorderSide(
                      color: Color(0xFF31B2D9)
                    ))
                  ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Authentication(),));
                  }, 
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Sign In",
                    style: TextStyle(
                      fontSize: 16
                    ),),
                  )
                ),

                const SizedBox(
                  width: 16
                ),

                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color(0xFF31B2D9)),
                    foregroundColor: MaterialStatePropertyAll(Colors. white),
                    fixedSize: MaterialStatePropertyAll(Size(128, 32)),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp(onTap: (){}),));
                  }, 
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Register",
                    style: TextStyle(
                      fontSize: 16
                    ),),
                  )
                )
              ],
            ), 
          ],
        )
      )

    );
  }
}