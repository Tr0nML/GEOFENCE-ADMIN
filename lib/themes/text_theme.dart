import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
    displayMedium: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    displaySmall: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
    headlineSmall: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
    titleLarge: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
    bodyLarge: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
    bodyMedium: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
  );

}