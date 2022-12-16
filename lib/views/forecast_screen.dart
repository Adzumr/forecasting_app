import 'package:flutter/material.dart';
import 'package:forecasting_app/controllers/onboarding_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({super.key});

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  final controller = Get.find<OnboardingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "mixTemperature: ${controller.loginModel!.liveWeather!.minTemperature!}"),
              Text(
                  "maxTemperature: ${controller.loginModel!.liveWeather!.maxTemperature!}"),
              Text(
                  "temperature: ${controller.loginModel!.liveWeather!.temperature!}"),
              Text(
                  "condition: ${controller.loginModel!.liveWeather!.condition!}"),
              Text(
                  "windSpeed: ${controller.loginModel!.liveWeather!.windSpeed!}"),
              Text(
                  "humidity: ${controller.loginModel!.liveWeather!.humidity!}"),
            ],
          ),
        ),
      ),
    );
  }
}
