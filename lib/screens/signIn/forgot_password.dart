// ignore_for_file: must_be_immutable,
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:here_for_u/style/all_style.dart';
import 'package:validators/validators.dart';
import '../../style/components/all_components.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State {
  final _formKey = GlobalKey<FormState>();

  bool isChecked = false;
  bool isEmailCorrect = false;

  // this bool will check isChecked is checked
  bool showErrorMessage = false;

  // var _email;
  // var _mdp;
  // var _phone;

  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateText);
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
                    title: "Mot de passe oublié ?",
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
                          onTap: () {},
                          myIconButton: null,
                          obscureText: false,
                          maxLength: TextField.noMaxLength,
                        ),
                        //Text("Get email : ${_emailController.text}"),

                        const SizedBox(height: 15),
                      ],
                    )),
                // : Text(),

                NextStepButton(
                    cancelText: "Retour",
                    nextText: "Envoyer",
                    onPressed: () {
                      sendEmailResetMdpd();
                    }
                )
              ]),
        ));
  }


  Future<void> sendEmailResetMdpd() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text);
    } on FirebaseAuthException catch (e) {
      //dialogMessage(e.code);
      dialogMessage(e.message);
      // show the snackbar here
    }
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
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}