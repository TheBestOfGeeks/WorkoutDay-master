


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Класс является объектом декорации для TextFormField принимает в себя параметры, которые настраиваются индивидуально, так же при вызове необходимо обратиться к методу style

class TextFieldStyle {

  String labelText = '';
  String hintText = '';
  Widget prefixIcon = Icon(Icons.android);
  Widget? suffixIcon = Icon(Icons.android);


  TextFieldStyle(this.labelText, this.hintText, this.prefixIcon, {this.suffixIcon} );

dynamic style (){
  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.black, width: 4),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.blue, width: 4),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.red, width: 8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.red, width: 4),
    ),
  );
  }

}