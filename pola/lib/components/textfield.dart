import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class FieldTexts extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
 

  const FieldTexts({super.key, 
  required InputDecoration decoration,
  required this.controller,
  required this.hintText,
 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color:Color(0xFF31B2D9)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF31B2D9)),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    )
                  ),
                ),
              );
  }
}

class ContactField extends StatelessWidget {

  final TextEditingController numberController;

  const ContactField({super.key,
  required this.numberController});

  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 21),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF31B2D9)),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white
                          ),
                          child: const Text('+63',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey
                          ),),
                        ),

                        const SizedBox(
                          width: 8,
                        ),

                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFF31B2D9)),
                                borderRadius: BorderRadius.circular(8)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xFF31B2D9)),
                                borderRadius: BorderRadius.circular(8)
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: '...',
                              hintStyle: const TextStyle(
                                color: Colors.grey
                              ),
                            ),
                            controller: numberController,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            
                          ),
                        ),
                      ],
                    ),
                  );
  }
}
