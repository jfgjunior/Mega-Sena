import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lottery/res/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static final numberStyle = GoogleFonts.muli(
    fontSize: 26.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final primaryTextStyle = GoogleFonts.muli(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static final subtitleTextStyle =
      GoogleFonts.muli(fontSize: 18.0, color: AppColors.subtitleColor);

  static final valueText = GoogleFonts.muli(
    fontSize: 26.0,
    fontWeight: FontWeight.bold,
    color: AppColors.buttonSecondColor,
  );
}
