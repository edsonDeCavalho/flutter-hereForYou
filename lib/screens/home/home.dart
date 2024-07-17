import 'package:flutter/material.dart';
import 'package:here_for_u/style/all_style.dart';
//import '../../style/all_style.dart';
import '../../style/components/all_components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopPage(
        pageName: "Bonjour !",
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Advice(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("Maintenez le bouton appuyé pendant 3 secondes",
                    style: TextStyle(
                      fontSize: 17,
                      color: AppColor.secondary4,
                    ),
                    textAlign: TextAlign.center),
              ),
              EmergencyButton(myText: "Bouton d'urgence"),
              const Text("Respirez et inpirez",
                  style: TextStyle(
                    fontFamily: 'Exo2',
                    fontSize: 22,
                    color: AppColor.primary3,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  )),
              //     const FittedBox(
              //         fit: BoxFit.scaleDown,
              //         child: 
              //             Text(
              //   "Nous allons alertez les autorités sans tarder. Vos proches et les utilisateurs aux alentours vont également recevoir votre demande d'aide.",
              //   style: TextStyle(
              //     fontSize: 17,
              //   ),
              //   textAlign: TextAlign.center,
              // ),),
              const Text(
                "Nous allons alertez les autorités sans tarder. Vos proches et les utilisateurs aux alentours vont également recevoir votre demande d'aide.",
                style: TextStyle(
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40)
            ]),
      ),
    );
  }
}
