// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:here_for_u/style/colors.dart';
import 'package:here_for_u/style/components/all_components.dart';
//import '../all_style.dart';

// Component Top of SignUp pages
class TopPage extends AppBar implements PreferredSizeWidget {
  @override
  Size get preferredSize {
    return const Size.fromHeight(50.0);
  }

  TopPage({super.key, required String pageName})
      : super(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          leadingWidth: 0,
          titleSpacing: 0,
          title: Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LogoOnClick(),
                  Text(
                    pageName,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        color: AppColor.black),
                  ),
                ],
              )),
        );
}
