// ignore_for_file: must_be_immutable, prefer_const_constructors, use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:here_for_u/style/all_style.dart';
import 'package:validators/validators.dart';
import '../../style/components/all_components.dart';

class ConnexionScreen extends StatefulWidget {
  const ConnexionScreen({Key? key}) : super(key: key);

  @override
  State createState() => _ConnexionScreenState();
}

class _ConnexionScreenState extends State {


  final _formKey = GlobalKey<FormState>();

  bool isChecked = false;
  bool isEmailCorrect = false;

  // this bool will check isChecked is checked
  bool showErrorMessage = false;

  // var _email;
  // var _mdp;
  // var _phone;

  final _emailController = TextEditingController();
  final _mdpController = TextEditingController();
  final _phoneController = TextEditingController();

  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   _emailController.dispose();
  //   super.dispose();
  // }

  bool obscureText = true;
  bool _isHidden = true;

  void showPassword() {
    setState(() {
      obscureText = !obscureText;
      _isHidden = !_isHidden;
    });
  }

  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   _emailController.dispose();
  //   _mdpController.dispose();
  //   _phoneController.dispose();
  //   super.dispose();
  // // }
  void signUserIn() async {
    // show loading circle
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );
    if (kDebugMode) {
      print('Fonction Login !!!!');
    }
    // try sign in
    if (kDebugMode) {
      print(" Email ${_emailController.text}");
    }
    if (kDebugMode) {
      print(" MPD ${_mdpController.text}");
    }
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _mdpController.text,
      );
      // pop the loading circle
      Navigator.pushNamed(context, '/');
    } on FirebaseAuthException catch (e) {
      // pop the loading circle

      // WRONG EMAIL
      dialogMessage(e.message);
      if (e.code == 'user-not-found') {
        // show error to user
        dialogMessage("Utilisateur pas trouvée");
      }// WRONG PASSWORD
      else if (e.code == 'wrong-password') {
        // show error to user
        dialogMessage("Mot passe incorrecte");
      }
    }
  }



  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateText);
    _mdpController.addListener(_updateText);
    _phoneController.addListener(_updateText);
  }

  void _updateText() {
    setState(() {
      //_email = _emailController.text;

      //_email = _emailController.text;
      // _mdp = _mdpController.text;
      // _phone = _phoneController.text;
    });
    // _emailController.addListener(_updateText);
    // _mdpController.dispose();
    // _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //var email;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopSignUp(
                    step: "",
                    title: "Connexion",
                    description:
                        "Lorem ipsum dolor sit amet consectetur. Sit viverra et porttitor sem at ipsum enim. "),

                const SizedBox(height: 15),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputForm(
                          myController: _emailController,
                          fieldName: 'Email ou portable',
                          placeholder: '',
                          myType: TextInputType.emailAddress,
                          myFilter: FilteringTextInputFormatter.deny(
                              RegExp(r'[/\\]')),
                          onChanged: (value) {
                            setState(() {
                              isEmailCorrect = isEmail(value);
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Requis *';
                            } else if (isEmailCorrect == false) {
                              return 'Email incorrect';
                            }
                            return null;
                          },
                          onTap: signUserIn,
                          myIconButton: null,

                          obscureText: false,
                          maxLength: TextField.noMaxLength,
                        ),
                        //Text("Get email : ${_emailController.text}"),

                        const SizedBox(height: 15),
                        InputForm(
                          myController: _mdpController,
                          fieldName: 'Mot de passe ',
                          placeholder: 'abcd1234',
                          myType: TextInputType.text,
                          myFilter: FilteringTextInputFormatter.deny(
                              RegExp(r'[/\\]')),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Requis *';
                            } else if (value.length < 5) {
                              return "Votre mot de passe doit contenir au moins 5 caractères";
                            }

                            return null;
                          },
                          onTap: () {},
                          obscureText: obscureText,
                          // mySuffixText: 'lol',

                          myIconButton: IconButton(
                            onPressed: showPassword,
                            icon:
                                // Icon(
                                //   obscureText == true
                                //       ? Icons.visibility_off
                                //       : Icons.visibility,
                                // )
                                obscureText == true
                                    ? Text("montrer")
                                    : Text("cacher"),
                          ),
                          maxLength: TextField.noMaxLength,
                        ),
                        const SizedBox(height: 15),

                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/forgetPassword');
                          },
                          child: Text(
                            "Mot de passe oublié ?",
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    )),
                // : Text(),

                SizedBox(
                  width: double.infinity,
                  child: GoButton(
                    text: 'Connexion',
                    background: AppColor.primary3,
                    foreground: AppColor.primary,
                    minHeight: 40,
                    elevation: 0.0,
                    borderSide: 0,
                    colorSide: Colors.transparent,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        signUserIn();
                      }
                    },
                  ),
                ),
                const SizedBox(height: 30),
                HaveOrNotAccount(
                  signInUpText: "se connecter",
                  haveOrNotText: 'Pas encore de compte ?',
                  signText: "Je m'inscris",
                  page: '/signUp',
                ),
              ]),
        ));
  }

    void dialogMessage(message) {
      showDialog(
        context: context,
        builder: (context) {
          return  AlertDialog(
            backgroundColor: Colors.blue,
            title: Center(
              child: Text(
                message.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      );
    }

}
