import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';

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
