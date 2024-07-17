// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:here_for_u/style/all_style.dart';

// Component EmergencyButton
class EmergencyButton extends StatelessWidget {
  String myText;
  EmergencyButton({super.key, required this.myText});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      //color: AppColor.backgroundBlack,
      padding: const EdgeInsets.all(30),
      child: Container(
          //width: 220,
          //height: 220,
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColor.redShade,
                spreadRadius: 5,
                blurRadius: 35,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {
              if (kDebugMode) {
                print("Emergency");
              }
            },
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24),
                backgroundColor: AppColor.secondary3,
                elevation: 0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      myText,
                      style: const TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.8),
                      textAlign: TextAlign.center,
                    ),
                    Image.asset('images/home/hand_click.png',
                    //     width: 25, 
                    //     height: 25,
                        width: MediaQuery.of(context).size.width * 0.05, 
                        height: MediaQuery.of(context).size.height * 0.05, 
                        fit: BoxFit.contain),
                  ]),
            ),
          )),
      // SizedBox(
      //     height: 240,
      //     width: 240,
      //     child:
      //     ElevatedButton(
      //       onPressed: () {
      //         if (kDebugMode) {
      //           print("Emergency");
      //         }
      //       },
      //       style: ElevatedButton.styleFrom(
      //           shape: const CircleBorder(),
      //           padding: const EdgeInsets.all(24),
      //           shadowColor: AppColor.primary4,
      //           backgroundColor: AppColor.secondary3),
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 20),
      //         child: Column(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               const SizedBox(height: 25),
      //               Text(
      //                 myText,
      //                 style: const TextStyle(
      //                     fontSize: 23,
      //                     color: Colors.white,
      //                     fontWeight: FontWeight.bold,
      //                     letterSpacing: 1.8),
      //                 textAlign: TextAlign.center,
      //               ),
      //               Image.asset('images/home/hand_click.png',
      //                   width: 25, height: 25, fit: BoxFit.contain),
      //             ]),
      //       ),
      //     )
      //     ),
    );
  }
}
