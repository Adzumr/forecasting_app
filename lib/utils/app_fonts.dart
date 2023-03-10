import 'package:flutter/material.dart';
import 'package:forecasting_app/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AppFonts {
  final headingStyle = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: appColors.whiteColor,
  );
  final subHeadingStyle = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: appColors.whiteColor,
  );
  final bodyStyle = GoogleFonts.inter(
    fontSize: 11.sp,
    color: appColors.blackColor,
  );
  final titleStyle = GoogleFonts.inter(
    fontSize: 12.sp,
    color: appColors.whiteColor,
    fontWeight: FontWeight.bold,
  );
  final buttonTextStyle = GoogleFonts.overpass(
    fontSize: 10.sp,
    color: appColors.blackColor,
  );
}
