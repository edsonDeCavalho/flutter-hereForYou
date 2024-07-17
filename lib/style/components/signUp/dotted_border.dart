import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:here_for_u/style/all_style.dart';
import 'package:here_for_u/style/components/all_components.dart';

// Component Top of SignUp pages
// ignore: must_be_immutable
class MyDottedBorder extends StatelessWidget {
  String text;
  final GestureTapCallback onPressed;
  MyDottedBorder({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      //strokeWidth: 0.8,
      borderType: BorderType.RRect,
      dashPattern: const [10, 10],
      radius: const Radius.circular(30),
      //padding: EdgeInsets.all(6),
      child: SizedBox(
        width: double.infinity,
        child: GoButton(
          text: text,
          onPressed: onPressed,
          minHeight: 40,
          elevation: 0.0,
          foreground: AppColor.gray,
          background: Colors.transparent,
          borderSide: 0,
          colorSide: AppColor.white,
        ),
      ),
    );
  }
}
