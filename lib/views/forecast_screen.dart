import 'dart:developer';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:forecasting_app/controllers/onboarding_controller.dart';
import 'package:forecasting_app/utils/widgets/background_widget.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/weather_data_controller.dart';
import '../main.dart';
import 'detail_screen.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({super.key});

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  final controller = Get.find<OnboardingController>();
  final weatherCotroller = Get.put(WeatherDataController());
  final today = formatDate(DateTime.now(), ["today", ', ', dd, ' ', MM]);
  String? selectedCity = "Choose state";
  bool isLoading = false;
  String? minTemperature;
  String? maxTemperature;
  String? temperature;
  String? windSpeed;
  String? humidity;
  String? condition;

  @override
  Widget build(BuildContext context) {
    List<PopupMenuItem> cityList =
        List.generate(controller.citiesModel!.list!.length, (index) {
      final city = controller.citiesModel!.list![index];
      return PopupMenuItem(
        value: Text("${city.name}"),
        child: Row(
          children: [
            Image(
              image: AssetImage(appIcons.locationIcon),
              color: appColors.blackColor,
              height: 3.h,
            ),
            SizedBox(width: 3.w),
            Text("${city.name}"),
          ],
        ),
        onTap: () async {
          try {
            setState(() {
              isLoading = true;
              selectedCity = "${city.name}";

              log("id: ${city.id}");
            });
            await weatherCotroller.getCityData(
              cityId: city.id,
              token: controller.loginModel!.token,
            );
            temperature =
                "${weatherCotroller.cityDataModel!.data!.temperature!}";
            maxTemperature =
                "${weatherCotroller.cityDataModel!.data!.maxTemperature!}";
            minTemperature =
                "${weatherCotroller.cityDataModel!.data!.minTemperature!}";

            condition = weatherCotroller.cityDataModel!.data!.condition!;

            humidity = "${weatherCotroller.cityDataModel!.data!.humidity!}";
            windSpeed = "${weatherCotroller.cityDataModel!.data!.windSpeed!}";
            await weatherCotroller.getSmallForecastData(
              cityId: city.id,
              token: controller.loginModel!.token,
            );
            await weatherCotroller.getOtherForecastData(
              cityId: city.id,
              token: controller.loginModel!.token,
            );
          } finally {
            setState(() {
              isLoading = false;
            });
          }
        },
      );
    });
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SafeArea(
            child: BackgroundWidget(
          today: today,
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : SingleChildScrollView(
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
                              SizedBox(
                                width: 40.w,
                                child: PopupMenuButton(
                                  itemBuilder: (context) => cityList,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          selectedCity!,
                                          style: appFonts.titleStyle.copyWith(
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.expand_more,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Log out"),
                                      content:
                                          const Text("Do you want to log out?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("No"),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.pop(context);
              
                                            try {
                                              setState(() {
                                                isLoading = true;
                                              });
              
                                              showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return const AlertDialog(
                                                      content:
                                                          Text("logging out ..."),
                                                    );
                                                  });
                                            } finally {
                                              setState(() {
                                                isLoading = false;
                                              });
                                            }
                                          },
                                          child: const Text("Yes"),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Image(
                              image: AssetImage(appIcons.logOut),
                              height: 3.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Image(
                        image: AssetImage(
                          condition == "Cloudy"
                              ? appIcons.cloudyIcon
                              : condition == "Sunny"
                                  ? appIcons.sunnyIcon
                                  : condition == "Rainy"
                                      ? appIcons.rainyIcon
                                      : condition == "Partly Cloudy"
                                          ? appIcons.partlyCloudIcon
                                          : condition == "snow"
                                              ? appIcons.snowIcon
                                              : condition == "Stormy"
                                                  ? appIcons.stormyIcon
                                                  : condition == "Thunder"
                                                      ? appIcons.thunderIcon
                                                      : appIcons.cloudyIcon,
                        ),
                        height: 20.h,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 2.h),
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
                              condition ??
                                  "${controller.loginModel!.liveWeather!.condition}",
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
                              data: condition ??
                                  "${controller.loginModel!.liveWeather!.condition}",
                            ),
                            InfoWidget(
                              name: "WindSpeed",
                              data: windSpeed ??
                                  "${controller.loginModel!.liveWeather!.windSpeed}",
                            ),
                            InfoWidget(
                              name: "Humidty",
                              data: humidity ??
                                  "${controller.loginModel!.liveWeather!.humidity}",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 40.sp),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: appColors.whiteColor,
                          ),
                          onPressed: selectedCity == "Choose state"
                              ? null
                              : () {
                                  Get.to(() => DetailScreen(
                                        otherForecastModel:
                                            weatherCotroller.otherForecastModel,
                                        smallForecastModel:
                                            weatherCotroller.smallForecastModel,
                                      ));
                                },
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
        )),
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
          Row(
            children: [
              Text(
                "$data",
                textAlign: TextAlign.right,
                style:
                    appFonts.titleStyle.copyWith(color: appColors.whiteColor),
              ),
              Text(
                name == "Condition"
                    ? ""
                    : name == "Time"
                        ? ""
                        : name == "Humidty"
                            ? " %"
                            : name == "WindSpeed"
                                ? " km/h"
                                : " °C",
                style:
                    appFonts.titleStyle.copyWith(color: appColors.whiteColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
