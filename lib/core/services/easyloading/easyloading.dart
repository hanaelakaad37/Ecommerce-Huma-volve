import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


void configureEasyLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..maskType = EasyLoadingMaskType.none
    ..toastPosition = EasyLoadingToastPosition.center
    ..animationStyle = EasyLoadingAnimationStyle.opacity
    ..indicatorSize = 44
    ..radius = 6
    ..progressColor =  Colors.white
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.white
    ..textColor = Colors.black
    ..maskColor = Colors.white

    ..userInteractions = true
    ..dismissOnTap = false;

}