
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:here_for_u/screens/home/enSavoirPlus/en_savoir_plus.dart';
import 'package:here_for_u/screens/signIn/forgot_password.dart';
import 'package:here_for_u/screens/sos/sos.dart';
import 'package:here_for_u/screens/sos/redirect.dart';
import 'package:here_for_u/screens/sos/sos_animation.dart';
import 'package:here_for_u/style/components/bottom_navigation_bar.dart';
import 'package:here_for_u/screens/landing/landing.dart';
import 'package:here_for_u/screens/signUp/begin.dart';
import 'package:here_for_u/screens/signIn/connexion.dart';
import 'package:here_for_u/screens/signUp/general.dart';
import 'package:here_for_u/screens/signUp/identity.dart';
import 'package:here_for_u/screens/signUp/documents.dart';
import 'package:here_for_u/screens/signUp/verification.dart';
import 'package:here_for_u/screens/contact/contact.dart';
import '/style/all_style.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

//StatelessWidget content that doesn't change
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Devlab',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      
      //themeMode: ThemeMode.system,
      // Start the app with the "/" named route. In this case, the app starts
      // on the BeginScreen widget.
      initialRoute: '/landing',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const BottomNavigationBarScreen(),
        '/landing': (context) => const LandingScreen(),
        '/signUp': (context) => BeginScreen(),
        '/signIn': (context) => const ConnexionScreen(),
        '/contact': (context) => const ContactPage(),
        '/step1': (context) => const GeneralScreen(),
        '/step2': (context) => IdentityScreen(),
        '/step3': (context) => DocumentsScreen(),
        '/step4': (context) => VerificationScreen(),
        '/learnMore': (context) => const EnSavoirPlus(),
        '/sos': (context) => const SosScreen(),
        '/redirect': (context) => const RedirectScreen(),
        '/sosAnim': (context) => const SosAnimationScreen(),
        '/forgetPassword': (context) => const ForgetPasswordScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
