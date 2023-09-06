// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

vGap(double height) {
  return SizedBox(
    height: height,
  );
}

hGap(double width) {
  return SizedBox(width: width);
}

void showSuccessMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Center(child: Text(message)),
    backgroundColor: Colors.green,
  ));
}

void showErrorMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Center(child: Text(message)),
    backgroundColor: Colors.red,
  ));
}

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 650;
bool isTab(BuildContext context) =>
    MediaQuery.of(context).size.width < 1300 &&
    MediaQuery.of(context).size.width >= 600;
bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 1300;

class GetXSnackbar {
  static void showSuccessSnackbar({
    String title = '',
    String message = '',
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = Colors.black54,
    Color textColor = Colors.white,
    SnackPosition position = SnackPosition.BOTTOM,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      colorText: textColor,
      duration: duration,
      snackPosition: position,
    );
  }
}

class GetXErrorSnackbar {
  static void showErrorSnackbar({
    String title = '',
    String message = '',
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = Colors.black54,
    Color textColor = Colors.white,
    SnackPosition position = SnackPosition.BOTTOM,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      colorText: textColor,
      duration: duration,
      snackPosition: position,
    );
  }
}
