import 'dart:ui';
import 'package:flutter/material.dart';

class MyColors {
  static const Color blackColor = Color(0xFF0A090B);
  static const Color greyColor = Color(0xFF141414);
  static const Color primaryColor = Color(0xFFE9E9E9);
  static const Color secondaryColor = Color(0xFFE9E9E9);
  static const Gradient gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 221, 103, 34),
      Color.fromARGB(255, 152, 18, 18)
    ],
  );
}
