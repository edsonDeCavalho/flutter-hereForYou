// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:here_for_u/screens/signUp/identity.dart';
//import 'package:flutter/services.dart';
import 'package:here_for_u/style/all_style.dart';
import 'package:validators/validators.dart';
//import '../style/all_style.dart';
import '../../core/db/data/Utilisateur.dart';
import '../../style/components/all_components.dart';
import 'dart:developer';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({Key? key}) : super(key: key);

  @override
  State createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State {
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

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    super.dispose();
  }

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
        //resizeToAvoidBottomInset: true,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopSignUp(
                  step: "Etape 1/4",
                  title: "Inscription",
                  description:
                      "Lorem ipsum dolor sit amet consectetur. Sit viverra et porttitor sem at ipsum enim. ",
                ),

                const SizedBox(height: 15),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputForm(
                          myController: _emailController,
                          fieldName: 'Email ',
                          placeholder: 'email@test.fr',
                          //myType: TextInputType.emailAddress,
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
                          onTap: () {},
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
                          myIconButton: IconButton(
                            onPressed: showPassword,
                            icon: Icon(
                              obscureText == true
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          maxLength: TextField.noMaxLength,
                        ),
                        const SizedBox(height: 15),
                        InputNumberForm(
                          fieldName: 'Numéro de téléphone ',
                          placeholder: '0652525252',
                          myType: TextInputType.number,
                          myController: _phoneController,
                        ),

                        // Text(
                        //     "Get email : ${_emailController.text}, my mdp: ${_mdpController.text}, and my phone: ${_phoneController.text}",
                        //     // style: TextStyle(color: isEmailCorrect == false ? Colors.redAccent : Colors.black),
                        //     ),

                        //const SizedBox(height: 5),
                        Row(children: [
                          SizedBox(
                            width: 10,
                            child: Checkbox(
                              side: const BorderSide(
                                color: AppColor.gray,
                              ),
                              value: isChecked,
                              shape: const CircleBorder(),
                              activeColor: AppColor.primary3,
                              onChanged: (value) {
                                //value may be true or false
                                setState(() {
                                  isChecked = !isChecked;
                                  //print(isChecked);
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Container(
                            padding: const EdgeInsets.only(
                              bottom: 0, // Space between underline and text
                            ),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.transparent,
                              width: 2.0, // Underline thickness
                            ))),
                            child: const Text(
                              "J'accepte les ",
                              style: TextStyle(
                                color: AppColor.gray,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                bottom: 0, // Space between underline and text
                              ),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: AppColor.primary3,
                                width: 1.0, // Underline thickness
                              ))),
                              child: const Text(
                                "termes et conditions d'utilisation",
                                style: TextStyle(
                                  color: AppColor.primary3,
                                ),
                              ),
                            ),
                          ),
                        ]),
                        // based up on this bool value
                        showErrorMessage
                            // ? Text(
                            //             "termes et conditions d’utilisation",
                            //             style: TextStyle(
                            //               color: AppColor.primary3,
                            //             ),
                            //           ),
                            ? Container(
                                decoration: BoxDecoration(
                                    //color: Colors.red,
                                    borderRadius: BorderRadius.circular(80.0)),
                                child: const Text(
                                  'Veuillez accepter les termes et conditions !',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ))
                            : Container(),
                        const SizedBox(height: 10),
                      ],
                    )),
                // : Text(),

                NextStepButton(
                  cancelText: 'Annuler',
                  nextText: 'Suivant',
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.

                      if (isChecked == true) {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        // const SnackBar(content: Text('Processing Data')),
                        // );
                        setState(() => showErrorMessage = false);
                        Navigator.pushNamed(context, '/step2');

                        // Navigator.of(context)
                        //     .pushNamed('/step2', arguments: _emailController.text);
                        log('General : Hola cabron !!!');
                        var utlisateur_genere = Utilisateur(_emailController.text,_mdpController.text,_phoneController.text);
                        log('Utilisateur : $utlisateur_genere');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return IdentityScreen(
                            utilisateur: utlisateur_genere
                          );
                        }));
                      } else {
                        setState(() => showErrorMessage = true);

                        // ScaffoldMessenger.of(context).showSnackBar(
                        // const SnackBar(content: Text('No Data')),
                        // );
                      }
                    }
                    // Navigator.pushNamed(context, '/step2');
                  },
                ),
                const SizedBox(height: 30),
                HaveOrNotAccount(
                  signInUpText: "s'inscrire",
                  haveOrNotText: 'Déjà un compte ?',
                  signText: 'Je me connecte',
                  page: '/signIn',
                ),
              ]
                  .map((widget) => Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                        child: widget,
                      ))
                  .toList(),
            ),
          ),
        ));
  }
}
