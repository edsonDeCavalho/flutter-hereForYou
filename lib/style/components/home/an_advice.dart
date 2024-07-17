import 'package:flutter/material.dart';
import 'package:here_for_u/style/all_style.dart';
import 'package:here_for_u/style/components/all_components.dart';
//import '../all_style.dart';

// Component Advice Home page
// ignore: must_be_immutable
class Advice extends StatelessWidget {
  const Advice({super.key});

  //Gradient myGradient;
  //Advice({required this.myGradient});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 98,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: AppColor.gradient,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
              //padding: const EdgeInsets.all(12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Des conseils pour ma sécurité",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 160,
                      child: GoButton(
                        text: "En savoir plus",
                        onPressed: () {
                          Navigator.pushNamed(context, '/learnMore');
                        },
                        minHeight: 32,
                        elevation: 0.0,
                        foreground: AppColor.white,
                        background: AppColor.primary3,
                        borderSide: 0,
                        colorSide: AppColor.primary3,
                      ),
                    ),
                  ]),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset('images/home/hand_key.png',
                filterQuality: FilterQuality.high),
          )
        ],
      ),
    );
  }
}
