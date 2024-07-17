// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../all_style.dart';

// Component SearchBar

class MySearchBar extends StatelessWidget {
  String? hintText;
  final double minHeight;
  final void Function(String)? onChanged;

  MySearchBar({super.key, required this.hintText, this.onChanged, required this.minHeight});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints.tightFor(height: minHeight),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: AppColor.primary3,
              ),
            ),
            child: Center(
              child: IntrinsicWidth(
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: AppColor.primary3,
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      color: AppColor.primary3,
                    ),
                  ),
                ),
              ),
            )));
  }
}
