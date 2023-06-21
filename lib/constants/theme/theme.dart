import 'package:flutter/material.dart';

import '../app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      textTheme: lightTextTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          side: const BorderSide(
            width: 1,
            color: AppColors.primary500,
          ),
        ),
      ),
      inputDecorationTheme: inputDecorationTheme());

  static InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 1),
      enabledBorder: outlineInputBorder(),
      focusedBorder: focusedInputBorder(),
      errorBorder: outlineInputBorder(),
      focusedErrorBorder: outlineInputBorder(),
    );
  }

  //Outlined Input Border decoration for input textField
  static OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(width: 1, color: AppColors.black24),
    );
  }

  //Focused Input Border decoration for input textField
  static OutlineInputBorder focusedInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(width: 1, color: AppColors.primary200),
    );
  }


  static TextTheme lightTextTheme = const TextTheme(
    // Header0 text
    displayLarge: TextStyle(
      //h0 semi-bold
      color: AppColors.primary600,
      fontFamily: 'Poppins',
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: TextStyle(
      //h0 medium
      color: AppColors.primary600,
      fontFamily: 'Poppins',
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
    displaySmall: TextStyle(
      //h0 regular
      color: AppColors.primary600,
      fontFamily: 'Poppins',
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),

    // Header 1 text
    headlineLarge: TextStyle(
      //h1 semi-bold
      color: AppColors.primary600,
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      //h1 medium
      color: AppColors.primary600,
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      //h1 regular
      color: AppColors.primary600,
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),

    // Header 3 text
    titleLarge: TextStyle(
      //h3 semi-bold
      color: AppColors.primary500,
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      //h3 medium
      color: AppColors.primary500,
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      //h3 regular
      color: AppColors.primary500,
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),

    // Header 4 text
    bodyLarge: TextStyle(
      //h4 semi-bold
      color: AppColors.textBody,
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      //h4 medium
      color: AppColors.textBody,
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      //h4 regular
      color: AppColors.textBody,
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),

    // Header 5 text
    labelLarge: TextStyle(
      //h5 semi-bold
      color: AppColors.primary600,
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      //h5 medium
      color: AppColors.primary600,
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      //h5 regular
      color: AppColors.primary600,
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  );
}
