
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../data/datasources/constant/constant.dart';

class OnBoardingDots extends GetView<OnBoardingController> {
  const OnBoardingDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      init:controller,
      builder:(controller)=> Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            AppOnBoardingItems.onBoardingItems.length,
                (index) => AnimatedContainer(
              curve: Curves.fastEaseInToSlowEaseOut,
              margin: const EdgeInsets.only(right: 5.0),
              height: 5.0,
              width: controller.getCurrentPage == index ? 30.0 : 5.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: //controller.getCurrentPage == index
                  AppColors.primary
                // : AppColors.DESC,
                //shape: BoxShape.circle,
              ),
              duration: const Duration(
                microseconds: 600,
              ),
            ),
          )),
    );
  }
}
