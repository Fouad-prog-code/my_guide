import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_guide/core/utils/app_colors.dart';

class AppStyles {
  static TextStyle regural32White = GoogleFonts.lisuBosa(
    color: AppColors.whiteColor,
    fontSize: 32,
    fontWeight: FontWeight.w400, // regural
  );

  static TextStyle blod36White = GoogleFonts.lisuBosa(
    color: AppColors.whiteColor,
    fontSize: 36,
    fontWeight: FontWeight.bold, // regural
  );

  static TextStyle bold22DarkGray = GoogleFonts.lisuBosa(
    color: AppColors.darkGrayColor,
    fontSize: 22,
    fontWeight: FontWeight.bold, // regural
  );

  static TextStyle bold24Black = GoogleFonts.lisuBosa(
    color: AppColors.blackColor,
    fontSize: 24,
    fontWeight: FontWeight.bold, // regural
  );
}
