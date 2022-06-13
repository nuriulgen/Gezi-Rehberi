import 'package:flutter/material.dart';

class MyThemes {
  static final primary = Colors.purple;
  static final primaryColor = Colors.blue.shade300;

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.deepOrangeAccent,
    primaryColorDark: primaryColor,
    colorScheme: ColorScheme.dark(primary: primary),
    dividerColor: Colors.white,
    appBarTheme: AppBarTheme(backgroundColor: Colors.red),
    textTheme: TextTheme(),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(primary: primary),
    dividerColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.red,
    ),
  );
}
