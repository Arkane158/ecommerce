import 'package:flutter/material.dart';

class MyTheme {
  static const Color cblue = Color(0xff003c83);
  static final myTheme = ThemeData(
      primaryColor: cblue,
      appBarTheme: const AppBarTheme(backgroundColor: cblue, elevation: 0),
      textTheme: const TextTheme(
          titleMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
              color: Colors.white)));
}
