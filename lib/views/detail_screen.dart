import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:forecasting_app/models/other_forecast_model.dart';
import 'package:forecasting_app/models/small_forecast_model.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../main.dart';
import '../utils/widgets/background_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    required this.otherForecastModel,
    required this.smallForecastModel,
    super.key,
  });
  final OtherForecastModel? otherForecastModel;
  final SmallForecastModel? smallForecastModel;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final today = formatDate(DateTime.now(), [M, ', ', dd]);
  final day1 =
      formatDate(DateTime.now().add(const Duration(days: 1)), [M, ', ', dd]);
  final day2 =
      formatDate(DateTime.now().add(const Duration(days: 2)), [M, ', ', dd]);
  final day3 =
      formatDate(DateTime.now().add(const Duration(days: 2)), [M, ', ', dd]);
  final day4 =
      formatDate(DateTime.now().add(const Duration(days: 4)), [M, ', ', dd]);
  final day5 =
      formatDate(DateTime.now().add(const Duration(days: 5)), [M, ', ', dd]);
  final day6 =
      formatDate(DateTime.now().add(const Duration(days: 6)), [M, ', ', dd]);
  final day7 =
      formatDate(DateTime.now().add(const Duration(days: 7)), [M, ', ', dd]);
  @override
  Widget build(BuildContext context) {
    final data = widget.otherForecastModel!.data!;
    return Scaffold(
      body: SafeArea(
        child: BackgroundWidget(
          today: today,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Row(
                    children: [
                      SizedBox(width: 2.w),
                      Icon(
                        Icons.arrow_back_ios,
                        color: appColors.whiteColor,
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        "Back",
                        style: appFonts.subHeadingStyle.copyWith(
                          color: appColors.whiteColor,
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today",
                      style: appFonts.headingStyle,
                    ),
                    Text(
                      today,
                      style: appFonts.subHeadingStyle,
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                SizedBox(
                  height: 15.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: widget.smallForecastModel!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final smallWeather =
                          widget.smallForecastModel!.data![index];
                      final condition = smallWeather.condition;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${smallWeather.temperature} °C",
                            style: appFonts.titleStyle,
                          ),
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
                            height: 8.h,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            "${smallWeather.time}",
                            style: appFonts.titleStyle,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Next Forecast",
                      style: appFonts.headingStyle,
                    ),
                    Image(
                      image: AssetImage(appIcons.calender),
                      height: 2.h,
                    )
                  ],
                ),
                SizedBox(height: 2.h),
                NextForecastWidget(
                  day: day1,
                  condition: data.day1!.condition!,
                  temperature: "${data.day1!.temperature!}",
                ),
                NextForecastWidget(
                  day: day2,
                  condition: data.day2!.condition!,
                  temperature: "${data.day2!.temperature!}",
                ),
                NextForecastWidget(
                  day: day3,
                  condition: data.day3!.condition!,
                  temperature: "${data.day3!.temperature!}",
                ),
                NextForecastWidget(
                  day: day4,
                  condition: data.day4!.condition!,
                  temperature: "${data.day4!.temperature!}",
                ),
                NextForecastWidget(
                  day: day5,
                  condition: data.day5!.condition!,
                  temperature: "${data.day5!.temperature!}",
                ),
                NextForecastWidget(
                  day: day6,
                  condition: data.day6!.condition!,
                  temperature: "${data.day6!.temperature!}",
                ),
                NextForecastWidget(
                  day: day7,
                  condition: data.day7!.condition!,
                  temperature: "${data.day7!.temperature!}",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NextForecastWidget extends StatelessWidget {
  const NextForecastWidget({
    Key? key,
    required this.condition,
    required this.temperature,
    required this.day,
  }) : super(key: key);

  final String day;
  final String condition;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          day,
          style: appFonts.titleStyle,
        ),
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
          height: 8.h,
          fit: BoxFit.contain,
        ),
        Text(
          "$temperature °C",
          style: appFonts.titleStyle,
        ),
      ],
    );
  }
}
