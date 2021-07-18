import 'package:flutter/material.dart';

class OurTheme {
  Color _background = Color.fromARGB(255, 213, 235, 220);
  Color _lightGrey = Color.fromARGB(255, 164, 164, 164);
  Color _darkerGrey = Color(0xff282824);
  Color _blueColor = Color(0xffb0bfff);
  ThemeData buildTheme() {
    return ThemeData(
        canvasColor: Color(0xfff0f0e6),
        primaryColorLight: _blueColor,
        primaryColor: _background,
        accentColor: _lightGrey,
        secondaryHeaderColor: _darkerGrey,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            backgroundColor: _darkerGrey,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.black45,style: BorderStyle.solid,width: 3.0),
            // borderRadius: BorderRadius.circular(20),
            // borderSide: BorderSide(color: _lightGrey),
          ),
         
         
        ),);
  }
}
