import 'package:flutter/material.dart';
import 'package:here_for_u/style/all_style.dart';
//import '../all_style.dart';

// Component Logo
class LogoOnClick extends StatelessWidget {
  const LogoOnClick({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/');
        }, // Image tapped
        child: Row(
          children: [
            Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.blackShade,
                    spreadRadius: 10,
                    blurRadius: 10,
                    offset: const Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "HereForU",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: AppColor.black,
              ),
            ),
          ],
        ));
  }
}

// Component Logo
class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColor.blackShade,
                spreadRadius: 10,
                blurRadius: 18,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Image.asset('images/logo.png'),
          ),
        ),
        const SizedBox(width: 10),
        Image.asset('images/HereForU.png'),
      ],
    );
  }
}

// Component Logo
class BigLogo extends StatelessWidget {
  const BigLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 45.0,
          height: 45.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColor.blackShade,
                spreadRadius: 30,
                blurRadius: 20,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Image.asset('images/landing/Logo.png'),
          ),
        ),
        //SizedBox(width: 30),
        const SizedBox(width: 10),
        //Image.asset('images/landing/HereForU.png'),

        const Text(
          "HereForU",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
            color: AppColor.black,
          ),
        ),
      ],
    );
  }
}
