
import 'package:flutter/material.dart';

TextStyle _getTextStyle(double fontSize,FontWeight fontWeight,Color color){
  return TextStyle(
      fontSize: fontSize,
      fontFamily: '',
      color: color,
      fontWeight: fontWeight
  );
}

TextStyle getRegularStyle({double fontSize=12,required Color color,  TextDecoration? decoration}){
  return _getTextStyle(fontSize,FontWeight.bold , color);
}

TextStyle getMediumStyle({double fontSize=16,required Color color}){
  return _getTextStyle(fontSize, FontWeight.normal, color);
}

TextStyle getLightStyle({double fontSize=12,required Color color}){
  return _getTextStyle(fontSize,FontWeight.bold , color);
}

TextStyle getBoldStyle({double fontSize=12,required Color color}){
  return _getTextStyle(fontSize, FontWeight.bold, color);
}
TextStyle getSemiBoldStyle({double fontSize=12,required Color color}){
  return _getTextStyle(fontSize,FontWeight.bold , color);
}