import 'package:flutter/material.dart';
import 'package:forecasting_app/main.dart';
import 'package:forecasting_app/utils/textfield_style.dart';
import 'package:forecasting_app/utils/widgets/signup_widget.dart';
import 'package:forecasting_app/views/congratulation_screen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final isSecured = ValueNotifier<bool>(false);
  final isRemembered = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.sp),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image(
                      image: AssetImage(appIcons.logo),
                      height: 15.h,
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      "Enter your email address and password",
                      textAlign: TextAlign.center,
                      style: appFonts.bodyStyle.copyWith(
                        color: appColors.shadowColor,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: appTextFieldStyle.copyWith(
                        labelText: "Email",
                      ),
                    ),
                    SizedBox(height: 2.h),
                    ValueListenableBuilder(
                      valueListenable: isSecured,
                      builder:
                          (BuildContext context, dynamic value, Widget? child) {
                        return TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isSecured.value,
                          decoration: appTextFieldStyle.copyWith(
                            labelText: "Password",
                            suffixIcon: InkWell(
                              onTap: () {
                                isSecured.value = !isSecured.value;
                              },
                              child: Icon(
                                isSecured.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: isRemembered,
                          builder: (BuildContext context, dynamic value,
                              Widget? child) {
                            return InkWell(
                              onTap: () {
                                isRemembered.value = !isRemembered.value;
                              },
                              child: Icon(
                                isRemembered.value
                                    ? Icons.check_box_outline_blank
                                    : Icons.check_box,
                                size: 15.sp,
                                color: appColors.shadowColor,
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 1.w),
                        Text(
                          "Remember me",
                          style: appFonts.buttonTextStyle,
                        )
                      ],
                    ),
                    SizedBox(height: 2.h),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => const CongratulationScreens());
                      },
                      child: Text(
                        "Login",
                        style: appFonts.bodyStyle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SignupWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
