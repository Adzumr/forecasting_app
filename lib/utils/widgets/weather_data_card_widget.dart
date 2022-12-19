import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/onboarding_controller.dart';
import '../../main.dart';
import 'info_widget.dart';

class WeatherDataCard extends StatelessWidget {
  const WeatherDataCard({
    Key? key,
    required this.today,
    required this.temperature,
    required this.controller,
    required this.condition,
    required this.maxTemperature,
    required this.minTemperature,
    required this.windSpeed,
    required this.humidity,
  }) : super(key: key);

  final String today;
  final String? temperature;
  final OnboardingController controller;
  final String? condition;
  final String? maxTemperature;
  final String? minTemperature;
  final String? windSpeed;
  final String? humidity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.3),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 1.sp,
            color: appColors.whiteColor,
          )),
      padding: EdgeInsets.all(15.sp),
      margin: EdgeInsets.all(5.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            today,
            textAlign: TextAlign.center,
            style: appFonts.titleStyle.copyWith(
              color: appColors.whiteColor,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            temperature ??
                "${controller.loginModel!.liveWeather!.temperature}°",
            textAlign: TextAlign.center,
            style: appFonts.subHeadingStyle.copyWith(
              fontSize: 40.sp,
              color: appColors.whiteColor,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            condition ?? "${controller.loginModel!.liveWeather!.condition}",
            textAlign: TextAlign.center,
            style: appFonts.subHeadingStyle.copyWith(
              color: appColors.whiteColor,
            ),
          ),
          SizedBox(height: 2.h),
          InfoWidget(
            name: "Time",
            data: TimeOfDay.now().format(context),
          ),
          InfoWidget(
            name: "Temparature",
            data: temperature ??
                "${controller.loginModel!.liveWeather!.temperature}",
          ),
          InfoWidget(
            name: "Max Temparature",
            data: maxTemperature ??
                "${controller.loginModel!.liveWeather!.maxTemperature}",
          ),
          InfoWidget(
            name: "Min Temparature",
            data: minTemperature ??
                "${controller.loginModel!.liveWeather!.minTemperature}",
          ),
          InfoWidget(
            name: "Condition",
            data:
                condition ?? "${controller.loginModel!.liveWeather!.condition}",
          ),
          InfoWidget(
            name: "WindSpeed",
            data:
                windSpeed ?? "${controller.loginModel!.liveWeather!.windSpeed}",
          ),
          InfoWidget(
            name: "Humidty",
            data: humidity ?? "${controller.loginModel!.liveWeather!.humidity}",
          ),
        ],
      ),
    );
  }
}