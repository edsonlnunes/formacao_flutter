import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData darkTheme() {
  const primaryColor = Colors.orange;
  return ThemeData(
    brightness: Brightness.dark,
    primarySwatch: primaryColor,
    fontFamily: "Poppins",
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),
    cardTheme: CardTheme(
      elevation: 0,
      color: primaryColor.withOpacity(.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(primaryColor),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    dividerColor: Colors.white,
    extensions: [
      AppColors(primaryColor: primaryColor),
    ],
  );
}

ThemeData lightTheme() {
  const primaryColor = Colors.indigo;
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: primaryColor,
    cardTheme: CardTheme(
      elevation: 3,
      color: primaryColor[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.bold,
      ),
    ),
    extensions: [
      AppColors(primaryColor: primaryColor),
    ],
  );
}
