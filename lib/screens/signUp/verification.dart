
// ignore_for_file: use_build_context_synchronously, unused_local_variable, non_constant_identifier_names, must_be_immutable, unnecessary_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
//import 'package:here_for_u/style/all_style.dart';
import '../../core/controllers/singinUp_constroller.dart';
import '../../core/db/data/Utilisateur.dart';
import '../../style/all_style.dart';
import '../../style/components/all_components.dart';

class VerificationScreen extends StatelessWidget {

  VerificationScreen(
      {Key? key, this.utilisateur_verification})
      : super(key: key);

  late Utilisateur? utilisateur_verification =Utilisateur("", "", "") ;
  final controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopSignUp(
              step: "Etape 4/4",
              title: "Inscription",
              description: "Récapitulatif"),
          // Text(
          //   emailController.text.toString(), // this will convert your controller to String
          // ),

          RichText(
              text: TextSpan(
                  style: const TextStyle(color: AppColor.black, fontSize: 15),
                  text: "Sexe : ",
                  children: [
                 TextSpan(text: utilisateur_verification?.sexe, style: const TextStyle(color: Colors.red))
              ])),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text:  TextSpan(
                      style: const TextStyle(color: AppColor.black, fontSize: 15),
                      text: "Nom : ",
                      children: [
                    TextSpan(
                        text: utilisateur_verification?.nom, style: const TextStyle(color: Colors.red))
                  ])),
              RichText(
                  text: TextSpan(
                      style: const TextStyle(color: AppColor.black, fontSize: 15),
                      text: "Prénom : ",
                      children: [
                    TextSpan(
                        text: utilisateur_verification?.prenom, style: const TextStyle(color: Colors.red))
                  ])),
            ],
          ),

          RichText(
              text:TextSpan(
                  style: const TextStyle(color: AppColor.black, fontSize: 15),
                  text: "Date de naissance : ",
                  children: [
                TextSpan(text:utilisateur_verification?.date_de_naissance, style: const TextStyle(color: Colors.red))
              ])),

          RichText(
              text: TextSpan(
                  style: const TextStyle(color: AppColor.black, fontSize: 15),
                  text: "Adresse : ",
                  children: [
                TextSpan(text: utilisateur_verification?.adresse, style: const TextStyle(color: Colors.red))
              ])),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text:  TextSpan(
                      style: const TextStyle(color: AppColor.black, fontSize: 15),
                      text: "Ville : ",
                      children: [
                    TextSpan(
                        text: utilisateur_verification?.ville, style: const TextStyle(color: Colors.red))
                  ])),
              RichText(
                  text: TextSpan(
                      style: const TextStyle(color: AppColor.black, fontSize: 15),
                      text: "Code postal : ",
                      children: [
                    TextSpan(
                        text: utilisateur_verification?.codePostal, style: const TextStyle(color: Colors.red))
                  ])),
            ],
          ),

          RichText(
              text: const TextSpan(
                  style: TextStyle(color: AppColor.black, fontSize: 15),
                  text: "Carte d'identité - recto : ",
                  children: [
                TextSpan(text:"<Carte d'identité - recto >", style: TextStyle(color: Colors.red))
              ])),

          RichText(
              text: const TextSpan(
                  style: TextStyle(color: AppColor.black, fontSize: 15),
                  text: "Carte d'identité - verso : ",
                  children: [
                TextSpan(text: "<Carte d'identité - verso >", style: TextStyle(color: Colors.red))
              ])),

          // Text(
          //   "Carte d'identité - verso",
          //   style: TextStyle(color: AppColor.black, fontSize: 17),
          // ),
          NextStepButton(
            cancelText: 'Retour',
            nextText: 'Finaliser',
            onPressed: () {
              /**
               * Lancemment de création de utilisateur
               *
               */
              //SignUpController.instance.registerUser(utilisateur_verification!);
              //createUserWithEmailAndPassword()
             // FirebaseAuth.instance.createUserWithEmailAndPassword(email: utilisateur_verification?.email as String, password: utilisateur_verification?.mot_passe as String);
              createUser(utilisateur_verification,context);
              FirebaseAuth.instance
                  .authStateChanges()
                  .listen((User? user) {
                if (user == null) {
                  if (kDebugMode) {
                    print('User is currently signed out!');
                  }
                } else {
                  if (kDebugMode) {
                    print('User is signed in!');
                  }
                  Navigator.pushNamed(context, '/');
                }
              });
            },
          )
        ]
            .map((widget) => Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: widget,
                ))
            .toList(),
      ),
    );

//     // return Material();

  }
  void dialogMessage(message,context) async {
    showDialog(
      context: context,
      builder: (context) {
        return  AlertDialog(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text(
              message.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
  Future<void> createUser(user, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user?.email,
          password: user?.mot_passe
      );
      dialogMessage('Utilisateur crée correctemment.',context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        dialogMessage('The password provided is too weak.',context);
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        dialogMessage('The account already exists for that email.',context);
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


}
