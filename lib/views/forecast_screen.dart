import 'dart:developer';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:forecasting_app/controllers/onboarding_controller.dart';
import 'package:forecasting_app/utils/widgets/background_widget.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../controllers/weather_data_controller.dart';
import '../main.dart';
import '../utils/widgets/weather_data_card_widget.dart';
import 'detail_screen.dart';
import 'sign_in_screen.dart';

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
              ? const LoadingWidget()
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DropDownWidget(
                        cityList: cityList,
                        selectedCity: selectedCity,
                      ),
                      SizedBox(height: 4.h),
                      ConditionImageWidget(
                        condition: condition,
                      ),
                      SizedBox(height: 2.h),
                      WeatherDataCard(
                        today: today,
                        temperature: temperature,
                        controller: controller,
                        condition: condition,
                        maxTemperature: maxTemperature,
                        minTemperature: minTemperature,
                        windSpeed: windSpeed,
                        humidity: humidity,
                      ),
                      SizedBox(height: 4.h),
                      ForecastReportButton(
                        selectedCity: selectedCity,
                        weatherCotroller: weatherCotroller,
                      )
                    ],
                  ),
                ),
        )),
      ),
    );
  }
}

class ForecastReportButton extends StatelessWidget {
  const ForecastReportButton({
    Key? key,
    required this.selectedCity,
    required this.weatherCotroller,
  }) : super(key: key);

  final String? selectedCity;
  final WeatherDataController weatherCotroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.sp),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: appColors.whiteColor,
        ),
        onPressed: selectedCity == "Choose state"
            ? () {
                Get.snackbar(
                  "Choose State",
                  "Choose a state to load data",
                );
              }
            : () {
                Get.to(() => DetailScreen(
                      otherForecastModel: weatherCotroller.otherForecastModel,
                      smallForecastModel: weatherCotroller.smallForecastModel,
                    ));
              },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Forecast report",
              style: appFonts.buttonTextStyle.copyWith(fontSize: 14.sp),
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
    );
  }
}

class ConditionImageWidget extends StatelessWidget {
  const ConditionImageWidget({
    Key? key,
    required this.condition,
  }) : super(key: key);

  final String? condition;

  @override
  Widget build(BuildContext context) {
    return Image(
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
    );
  }
}

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    Key? key,
    required this.cityList,
    required this.selectedCity,
  }) : super(key: key);

  final List<PopupMenuItem> cityList;
  final String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: appColors.shadowRedColor,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(15.sp),
                          child: Image(
                            image: AssetImage(appIcons.logOut),
                            height: 10.h,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "Log out",
                          style: appFonts.titleStyle.copyWith(
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    content: Text(
                      "Are you sure you want to logout from app",
                      style: appFonts.bodyStyle.copyWith(
                        fontSize: 10.sp,
                      ),
                    ),
                    actionsAlignment: MainAxisAlignment.center,
                    alignment: Alignment.center,
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: appColors.whiteColor,
                          backgroundColor: appColors.redColor,
                        ),
                        onPressed: () async {
                          Get.off(() => const SignInScreen());
                        },
                        child: const Text("Logout"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 1,
                          foregroundColor: appColors.blackColor,
                          backgroundColor:
                              appColors.blackColor.withOpacity(.002),
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
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
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset("assets/loading.json"),
    );
  }
}
