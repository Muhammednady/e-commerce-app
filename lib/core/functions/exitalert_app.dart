import 'dart:async';
import 'dart:io';

import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> exitAlertApp() {
  Get.defaultDialog(
      backgroundColor: AppColors.primary,
      title: 'alert'.tr,
      titleStyle: const TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          //decoration: TextDecoration.underline,
          color: Colors.white),
      middleText: 'question_close'.tr,
      middleTextStyle: const TextStyle(fontSize: 15.0, color: Colors.white),
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text('ok'.tr)),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('cancel'.tr)),
      ]);

  return Future.value(bool as FutureOr<bool>?);
}
