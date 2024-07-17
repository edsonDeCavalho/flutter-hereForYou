// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:here_for_u/core/db/data/Utilisateur.dart';

import 'AuthentificationRepository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();


  //TextField Controllers to get data from TextFields
  final utilisateur = Utilisateur("", "", "");

  //Call this Function from Design & it will do the rest
  void registerUser(Utilisateur utilisateur) {
    String? error = AuthenticationRepository.instance.createUserWithEmailAndPassword(utilisateur.email.toString(), utilisateur.mot_passe.toString()) as String?;
    if(error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }


}