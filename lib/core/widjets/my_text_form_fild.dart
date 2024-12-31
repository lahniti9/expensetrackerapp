import 'package:expensetrackerapp/core/theming/fonts.dart';
import 'package:expensetrackerapp/core/theming/my_colors.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isobscureText;
  final TextEditingController?  controller;
  final String? Function(String?)? validator;

   const MyTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    required this.isobscureText, this.controller, this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isobscureText,
      style: FontsHelper.font16bold,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        suffixIcon: suffixIcon,
        fillColor: MyColors.greyColor,
        filled: true,
        hintText: hintText,
        hintStyle: FontsHelper.font14w400,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
