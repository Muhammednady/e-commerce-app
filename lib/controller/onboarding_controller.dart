import 'package:ecommerceapp/core/services/myservices.dart';
import 'package:ecommerceapp/view/screen/onBoarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/allApp_constants.dart';
import '../core/constant/routes.dart';
import '../data/datasources/constant/constant.dart';
import '../routes.dart';

class OnBoardingController extends GetxController {
  static final I = Get.put<OnBoardingController>(OnBoardingController());
  late MyServices myservices;

  @override
  void onInit() {
    myservices = Get.find<MyServices>();
    // TODO: implement onInit
    super.onInit();
  }

  PageController pageController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 0.9);
  RxInt currentPage = 0.obs;

  get getCurrentPage => currentPage.value;

  void changePage(int x) {
    currentPage.value = x;
    update();
  }

  void next() {
    currentPage.value++;
    if (currentPage.value > AppOnBoardingItems.onBoardingItems.length - 1) {
      //currentPage.value = 0;
      myservices.sharedPreferences.setBool(ONBOARDING, true);
      Get.offNamed(AppRoutes.LOGIN);
      //Shared Preferences store (onboarding = true;) to check it at the start
    } else {
      pageController.animateToPage(currentPage.value,
          duration: const Duration(microseconds: 600), curve: Curves.easeInOut);
    }
  }

  void skipToLogIn() {
    myservices.sharedPreferences.setBool(ONBOARDING, true);
    Get.offNamed(AppRoutes.LOGIN);
  }
}
