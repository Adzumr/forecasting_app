import 'package:flutter/material.dart';
import 'package:forecasting_app/utils/app_colors.dart';
import 'package:forecasting_app/utils/app_fonts.dart';
import 'package:forecasting_app/utils/app_icons.dart';
import 'package:forecasting_app/views/onboarding_screen.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const ForecastingApp());
}

final appColors = AppColors();
final appFonts = AppFonts();
final appIcons = AppIcons();

class ForecastingApp extends StatelessWidget {
  const ForecastingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ((context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Forecasting App',
          theme: ThemeData(
            primarySwatch: Colors.grey,
            primaryColor: appColors.blueColor,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: appColors.blueColor,
                textStyle: appFonts.bodyStyle,
                padding:
                    EdgeInsets.symmetric(vertical: 12.sp, horizontal: 20.sp),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                ),
              ),
            ),
          ),
          home: const OnboardingScreen(),
        );
      }),
    );
  }
}
