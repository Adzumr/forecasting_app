import 'package:flutter/material.dart';
import 'package:forecasting_app/main.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomErrorScreen extends StatefulWidget {
  // final FlutterErrorDetails errorDetails;

  const CustomErrorScreen({
    Key? key,
    // required this.errorDetails,
  }) : super(key: key);

  @override
  State<CustomErrorScreen> createState() => _CustomErrorScreenState();
}

class _CustomErrorScreenState extends State<CustomErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(appIcons.error),
            Text(
              'Oups!',
              textAlign: TextAlign.center,
              style: appFonts.titleStyle.copyWith(
                color: Colors.red,
                fontSize: 25.sp,
              ),
            ),
            Column(
              children: [
                SizedBox(height: 2.h),
                Text(
                  'Something went wrong!',
                  textAlign: TextAlign.center,
                  style: appFonts.titleStyle.copyWith(
                    color: Colors.red,
                    fontSize: 18.sp,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "We encountered an error and we've notified our engineering team about it. Sorry for the inconvenience caused.",
                  textAlign: TextAlign.center,
                  style: appFonts.bodyStyle.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "Back",
                style: appFonts.titleStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
