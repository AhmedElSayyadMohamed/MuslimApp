import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  backgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      color: Color(0xff59675B),
    ),
    bodyText2: TextStyle(
      color: Color(0xff59675B),
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    backwardsCompatibility: false,
    // systemOverlayStyle: SystemUiOverlayStyle(),
    backgroundColor: Color(0xffF6F9F4),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xff59675B),
  ),
  scaffoldBackgroundColor: const Color(0xffF6F9F4),
  primaryColor: const Color(0xff5ADAAC),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Color(0xff5ADAAC),
    unselectedItemColor: Colors.grey,
    showUnselectedLabels: false,
    showSelectedLabels: false,
    elevation: 20,
    backgroundColor: Colors.white,
    selectedIconTheme: IconThemeData(
      size: 28,
    ),
    unselectedIconTheme: IconThemeData(
      size: 25,
    ),
  ),
);

ThemeData darkMode = ThemeData(
  primaryColor: Colors.greenAccent,
  backgroundColor: Colors.black,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      color: Colors.amber[300],
    ),
    bodyText2: TextStyle(
      color: Colors.amber[300],
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
  appBarTheme: AppBarTheme(
    titleSpacing: 20,
    backwardsCompatibility: false,
    // systemOverlayStyle: SystemUiOverlayStyle(),
    backgroundColor: Colors.black12,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.greenAccent,
  ),
  scaffoldBackgroundColor: Colors.white10,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.greenAccent,
    unselectedItemColor: Colors.grey,
    showUnselectedLabels: false,
    showSelectedLabels: false,
    elevation: 30,
    backgroundColor: Colors.black26,
    selectedIconTheme: const IconThemeData(
      size: 28,
    ),
    unselectedIconTheme: const IconThemeData(
      size: 25,
    ),
  ),
);
