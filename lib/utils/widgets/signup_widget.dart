import 'package:flutter/material.dart';
import 'package:forecasting_app/views/sign_up_screen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account?",
          style: appFonts.buttonTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 1.w),
        InkWell(
          onTap: () {
            Get.to(() => const SignUpScreen());
          },
          child: Text(
            "Signup",
            style: appFonts.buttonTextStyle.copyWith(
              color: appColors.blueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
