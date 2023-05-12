import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oloworay_autos/src/constant/color.dart';

class AppTheme {

  AppTheme._(); //to make the theme class private and prevent user access

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: kPrimaryColor,
    textTheme: lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
      )
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 7,
          color: kPrimaryColor ),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    ),
    inputDecorationTheme: inputDecorationTheme(),
  );

  static InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
    enabledBorder: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
  );
  }
  static OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(

    borderRadius: BorderRadius.circular(6),
    borderSide:  BorderSide(width: 0.5, color: kPrimaryColor.withOpacity(0.4)),
  );
  }

  static TextTheme lightTextTheme = TextTheme(
     titleLarge: GoogleFonts.poppins( //title ho semibold
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    headlineLarge: GoogleFonts.poppins( //h1 semibold
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: kHeadLineTextColor,
    ),
    displayLarge: GoogleFonts.poppins( //h2 semibold
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyLarge: GoogleFonts.poppins( //h3 semibold
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.poppins( //h4 semibold
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: kBodyTextColor,
    ),
    bodySmall: GoogleFonts.poppins( //h5 semibold
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF282828),
    ),
  );

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFF2D7276),
      textTheme: darkTextTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2D7276),
          )
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 7,
                color: Color(0xFF2D7276) ),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      )
  );

  static TextTheme darkTextTheme = TextTheme(
    titleLarge: GoogleFonts.poppins( //title ho semibold
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineLarge: GoogleFonts.poppins( //h1 semibold
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    displayLarge: GoogleFonts.poppins( //h2 semibold
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.poppins( //h3 semibold
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.poppins( //h4 semibold
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.poppins( //h5 semibold
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
}