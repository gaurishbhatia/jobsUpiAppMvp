import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors from the design
  static const Color primaryBlue = Color(0xFF1E4CA1);
  static const Color lightGray = Color(0xFFDFE7F5);
  static const Color textWhite = Color(0xFFF4F4F4);
  static const Color backgroundColor = Colors.white;

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: primaryBlue,
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: 'DMSans',
    textTheme: GoogleFonts.dmSansTextTheme().copyWith(
      headlineLarge: GoogleFonts.dmSans(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: textWhite,
        letterSpacing: 0.3,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlue,
        foregroundColor: textWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        textStyle: GoogleFonts.dmSans(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.3,
        ),
      ),
    ),
  );
}