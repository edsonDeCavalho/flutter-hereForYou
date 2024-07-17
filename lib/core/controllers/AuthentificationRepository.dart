// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:here_for_u/screens/signUp/verification.dart';

import '../../screens/landing/landing.dart';
import '../../style/components/bottom_navigation_bar.dart';
import 'exceptions/siginup_email_password.dart';




class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();


  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;


  //Will be load when app launches this func will be called and set the firebaseUser state
  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }


  /// If we are setting initial screen from here
  /// then in the main.dart => App() add CircularProgressIndicator()
  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => const LandingScreen()) : Get.offAll(() => const BottomNavigationBarScreen());
  }

  //FUNC
  Future<String?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => const BottomNavigationBarScreen()) : Get.to(() => VerificationScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWothEmailAndPasswordFailure.code(e.code);
      if (kDebugMode) {
        print(ex.message);
      }
      return ex.message;
    } catch (_) {
      var  ex =  SignUpWothEmailAndPasswordFailure();
      if (kDebugMode) {
        print(ex.message);
      }
      return ex.message;
    }
    return null;
  }


  // Future<String?> loginWithEmailAndPassword(String email, String password) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     final ex = LogInWithEmailAndPasswordFailure.fromCode(e.code);
  //     return ex.message;
  //   } catch (_) {
  //     const ex = LogInWithEmailAndPasswordFailure();
  //     return ex.message;
  //   }
  //   return null;
  // }


  Future<void> logout() async => await _auth.signOut();
}