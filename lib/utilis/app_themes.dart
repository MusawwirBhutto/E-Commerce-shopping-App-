import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blueGrey,
    colorScheme: ColorScheme.light(
      primary: Colors.blueGrey,
      secondary: Colors.blueGrey,
      onPrimary: Colors.white,

      surface: Colors.grey[100]!,
      onSurface: Colors.black87,
    ),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: GoogleFonts.lato().fontFamily,
    appBarTheme: AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0.7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(color: Colors.black),
      displayMedium: TextStyle(color: Colors.black87),
      displaySmall: TextStyle(color: Colors.grey[600]),
      headlineMedium: TextStyle(color: Colors.black),
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black87),
      bodySmall: TextStyle(color: Colors.grey[600]),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey,
    colorScheme: ColorScheme.dark(
      primary: Colors.blueGrey,
      secondary: const Color.fromARGB(255, 120, 144, 156),
      onPrimary: Colors.white,
      surface: Colors.grey[900]!,
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 32, 32, 32),
    fontFamily: GoogleFonts.lato().fontFamily,
    appBarTheme: AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardThemeData(
      color: Colors.grey[850],
      elevation: 0.7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(color: Colors.white),
      displayMedium: TextStyle(color: Colors.white70),
      displaySmall: TextStyle(color: Colors.grey[400]),
      headlineMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
      bodySmall: TextStyle(color: Colors.grey[400]),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
