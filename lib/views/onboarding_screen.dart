import 'package:flutter/material.dart';
import 'package:forecasting_app/main.dart';
import 'package:forecasting_app/views/sign_up_screen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../utils/widgets/login_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                appColors.blueColor.withOpacity(.8),
                appColors.blueColor,
              ],
            ),
          ),
          padding: EdgeInsets.only(top: 20.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage(appIcons.world),
                fit: BoxFit.fill,
              ),
              Card(
                elevation: 2,
                margin: EdgeInsets.all(20.sp),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                color: appColors.whiteColor,
                child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Expore global map of wind, weather, and ocean conditions",
                        style: appFonts.headingStyle,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        "Planing your trip become more easier with ideate weather app. you can instantly see the whole word weather within few second",
                        style: appFonts.bodyStyle,
                      ),
                      SizedBox(height: 4.h),
                      const GetstartedButton(),
                      SizedBox(height: 2.h),
                      const LoginWidget()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GetstartedButton extends StatelessWidget {
  const GetstartedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const SignUpScreen());
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20.sp),
        padding: EdgeInsets.symmetric(
          vertical: 12.sp,
          horizontal: 30.sp,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              appColors.blueColor.withOpacity(.7),
              appColors.blueColor,
            ],
          ),
        ),
        child: Text(
          "Get started",
          style: appFonts.bodyStyle.copyWith(
            color: appColors.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
