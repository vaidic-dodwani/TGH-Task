import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextStyle roboto(
      {Color color = Colors.white,
      int fontSize = 16,
      FontWeight fontWeight = FontWeight.normal}) {
    return GoogleFonts.roboto(
        color: color, fontSize: fontSize.toDouble(), fontWeight: fontWeight);
  }

  static TextStyle raleway(
      {Color color = Colors.white,
      int fontSize = 16,
      FontWeight fontWeight = FontWeight.normal}) {
    return GoogleFonts.raleway(
        color: color, fontSize: fontSize.toDouble(), fontWeight: fontWeight);
  }
}
