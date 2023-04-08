import 'package:flutter/material.dart';

const fontFamily = 'Montserrat';
const primaryColor = Color(0xFF9794F2);
const textColor = Color(0xFF565659);
const textSecondaryColor = Color(0xFF8D95A6);

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: const Color(0xFF9794F2),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF9794F2),
  ),
  primaryColorLight: textColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: const Color(0xFF9794F2),
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 14.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
        side: const BorderSide(color: Colors.white),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(color: textSecondaryColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(width: 2.0, color: primaryColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(color: textSecondaryColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(color: Colors.redAccent.shade100),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: Colors.redAccent.shade100,
        width: 2.0,
      ),
    ),
    labelStyle: const TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Color(0xFF565659),
    ),
    hintStyle: const TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: textSecondaryColor,
    ),
    errorStyle: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Colors.redAccent.shade200,
    ),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Color(0xFF565659),
    ),
    bodySmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: Color(0xFF565659),
    ),
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 36,
      color: Color(0xFF565659),
    ),
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 32,
      color: Color(0xFF565659),
    ),
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Color(0xFF565659),
    ),
    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: textSecondaryColor,
    ),
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: Color(0xFF8D95A6),
    ),
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: textColor,
    ),
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF565659),
      textStyle: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 14.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
        side: const BorderSide(color: Colors.white),
      ),
    ),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Color(0xFF8D95A6),
    ),
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 36,
      color: Color(0xFF8D95A6),
    ),
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 32,
      color: Color(0xFF8D95A6),
    ),
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Color(0xFF8D95A6),
    ),
  ),
);
