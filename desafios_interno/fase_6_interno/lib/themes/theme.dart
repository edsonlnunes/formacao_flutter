import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData darkTheme() {
  const MaterialColor primaryColor = Colors.green;
  return ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Poppins",
    scaffoldBackgroundColor: const Color(0xFF121212),
    primarySwatch: primaryColor,
    // inputDecorationTheme: InputDecorationTheme(
    //   // filled: true,
    //   // fillColor: Colors.orange,
    // ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(primaryColor),
    ),
    cardTheme: CardTheme(
      color: primaryColor.withOpacity(.5),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    dividerColor: Colors.white,
    extensions: const [
      AppColors(
        primaryColor: primaryColor,
        progressBackground: Colors.white,
      )
    ],
  );
}

ThemeData lightTheme() {
  const MaterialColor primaryColor = Colors.green;
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: primaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),
    cardTheme: CardTheme(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 18,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
      ),
    ),
    dividerColor: Colors.black,
    extensions: const [
      AppColors(
        primaryColor: primaryColor,
        progressBackground: Colors.grey,
      )
    ],
  );
}
