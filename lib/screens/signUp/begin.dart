import 'package:flutter/material.dart';
import '../../style/all_style.dart';
import '../../style/components/all_components.dart';

// ignore: must_be_immutable
class BeginScreen extends StatelessWidget {
  List<Info> infos = [
    Info(
        image: 'images/signUp/begin/gps.png',
        title: 'Localisation',
        description:
            "Afin d'utiliser l'application, vous devez autoriser l'accès à votre position."),
    Info(
        image: 'images/signUp/begin/identity.png',
        title: 'Identité',
        description:
            "Afin d'utiliser l'application, vous devez nous partager votre identité."),
    Info(
        image: 'images/signUp/begin/camera.png',
        title: 'Caméra',
        description:
            "Afin d'utiliser l'application, vous devez autoriser l'accès à votre caméra.")
  ];

  BeginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Logo(),
              const SizedBox(height: 20),
              Wrap(
                direction: Axis.vertical, //Vertical || Horizontal
                children: const [
                  Text(
                    "Informations",
                    style: TextStyle(
                      fontFamily: 'Exo2',
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                      // ),
                    ),
                  ),
                  Text(
                    "Importantes :",
                    style: TextStyle(
                      fontFamily: 'Exo2',
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                      // ),
                    ),
                  ),
                ],
              ),
              Column(
                children: infos.map((info) => InfoCard(info: info)).toList(),
              )
            ],
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: GoButton(
              text: 'Commencer',
              onPressed: () {
                Navigator.pushNamed(context, '/step1');
              },
              minHeight: 40,
              elevation: 0.0,
              foreground: AppColor.white,
              background: AppColor.primary3,
              borderSide: 0,
              colorSide: AppColor.primary3,
            ),
          ),
        ]
            .map((widget) => Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: widget,
                ))
            .toList(),
      ),
    );
  }
}
