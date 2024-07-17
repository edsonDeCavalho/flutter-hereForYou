// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
//import 'package:here_for_u/style/components/all_components.dart';

// Info's Class
class Article extends StatelessWidget {
  String image;
  String title;
  String description;

  Article(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      runSpacing: 5.0,
      direction: Axis.horizontal, // main axis (rows or columns)
      children: [
        const SizedBox(height: 30),
        Image.asset(image),
        const SizedBox(height: 10),
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
