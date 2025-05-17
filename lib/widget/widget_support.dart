import 'package:flutter/material.dart';

class AppWidget{
  static TextStyle boldTextFieldStyle(){
    return TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        fontFamily: 'Poppins'
    );
  }
  static TextStyle headlineTextFieldStyle(){
    return TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
        fontFamily: 'Poppins'
    );
  }
  static TextStyle lightTextFieldStyle(){
    return TextStyle(
        color: Colors.black38,
        fontWeight: FontWeight.w500,
        fontSize: 15.0,
        fontFamily: 'Poppins'
    );
  }
  static TextStyle semiBoldTextFieldStyle(){
    return TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
        fontFamily: 'Poppins'
    );
  }
}