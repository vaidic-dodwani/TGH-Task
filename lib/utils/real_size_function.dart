import 'package:flutter/material.dart';

class ScreenPixelSize {
  static const width = 821;
  static const height = 375;
}

class RelSize {
  static double height(BuildContext context, int height) {
    return ((MediaQuery.of(context).size.height / ScreenPixelSize.height) *
            height)
        .toDouble();
  }

  static double width(BuildContext context, int width) {
    return ((MediaQuery.of(context).size.width / ScreenPixelSize.width) * width)
        .toDouble();
  }
}
