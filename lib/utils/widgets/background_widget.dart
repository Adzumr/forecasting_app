import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key? key,
    required this.today,
    required this.child,
  }) : super(key: key);

  final String today;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Stack(
        children: [
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
          child!,
        ],
      ),
    );
  }
}
