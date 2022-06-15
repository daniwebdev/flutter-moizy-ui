import 'package:flutter/material.dart';
import 'package:moizy_ui/moizy_ui.dart';

defaultTheme() {
  return ThemeData(
    fontFamily: 'Poppins',
    splashColor: Colors.grey,
    backgroundColor: const Color.fromARGB(255, 245, 245, 245),
    iconTheme: IconThemeData(color: MoizyColors.primary),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: MoizyColors.purple.withBlue(255),
      unselectedItemColor: Colors.black,
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
      ),
    ),
    cardTheme: const CardTheme(
      elevation: 0,
      color: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 24,
        color: Color(0xFF373248),
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontSize: 22,
        color: Color.fromARGB(222, 0, 0, 0),
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        fontSize: 20,
        color: Color.fromARGB(222, 0, 0, 0),
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        fontSize: 18,
        color: Color.fromARGB(222, 0, 0, 0),
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        fontSize: 16,
        color: Color.fromARGB(222, 0, 0, 0),
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        fontSize: 14,
        color: Color.fromARGB(222, 0, 0, 0),
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        fontSize: 14,
        color: Color.fromARGB(222, 0, 0, 0),
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        fontSize: 12,
        color: Color.fromARGB(222, 0, 0, 0),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.primaries[0],
      textTheme: ButtonTextTheme.primary,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.grey,
      ),
    ),
    primarySwatch: const MaterialColor(
      0xFF536DFE,
      <int, Color>{
        50: Color(0xFFEAEDFF),
        100: Color(0xFFCBD3FF),
        200: Color(0xFFA9B6FF),
        300: Color(0xFF8799FE),
        400: Color(0xFF6D83FE),
        500: Color(0xFF536DFE),
        600: Color(0xFF4C65FE),
        700: Color(0xFF425AFE),
        800: Color(0xFF3950FE),
        850: Color(0xFF2F46FE),
        900: Color(0xFF293EFD),
      },
    ),
  );
}
