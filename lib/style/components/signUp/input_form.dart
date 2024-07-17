// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:email_validator/email_validator.dart';
import 'package:here_for_u/style/all_style.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

//import '../all_style.dart';

class InputForm extends StatelessWidget {
  String fieldName;
  String placeholder;
  TextInputType? myType;
  TextEditingController myController;
  VoidCallback onTap;
  ValueChanged onChanged;
  IconButton? myIconButton;
  bool obscureText;
  int maxLength;
  String? Function(String?)? validator;
  TextInputFormatter myFilter;
  String? mySuffixText;
  InputForm({
    super.key,
    required this.myController,
    required this.fieldName,
    required this.placeholder,
    this.myType,
    required this.maxLength,
    required this.myFilter,
    required this.validator,
    required this.onTap,
    required this.onChanged,
    this.myIconButton,
    required this.obscureText,
    this.mySuffixText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(
                  style: const TextStyle(color: AppColor.black, fontSize: 15),
                  text: fieldName,
                  children: const [
                TextSpan(text: '*', style: TextStyle(color: Colors.red))
              ])),
          const SizedBox(height: 5),
          TextFormField(
              controller: myController,
              maxLength: maxLength,
              //maxLines: null,
              keyboardType: myType,
              inputFormatters: [
                myFilter,
              ],
              onChanged: onChanged,
              obscureText: obscureText,
              decoration: InputDecoration(
                  errorMaxLines: 3,
                  counterStyle: const TextStyle(
                    height: double.minPositive,
                  ),
                  counterText: "",
                  //hintMaxLines: maxLength,

                  suffixIcon: myIconButton,
                  suffixText: mySuffixText,
                  suffixIconConstraints:
                      const BoxConstraints(minWidth: 80, minHeight: 0),
                  //contentPadding: EdgeInsets.zero,
                  contentPadding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                  //contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  hintText: placeholder,
                  hintStyle: const TextStyle(color: AppColor.gray),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: AppColor.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: AppColor.primary5)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Colors.red)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: AppColor.primary5)),
                  errorStyle: const TextStyle(fontSize: 13)),
              validator: validator),
        ]);
  }
}

class InputDateForm extends StatelessWidget {
  String fieldName;
  String placeholder;
  TextEditingController myController;
  VoidCallback onTap;
  String? Function(String?)? validator;

  InputDateForm({
    super.key,
    required this.myController,
    required this.fieldName,
    required this.placeholder,
    required this.validator,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(
                  style: const TextStyle(color: AppColor.black, fontSize: 15),
                  text: fieldName,
                  children: const [
                TextSpan(text: '*', style: TextStyle(color: Colors.red))
              ])),
          const SizedBox(height: 5),
          TextFormField(
              controller: myController,
              onTap: onTap,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                  hintText: placeholder,
                  hintStyle: const TextStyle(color: AppColor.gray),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: AppColor.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: AppColor.primary5)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Colors.red)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: AppColor.primary5)),
                  errorStyle: const TextStyle(fontSize: 13)),
              validator: validator),
        ]);
  }
}

class InputNumberForm extends StatelessWidget {
  String fieldName;
  String placeholder;
  TextInputType myType;
  TextEditingController myController;
  //String? Function(String?)? validator;
  InputNumberForm({
    super.key,
    required this.myController,
    required this.fieldName,
    required this.placeholder,
    required this.myType,
    //required this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(
                  style: const TextStyle(color: AppColor.black, fontSize: 15),
                  text: fieldName,
                  children: const [
                TextSpan(text: '*', style: TextStyle(color: Colors.red))
              ])),
          const SizedBox(height: 5),
          IntlPhoneField(
            controller: myController,
            keyboardType: myType,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
                counterStyle: const TextStyle(
                  height: double.minPositive,
                ),
                counterText: "",
                contentPadding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                hintText: placeholder,
                hintStyle: const TextStyle(color: AppColor.gray),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(color: AppColor.black)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(color: AppColor.primary5)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(color: Colors.red)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(color: AppColor.primary5)),
                errorStyle: const TextStyle(fontSize: 13)),
            dropdownTextStyle: const TextStyle(
              fontFamily: 'DMSans',
            ),
            invalidNumberMessage: 'Requis *',
            initialCountryCode: 'FR',
          ),
        ]);
  }
}
