import 'package:flutter/material.dart';
import 'package:forecasting_app/controllers/onboarding_controller.dart';
import 'package:forecasting_app/main.dart';
import 'package:forecasting_app/utils/textfield_style.dart';
import 'package:forecasting_app/utils/widgets/signup_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final controller = Get.put(OnboardingController());
    final isSecured = ValueNotifier<bool>(false);
    final isLoading = ValueNotifier<bool>(false);
    final isRemembered = ValueNotifier<bool>(false);
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
                      onChanged: (value) {},
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
                          onChanged: (value) {},
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
                    ValueListenableBuilder(
                      valueListenable: isLoading,
                      builder:
                          (BuildContext context, dynamic value, Widget? child) {
                        return isLoading.value == true
                            ? const Center(
                                child: CircularProgressIndicator.adaptive(),
                              )
                            : LoginButton(
                                emailController: emailController,
                                passwordController: passwordController,
                                onPressed: () async {
                                  isLoading.value = true;
                                  try {
                                    await controller.login(
                                      emailAdress: emailController.text,
                                      password: passwordController.text,
                                    );
                                  } finally {
                                    isLoading.value = false;
                                  }
                                },
                              );
                      },
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

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.onPressed,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: emailController,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return ValueListenableBuilder(
          valueListenable: (passwordController),
          builder: (BuildContext context, dynamic value, Widget? child) {
            return ElevatedButton(
              onPressed: (passwordController.text.isEmpty ||
                      emailController.text.isEmpty)
                  ? null
                  : onPressed,
              child: Text(
                "Login",
                style: appFonts.bodyStyle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
