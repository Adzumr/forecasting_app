import 'package:flutter/material.dart';
import 'package:forecasting_app/main.dart';
import 'package:forecasting_app/utils/textfield_style.dart';
import 'package:forecasting_app/utils/widgets/login_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/onboarding_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final isSecured = ValueNotifier<bool>(false);
    final isLoading = ValueNotifier<bool>(false);
    final formKey = GlobalKey<FormState>();
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.sp),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
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
                    controller: fullNameController,
                    keyboardType: TextInputType.name,
                    decoration: appTextFieldStyle.copyWith(
                      labelText: "Full Name",
                    ),
                  ),
                  SizedBox(height: 2.h),
                  TextFormField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: appTextFieldStyle.copyWith(
                      labelText: "Phone Number",
                    ),
                  ),
                  SizedBox(height: 2.h),
                  TextFormField(
                    controller: countryController,
                    keyboardType: TextInputType.text,
                    decoration: appTextFieldStyle.copyWith(
                      suffixIcon: const Icon(Icons.expand_more),
                      labelText: "Country",
                    ),
                  ),
                  SizedBox(height: 2.h),
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
                  ValueListenableBuilder(
                    valueListenable: isLoading,
                    builder:
                        (BuildContext context, dynamic value, Widget? child) {
                      return isLoading.value == true
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : SignupButton(
                              fullNameController: fullNameController,
                              phoneNumberController: phoneNumberController,
                              countryController: countryController,
                              emailController: emailController,
                              passwordController: passwordController,
                              onPressed: () async {
                                isLoading.value = true;
                                try {
                                  await controller.registerUser(
                                    name: fullNameController.text,
                                    phoneNumber: phoneNumberController.text,
                                    country: countryController.text,
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
                  SizedBox(height: 10.h),
                  const LoginWidget(
                    isBold: true,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignupButton extends StatelessWidget {
  const SignupButton(
      {Key? key,
      required this.fullNameController,
      required this.phoneNumberController,
      required this.countryController,
      required this.emailController,
      required this.passwordController,
      required this.onPressed})
      : super(key: key);

  final TextEditingController fullNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController countryController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: fullNameController,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return ValueListenableBuilder(
          valueListenable: phoneNumberController,
          builder: (BuildContext context, dynamic value, Widget? child) {
            return ValueListenableBuilder(
              valueListenable: countryController,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return ValueListenableBuilder(
                  valueListenable: emailController,
                  builder:
                      (BuildContext context, dynamic value, Widget? child) {
                    return ValueListenableBuilder(
                      valueListenable: passwordController,
                      builder:
                          (BuildContext context, dynamic value, Widget? child) {
                        return ElevatedButton(
                          onPressed: (fullNameController.text.isEmpty ||
                                  phoneNumberController.text.isEmpty ||
                                  countryController.text.isEmpty ||
                                  emailController.text.isEmpty ||
                                  passwordController.text.isEmpty)
                              ? null
                              : onPressed,
                          child: Text(
                            "Signup",
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
              },
            );
          },
        );
      },
    );
  }
}
