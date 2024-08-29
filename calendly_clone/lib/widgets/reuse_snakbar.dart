import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReuseSnakbar {
  void snakbar(String message) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      borderRadius: 10,
      margin: EdgeInsets.symmetric(horizontal: 2.h, vertical: 4.h),
      duration: const Duration(seconds: 2),
    ));
  }
}
