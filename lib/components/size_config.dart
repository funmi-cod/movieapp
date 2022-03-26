import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenHeight;
  static late double screenWidth;
  static double? defaultSize;
  static Orientation? orientation;

  void init (BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight( double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // Assume 812 is the layout height the designer use
  return (inputHeight/ 812.0) * screenHeight;
}

// Get the proportionate width as per screen size
double getProportionateScreenWidth( double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // Assume 375 is the layout width the designer use
  return (inputWidth/ 375.0) * screenWidth;
}