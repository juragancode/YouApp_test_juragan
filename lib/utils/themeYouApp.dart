import 'package:flutter/material.dart';

ThemeData ThemeYouApp() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        size: 30,
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 19,
        fontWeight: FontWeight.w500,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide(
          color: Colors.grey.shade700,
        ),
      ),
      disabledBorder: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Colors.grey,
        ),
      ),
    ),
  );
}
