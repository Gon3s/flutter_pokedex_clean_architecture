import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  AppStyles._();

  //! Font sizes

  static final double fontSizeFactor = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.shortestSide < 550 ? 1 : 1.1;

  static final double _headline1 = 28 * fontSizeFactor;
  static final double _headline2 = 24 * fontSizeFactor;
  static final double _headline3 = 20 * fontSizeFactor;
  static final double _headline4 = 18 * fontSizeFactor;
  static final double _title = 16 * fontSizeFactor;
  static final double _subtitle = 14 * fontSizeFactor;
  static final double _caption = 12 * fontSizeFactor;
  static final double _indication = 10 * fontSizeFactor;

  //* Primary Color Text Styles
  //$ Headlines
  static TextStyle headline1 = GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: _headline1,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryColor,
    ),
  );

  static TextStyle headline2 = GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: _headline2,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor,
  ));

  static TextStyle headline3 = GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: _headline3,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor,
  ));

  static TextStyle headline4 = GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: _headline4,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  ));

  static TextStyle title = GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: _title,
    color: AppColors.primaryColor,
  ));
}
