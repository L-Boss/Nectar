import 'package:flutter/material.dart';

class ScreenSizes {
  double? width;
  double? height;
  double screenWidth(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return width!;
  }

  double screenHeight(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return height!;
  }
}

ScreenSizes screenSizes = ScreenSizes();
