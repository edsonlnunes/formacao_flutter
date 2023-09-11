import 'package:flutter/material.dart';
import 'package:todo_list/themes/app_colors.dart';

ThemeData darkTheme() {
  const MaterialColor primaryColor = Colors.orange;

  return ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Poppins",
    scaffoldBackgroundColor: Colors.black,
    primarySwatch: primaryColor,
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: Colors.orange,
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
    listTileTheme: ListTileThemeData(
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
      )
    ],
  );
}

ThemeData lightTheme() {
  const MaterialColor primaryColor = Colors.indigo;
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: primaryColor,
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: Colors.orange,
    // ),
    cardTheme: CardTheme(
      color: primaryColor[50],
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.bold,
      ),
    ),
    extensions: const [
      AppColors(
        primaryColor: primaryColor,
      )
    ],
  );
}
