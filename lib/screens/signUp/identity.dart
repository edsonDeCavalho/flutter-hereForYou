// ignore_for_file: must_be_immutable, non_constant_identifier_names, no_logic_in_create_state

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:here_for_u/core/db/data/Utilisateur.dart';
import 'package:here_for_u/screens/signUp/documents.dart';
import 'package:here_for_u/style/all_style.dart';
import 'package:intl/intl.dart';
import '../../style/components/all_components.dart';
import 'dart:developer';

class IdentityScreen extends StatefulWidget {
  Utilisateur? utilisateur ;

  IdentityScreen(
      {Key? key, this.utilisateur})
      : super(key: key);



  @override
  State createState() => _IdentityScreenState(utilisateur);
}

class _IdentityScreenState extends State {
  final _formKey = GlobalKey<FormState>();
  late Utilisateur? utilisateur_identity =Utilisateur("", "", "") ;
  // var _nom;
  // var _mdp;
  // var _phone;
  final _nameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final TextEditingController _mydateController = TextEditingController();
  final _adressController = TextEditingController();
  final _cityController = TextEditingController();
  final _postalController = TextEditingController();

  _IdentityScreenState(Utilisateur? utilisateur){
    utilisateur_identity=utilisateur;
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_updateText);
    _firstNameController.addListener(_updateText);
    _mydateController.addListener(_updateText);
    _adressController.addListener(_updateText);
    _cityController.addListener(_updateText);
    _postalController.addListener(_updateText);
  }

  void _updateText() {
    setState(() {});
  }

  late String email;
  late String mdp;
  late String phone;
  late DateTime date;
  String sex = "Féminin";
  //DateTime selectedDate = DateTime.now();
  TextEditingController dateCtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,
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
                  step: "Etape 2/4",
                  title: "Inscription",
                  description:
                      "Lorem ipsum dolor sit amet consectetur. Sit viverra et porttitor sem at ipsum enim. "),

              const SizedBox(height: 15),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: const TextSpan(
                              style: TextStyle(
                                  color: AppColor.black, fontSize: 15),
                              text: 'Sexe ',
                              children: [
                            TextSpan(
                                text: '*', style: TextStyle(color: Colors.red))
                          ])),
                      const SizedBox(height: 5),
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            //fit: FlexFit.loose,
                            child: RadioListTile(
                              contentPadding: const EdgeInsets.all(0.0),
                              title: const Text("Féminin"),
                              activeColor: AppColor.primary5,
                              value: "Féminin",
                              groupValue: sex,
                              onChanged: (value) {
                                setState(() {
                                  sex = value.toString();
                                });
                              },
                            ),
                          ),
                          //Spacer(),
                          Flexible(
                            //fit: FlexFit.loose,
                            child: RadioListTile(
                              contentPadding: const EdgeInsets.all(0.0),
                              title: const Text("Masculin"),
                              activeColor: AppColor.primary5,
                              value: "Masculin",
                              groupValue: sex,
                              onChanged: (value) {
                                setState(() {
                                  sex = value.toString();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      // Text("Son sexe : $sex"),
                      Row(
                        children: [
                          Flexible(
                            child: InputForm(
                                myController: _nameController,
                                fieldName: 'Nom ',
                                placeholder: 'Dupont',
                                myType: TextInputType.text,
                                myFilter: FilteringTextInputFormatter.deny(
                                    RegExp(r'[/\\]')),
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Requis *';
                                  }
                                  return null;
                                },
                                onTap: () {},
                                myIconButton: null,
                                obscureText: false,
                                maxLength: TextField.noMaxLength),
                          ),
                          const SizedBox(width: 25),
                          Flexible(
                            child: InputForm(
                                myController: _firstNameController,
                                fieldName: 'Prénom ',
                                placeholder: 'Marie',
                                myType: TextInputType.text,
                                myFilter: FilteringTextInputFormatter.deny(
                                    RegExp(r'[/\\]')),
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Requis *';
                                  }
                                  return null;
                                },
                                onTap: () {},
                                myIconButton: null,
                                obscureText: false,
                                maxLength: TextField.noMaxLength),
                          ),
                        ],
                      ),
                      // Text(
                      //     "Son nom : ${_nameController.text} + son prénom : ${_firstNameController.text}"),

                      const SizedBox(height: 15),
                      InputDateForm(
                          //readOnly: true,
                          myController: _mydateController,
                          fieldName: 'Date de naissance ',
                          placeholder: '01/01/2001',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Requis *';
                            }
                            return null;
                          },
                          onTap: () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now());

                            if (date != null) {
                              setState(() {
                                _mydateController.text =
                                    DateFormat('dd/MM/yyyy').format(date);
                              });
                            }
                          }),

                      const SizedBox(height: 15),
                      InputForm(
                          myController: _adressController,
                          fieldName: 'Adresse ',
                          placeholder: '14 rue Jean Moulin',
                          myType: TextInputType.text,
                          myFilter: FilteringTextInputFormatter.deny(
                              RegExp(r'[/\\]')),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Requis *';
                            }

                            return null;
                          },
                          onTap: () {},
                          myIconButton: null,
                          obscureText: false,
                          maxLength: TextField.noMaxLength),

                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Flexible(
                            child: InputForm(
                              myController: _cityController,
                              fieldName: 'Ville ',
                              placeholder: 'Paris',
                              myType: TextInputType.text,
                              myFilter: FilteringTextInputFormatter.deny(
                                  RegExp(r'[/\\]')),
                              onChanged: (value) {},
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Requis *';
                                }
                                return null;
                              },
                              onTap: () {},
                              myIconButton: null,
                              obscureText: false,
                              maxLength: TextField.noMaxLength,
                            ),
                          ),
                          const SizedBox(width: 25),
                          Flexible(
                            child: InputForm(
                              myController: _postalController,
                              fieldName: 'Code postal ',
                              placeholder: '75000',
                              myType: TextInputType.number,
                              myFilter: FilteringTextInputFormatter.digitsOnly,
                              onChanged: (value) {},
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Requis *';
                                } else if (value.length != 5) {
                                  return "Code postal non valide !";
                                }
                                return null;
                              },
                              onTap: () {},
                              myIconButton: null,
                              obscureText: false,
                              maxLength: 5,
                            ),
                          ),
                        ],
                      ),

                      // Text("Get date : ${_mydateController.text}"),
                    ],
                  )),

              const SizedBox(height: 25),
              // : Text(),
              // Text(email // this will convert your controller to String
              //     ),
              // Text(mdp // this will convert your controller to String
              //     ),
              // Text(phone // this will convert your controller to String
              //     ),
              NextStepButton(
                  cancelText: 'Retour',
                  nextText: 'Suivant',
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.


                      utilisateur_identity?.nom = _nameController.text;
                      utilisateur_identity?.prenom = _firstNameController.text;
                      utilisateur_identity?.date_de_naissance = _mydateController.text;
                      utilisateur_identity?.adresse = _adressController.text;
                      utilisateur_identity?.ville = _adressController.text;
                      utilisateur_identity?.codePostal = _postalController.text;
                      utilisateur_identity?.sexe = sex;
                      //Test

                      if (kDebugMode) {
                        print('Utilisateur sur identity, ${utilisateur_identity?.toJson()}!');
                      }
                      log('Utilisateur sur identity, ${utilisateur_identity?.toJson()}!');
                      
                      Navigator.pushNamed(context, '/step3');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return DocumentsScreen(
                                utilisateur: utilisateur_identity
                            );
                          }));

                      // Navigator.of(context)
                      //     .pushNamed('/step2', arguments: _emailController.text);

                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return IdentityScreen(
                      //     email: _emailController.text,
                      //     mdp: _mdpController.text,
                      //     phone: _phoneController.text,
                      //   );
                      // }));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No Data')),
                      );
                    }
                  }
                  // Navigator.pushNamed(context, '/step2');

                  ),
            ]
                .map((widget) => Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: widget,
                    ))
                .toList(),
          ),
        )
            //),
            ));
  }
}
