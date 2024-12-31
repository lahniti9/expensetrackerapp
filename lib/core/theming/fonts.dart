import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontsHelper {
  static TextStyle font13bold = GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: const Color.fromARGB(255, 197, 197, 197));
  static TextStyle font12w400 =
      GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400);
  static TextStyle font14bold =
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold);
  static TextStyle font14w400 =
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400);
  static TextStyle font16bold = GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle font18boldwhite = GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle font20bold =
      GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold);
  static TextStyle font28boldwhite = GoogleFonts.poppins(
      fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle fontsignup = GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: const Color.fromARGB(255, 244, 60, 14));
}
