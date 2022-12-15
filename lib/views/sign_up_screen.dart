import 'package:flutter/material.dart';
import 'package:forecasting_app/main.dart';
import 'package:forecasting_app/utils/textfield_style.dart';
import 'package:forecasting_app/utils/widgets/login_widget.dart';
import 'package:forecasting_app/views/congratulation_screen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final isSecured = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
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
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => const CongratulationScreens());
                    },
                    child: Text(
                      "Signup",
                      style: appFonts.bodyStyle.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
