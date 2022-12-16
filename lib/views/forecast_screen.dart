import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:forecasting_app/controllers/onboarding_controller.dart';
import 'package:forecasting_app/controllers/weather_data_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../main.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({super.key});

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  final controller = Get.find<OnboardingController>();
  final weatherCotroller = Get.put(WeatherDataController());
  final today = formatDate(DateTime.now(), ["today", ', ', dd, ' ', MM]);
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      appColors.gradientColor1,
                      appColors.gradientColor2,
                      appColors.gradientColor2,
                    ],
                  ),
                ),
                padding: EdgeInsets.all(20.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(appIcons.locationIcon),
                              color: Colors.white,
                              height: 3.5.h,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              "Semarang",
                              style: appFonts.headingStyle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Icon(
                              Icons.expand_more,
                              color: appColors.whiteColor,
                            )
                          ],
                        ),
                        Image(
                          image: AssetImage(appIcons.logOut),
                          height: 3.h,
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Image(
                      image: AssetImage(
                        controller.loginModel!.liveWeather!.condition ==
                                "Cloudy"
                            ? appIcons.cloudyIcon
                            : controller.loginModel!.liveWeather!.condition ==
                                    "Sunny"
                                ? appIcons.sunnyIcon
                                : controller.loginModel!.liveWeather!
                                            .condition ==
                                        "Rainy"
                                    ? appIcons.rainyIcon
                                    : controller.loginModel!.liveWeather!
                                                .condition ==
                                            "Partly Cloudy"
                                        ? appIcons.partlyCloudIcon
                                        : controller.loginModel!.liveWeather!
                                                    .condition ==
                                                "Snow"
                                            ? appIcons.snowIcon
                                            : controller
                                                        .loginModel!
                                                        .liveWeather!
                                                        .condition ==
                                                    "Stormy"
                                                ? appIcons.stormyIcon
                                                : appIcons.thunderIcon,
                      ),
                      height: 20.h,
                      fit: BoxFit.contain,
                    ),
                    Container(
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
                            "${controller.loginModel!.liveWeather!.temperature}°",
                            textAlign: TextAlign.center,
                            style: appFonts.headingStyle.copyWith(
                              fontSize: 40.sp,
                              color: appColors.whiteColor,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            "${controller.loginModel!.liveWeather!.condition}",
                            textAlign: TextAlign.center,
                            style: appFonts.headingStyle.copyWith(
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
                            data:
                                "${controller.loginModel!.liveWeather!.temperature} °C",
                          ),
                          InfoWidget(
                            name: "Max Temparature",
                            data:
                                "${controller.loginModel!.liveWeather!.maxTemperature} °C",
                          ),
                          InfoWidget(
                            name: "Min Temparature",
                            data:
                                "${controller.loginModel!.liveWeather!.minTemperature} °C",
                          ),
                          InfoWidget(
                            name: "Condition",
                            data:
                                "${controller.loginModel!.liveWeather!.condition}",
                          ),
                          InfoWidget(
                            name: "WindSpeed",
                            data:
                                "${controller.loginModel!.liveWeather!.windSpeed} km/h",
                          ),
                          InfoWidget(
                            name: "Humidty",
                            data:
                                "${controller.loginModel!.liveWeather!.humidity} %",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40.sp),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: appColors.blackColor,
                            backgroundColor: appColors.whiteColor),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Forecast report",
                              style: appFonts.buttonTextStyle
                                  .copyWith(fontSize: 14.sp),
                            ),
                            SizedBox(width: 4.w),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12.sp,
                              color: appColors.blackColor,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 8.h,
                child: Image(
                  image: AssetImage(
                    appIcons.smallVector,
                  ),
                ),
              ),
              Positioned(
                top: -2.h,
                right: -1.h,
                child: Image(
                  image: AssetImage(
                    appIcons.vector,
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

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    required this.data,
    required this.name,
    Key? key,
  }) : super(key: key);
  final String? name;
  final String? data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(
                image: AssetImage(appIcons.bullet),
                height: 2.h,
              ),
              SizedBox(width: 3.w),
              Text(
                "$name",
                style:
                    appFonts.titleStyle.copyWith(color: appColors.whiteColor),
              ),
            ],
          ),
          Text(
            "$data",
            textAlign: TextAlign.right,
            style: appFonts.titleStyle.copyWith(color: appColors.whiteColor),
          ),
        ],
      ),
    );
  }
}
