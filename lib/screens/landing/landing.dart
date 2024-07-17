import 'package:flutter/material.dart';
//import 'package:here_for_u/style/all_style.dart';
import '../../style/all_style.dart';
import '../../style/components/all_components.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {

   

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const BigLogo(),
          const SizedBox(height: 40),
          const Text(
            "L'application d'aide et de lutte contre les violences sexistes.",
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: GoButton(
              text: "Connexion",
              onPressed: () {
                Navigator.pushNamed(context, '/signIn');
              },
              minHeight: 40,
              elevation: 0.0,
              foreground: AppColor.white,
              background: AppColor.primary3,
              borderSide: 0,
              colorSide: AppColor.primary3,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: GoButton(
              text: "Je m'inscris",
              onPressed: () {
                Navigator.pushNamed(context, '/signUp');
              },
              minHeight: 40,
              elevation: 0.0,
              foreground: AppColor.primary3,
              background: AppColor.transparent,
              borderSide: 2,
              colorSide: AppColor.primary3,
            ),
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text(
                "Je n'ai pas le temps de me connecter !",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                    color: AppColor.secondary5,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ]),
          const SizedBox(height: 50),
          Image.asset('images/landing/help.png'),
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
