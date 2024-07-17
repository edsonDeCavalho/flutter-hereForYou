import 'dart:async';
import 'package:flutter/material.dart';
import 'package:here_for_u/screens/sos/sos.dart';
import '../../style/all_style.dart';
import '../../style/components/all_components.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SosAnimationScreen extends StatefulWidget {
  const SosAnimationScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SosAnimationState();
  }
}

class SosAnimationState extends State<SosAnimationScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  // startTime() async {
  //   var duration = const Duration(seconds: 3);
  //   if(){

  //   }else {
  //     return Timer(duration, route);
  //   }
  // }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SosScreen()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
          //color: const Color.fromARGB(255, 184, 16, 16),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: LoadingAnimationWidget.inkDrop(
                    color: AppColor.primary4,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 120),
                const Text("Envoi d'une alerte à vos contacts"),
                const SizedBox(height: 10),
                const Text("Mise en communication avec les secours"),
                const SizedBox(height: 120),
                SizedBox(
                  width: double.infinity,
                  child: GoButton(
                    text: "Je suis en sécurité",
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    minHeight: 40,
                    elevation: 0.0,
                    foreground: AppColor.white,
                    background: AppColor.primary3,
                    borderSide: 0,
                    colorSide: AppColor.primary3,
                  ),
                ),
              ]),
        ));
  }
}
