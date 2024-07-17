// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:here_for_u/style/components/all_components.dart';
//import '../all_style.dart';

// Component Top of SignUp pages
class TopSignUp extends StatelessWidget {
  String? step;
  String title;
  String description;
  TopSignUp(
      {super.key, this.step, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Logo(),
        Center(
            child: step!.isEmpty == true
                ? const SizedBox(height: 0)
                : const SizedBox(height: 30)),
        Text(
          step!,
          style: const TextStyle(
            fontFamily: 'Exo2',
            fontWeight: FontWeight.w500,
          ),
        ),
        Center(
            child: step!.isEmpty == true
                ? const SizedBox(height: 0)
                : const SizedBox(height: 10)),
        //SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Exo2',
            fontSize: 25,
            fontWeight: FontWeight.w700,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
