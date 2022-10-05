import 'package:flutter/material.dart';

class MyStoreTheme {
  static ThemeData lightThemeData() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, foregroundColor: Colors.black),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: const Color(0xFF3bb71f),
      colorScheme: ThemeData().colorScheme.copyWith(
            brightness: Brightness.light,
          ),
      // cardColor: Colors.grey[300],
      cardColor: Colors.grey[100],
      scrollbarTheme: ScrollbarThemeData(
        trackVisibility: MaterialStateProperty.all(true),
        radius: const Radius.circular(8.0),
        thickness: MaterialStateProperty.all(5.0),
        thumbVisibility: MaterialStateProperty.all(true),
        thumbColor: MaterialStateProperty.all(Colors.grey[800]),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.resolveWith((states) => 4.0),
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.green[200]),
          foregroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.black),
        ),
      ),
      brightness: Brightness.light,
      backgroundColor: Colors.grey[200],
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color(0xFF3bb71f),
        elevation: 8.0,
      ),
    );
  }

  static ThemeData darkThemeData() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black, foregroundColor: Colors.white),
      scaffoldBackgroundColor: Colors.black,
      primaryColor: const Color(0xFF3bb71f),
      colorScheme: ThemeData().colorScheme.copyWith(
            brightness: Brightness.dark,
          ),
      // cardColor: Colors.grey[600],
      cardColor: Colors.grey[900],
      scrollbarTheme: ScrollbarThemeData(
        trackVisibility: MaterialStateProperty.resolveWith((states) => true),
        radius: const Radius.circular(8.0),
        thickness: MaterialStateProperty.resolveWith((states) => 5.0),
        thumbVisibility: MaterialStateProperty.resolveWith((states) => true),
        thumbColor: MaterialStateProperty.all(Colors.grey[200]),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.resolveWith((states) => 4.0),
          backgroundColor:
              // MaterialStateProperty.resolveWith((states) => Colors.green[900]),
              MaterialStateProperty.resolveWith((states) => Colors.green[900]),
          foregroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.white),
        ),
      ),
      brightness: Brightness.dark,
      backgroundColor: Colors.grey[800],
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color(0xFF3bb71f),
        elevation: 8.0,
      ),
    );
  }
}
