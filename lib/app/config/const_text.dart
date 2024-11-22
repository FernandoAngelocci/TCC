import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc/app/config/const_colors.dart';

class ConstText {
  static TextStyle styleButton = GoogleFonts.modak(
    fontSize: 25,
    color: ConstColors.buttonTextColor,
  );

  static TextStyle title = GoogleFonts.modak(
    fontSize: 60,
    fontWeight: FontWeight.normal,
    color: ConstColors.buttonColor,
  );

  static TextStyle categorieButton = GoogleFonts.modak(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: ConstColors.buttonColor,
  );
}
