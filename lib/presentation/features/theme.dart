


import 'package:flutter/material.dart';


ThemeData basicTheme() {



  return ThemeData(
scaffoldBackgroundColor: Colors.white,
cardColor: Color.fromRGBO(153,153,153, 0.1),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      extendedTextStyle: TextStyle(color: Colors.white24, fontWeight: FontWeight.bold),
        backgroundColor: Color.fromRGBO(244,67,54, 1),
      focusColor: Colors.black
    ),

      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white),
        headline4: TextStyle(color: Colors.white),
        headline5: TextStyle(color: Colors.white),
        headline6: TextStyle(color: Colors.white),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
      )


);
}
