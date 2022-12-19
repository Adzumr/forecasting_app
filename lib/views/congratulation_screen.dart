import 'package:flutter/material.dart';
import 'package:forecasting_app/views/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../main.dart';

class CongratulationScreens extends StatelessWidget {
  const CongratulationScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage(appIcons.logo),
                height: 15.h,
              ),
              const CongratutionWIdget(),
              const LoginOptionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginOptionWidget extends StatelessWidget {
  const LoginOptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.off(() => const SignInScreen());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_back_ios,
            size: 12.sp,
          ),
          SizedBox(width: 1.w),
          Text(
            "Back to Login",
            style: GoogleFonts.plusJakartaSans(
              fontSize: 11.sp,
              fontWeight: FontWeight.normal,
              color: appColors.blackColor,
            ),
          )
        ],
      ),
    );
  }
}

class CongratutionWIdget extends StatelessWidget {
  const CongratutionWIdget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(appIcons.smileIcon),

          // height: 15.h,
        ),
        SizedBox(height: 2.h),
        Text(
          "Congratulations",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: appColors.blackColor,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          "Your Account Created Succesfully",
          textAlign: TextAlign.center,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: appColors.blackColor.withOpacity(.6),
          ),
        ),
      ],
    );
  }
}
