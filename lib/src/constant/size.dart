import 'package:flutter/material.dart';

class Size{
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth  = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }

   double getProportionateScreenHeight(double inputHeight){
    double screenHeight = Size.screenHeight;
    return (inputHeight/812.0) * screenHeight ;
  }
  double getProportionateScreenWidth(double inputWidth){
    double screenWidth = Size.screenWidth;
    return (inputWidth/375.0) * screenWidth;
  }

}