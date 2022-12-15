import 'package:flutter/material.dart';
import 'package:forecasting_app/views/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    this.isBold,
    Key? key,
  }) : super(key: key);
  final bool? isBold;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account ?",
          style: appFonts.buttonTextStyle.copyWith(
            fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        SizedBox(width: 1.w),
        InkWell(
          onTap: () {
            Get.to(() => const SignInScreen());
          },
          child: Text(
            "Log in",
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
