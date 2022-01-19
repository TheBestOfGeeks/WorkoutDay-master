


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


ThemeData basicTheme() {



  return ThemeData(
    fontFamily: 'RoundicoRegular',
scaffoldBackgroundColor: Colors.white,
cardColor: Color.fromRGBO(238,238,238, 1),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      extendedTextStyle: TextStyle(color: Colors.white24, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'RoundicoRegular',),
        backgroundColor: Color.fromRGBO(244,67,54, 1),
      focusColor: Colors.black
    ),

      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.white, fontSize: 15),
        headline2: TextStyle(color: Colors.white, fontSize: 15),
        headline3: TextStyle(color: Colors.white, fontSize: 15),
        headline4: TextStyle(color: Colors.white, fontSize: 15),
        headline5: TextStyle(color: Colors.white, fontSize: 15),
        headline6: TextStyle(color: Colors.white, fontSize: 15),
        bodyText1: TextStyle(color: Colors.white, fontSize: 15),
        bodyText2: TextStyle(color: Colors.black, fontSize: 15),
        caption: TextStyle(color: Colors.grey, fontSize: 15),
        button: TextStyle(color: Colors.white, fontSize: 15),
        overline: TextStyle(color: Colors.white, fontSize: 15),
        subtitle1: TextStyle(color: Colors.black, fontSize: 15),
        subtitle2: TextStyle(color: Colors.black, fontSize: 15),
      ),

    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromRGBO(153,153,153, 1),
      centerTitle: true,
    ),

    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
    )
);
}
