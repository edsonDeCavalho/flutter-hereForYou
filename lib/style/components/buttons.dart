// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../all_style.dart';

// Component GoButton

class GoButton extends StatelessWidget {
  String text;
  final GestureTapCallback onPressed;
  final double minHeight;
  final double elevation;
  final Color foreground;
  final Color background;
  final double borderSide;
  final Color colorSide;

  GoButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.minHeight,
      required this.elevation,
      required this.foreground,
      required this.background,
      required this.borderSide,
      required this.colorSide});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(height: minHeight),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: foreground,
          backgroundColor: background,
          shape: const StadiumBorder(),
          elevation: elevation,
          shadowColor: Colors.transparent,
          side: BorderSide(
            width: borderSide,
            color: colorSide,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

// Component NextStepButton
class NextStepButton extends StatelessWidget {
  String cancelText;
  String nextText;
  //String page;

  final GestureTapCallback onPressed;
  NextStepButton(
      {super.key,
      required this.cancelText,
      required this.nextText,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Text(
          cancelText,
          style: const TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
      ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 230),
        child: GoButton(
          text: nextText,
          onPressed: onPressed,
          minHeight: 40,
          elevation: 0.0,
          foreground: AppColor.white,
          background: AppColor.primary3,
          borderSide: 0,
          colorSide: AppColor.primary3,
        ),
      ),
    ]);
  }
}

// Component NextSliderButton
class NextSliderButton extends StatelessWidget {
  String cancelText;
  String nextText;
  //String page;

  final GestureTapCallback onPressed;
  NextSliderButton(
      {super.key,
      required this.cancelText,
      required this.nextText,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
        onTap: () {
          //Navigator.pop(context);
          Navigator.pushNamed(context, '/');
        },
        child: Text(
          cancelText,
          style: const TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
      ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 230),
        child: GoButton(
          text: nextText,
          onPressed: onPressed,
          minHeight: 40,
          elevation: 0.0,
          foreground: AppColor.white,
          background: AppColor.primary3,
          borderSide: 0,
          colorSide: AppColor.primary3,
        ),
      ),
    ]);
  }
}

// Component GoButtonExterne

class GoButtonExterne extends StatelessWidget {
  String text;
  String icon;
  final GestureTapCallback onPressed;

  GoButtonExterne(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(height: 30, width: 155),
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.black,
          backgroundColor: AppColor.white,
          shape: const StadiumBorder(),
          //padding: EdgeInsets.all(10),
          side: const BorderSide(
            color: AppColor.black,
            width: 0.8,
          ),
        ),
        onPressed: onPressed,
        icon: Image.asset('images/$icon.png'),
        label: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

// Component HaveOrNotAccount

class HaveOrNotAccount extends StatelessWidget {
  String signInUpText;
  String haveOrNotText;
  String signText;
  String page;
  HaveOrNotAccount(
      {super.key,
      required this.signInUpText,
      required this.haveOrNotText,
      required this.signText,
      required this.page});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          ' ou $signInUpText avec Google ou Apple',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GoButtonExterne(
              icon: 'google',
              text: 'Google',
              onPressed: () {},
            ),
            GoButtonExterne(
              icon: 'apple',
              text: 'AppleId',
              onPressed: () {},
            )
          ],
        ),
        const SizedBox(height: 30),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                haveOrNotText,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, page);
                },
                child: Text(
                  signText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColor.primary3,
                  ),
                ),
              ),
            ])
      ],
    );
  }
}

// // Component SearchButton
// class SearchButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         foregroundColor: AppColor.white,
//         //Color.fromARGB(255, 255, 255, 255),
//         backgroundColor: Color.fromARGB(255, 99, 229, 227),
//         minimumSize: const Size.fromHeight(50), // NEW
//         shape: StadiumBorder(),

//         elevation: 0.0,
//         shadowColor: Colors.transparent,
//       ),
//       onPressed: () {
//         Navigator.pushNamed(context, '/step1');
//       },
//       child: const Text(
//         'Commencer',
//         style: TextStyle(fontSize: 20),
//       ),
//     );
//   }
// }
