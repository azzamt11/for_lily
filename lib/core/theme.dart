import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildTheme() {
  var baseTheme = ThemeData.dark().copyWith(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.teal,
      brightness: Brightness.dark,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.teal,
    ),
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
  );

  final customTextTheme = GoogleFonts.pacificoTextTheme(baseTheme.textTheme).copyWith(
    headlineMedium: GoogleFonts.pacifico(
      fontSize: 25.5,
      fontWeight: FontWeight.w800,
      letterSpacing: 0.2,
    ),
    titleLarge: GoogleFonts.pacifico(
      fontSize: 19,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.2,
    ),
    titleMedium: GoogleFonts.pacifico(
      fontSize: 17.5,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.2,
    ),
    bodyLarge: GoogleFonts.pacifico(
      fontSize: 15.5,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      height: 1.1,
    ),
    bodyMedium: GoogleFonts.pacifico(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.2,
    ),
    bodySmall: GoogleFonts.pacifico(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.2,
    ),
  );

  return baseTheme.copyWith(
    textTheme: customTextTheme,
  );
}