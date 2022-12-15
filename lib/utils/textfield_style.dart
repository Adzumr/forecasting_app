import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../main.dart';

final appTextFieldStyle = InputDecoration(
  contentPadding: EdgeInsets.all(15.sp),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      color: appColors.shadowColor,
    ),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      color: appColors.shadowColor,
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      color: appColors.shadowColor,
    ),
  ),
);
