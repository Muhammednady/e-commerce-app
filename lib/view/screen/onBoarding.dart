import 'package:ecommerceapp/controller/onboarding_controller.dart';
import 'package:ecommerceapp/routes.dart';
import 'package:ecommerceapp/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/routes.dart';
import '../../data/datasources/constant/constant.dart';
import '../widget/on_boarding/onBoarding_btn.dart';
import '../widget/on_boarding/onboarding_dots.dart';
import '../widget/on_boarding/slider_item.dart';

class OnBoarding extends GetView<OnBoardingController> {
  const OnBoarding();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OnBoardingController());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<OnBoardingController>(
          init: controller,
          builder: (controller) => Column(children: [
            SizedBox(
              height: Get.height * 0.6,
              child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: (index) {
                    controller.changePage(index);
                  },
                  itemCount: AppOnBoardingItems.onBoardingItems.length,
                  itemBuilder: (context, index) => SliderItem(
                        title: AppOnBoardingItems.onBoardingItems[index].title,
                        imageUrl:
                            AppOnBoardingItems.onBoardingItems[index].imageUrl,
                        desc: AppOnBoardingItems.onBoardingItems[index].desc,
                      )),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const OnBoardingDots(),
            const Spacer(),
            OnBoardingButton(
              radius: 10.0,
              height: 40.0,
              margin: 40.0,
              text: controller.getCurrentPage == 0 ? "lets_go".tr : "Continue".tr,
              textColor: Colors.white,
              onClick: controller.next,
            ),
            // const SizedBox(
            //   height: 0.0,
            // ),
            TextButton(
                style: const ButtonStyle(),
                    // elevation: MaterialStatePropertyAll(3.0),
                    // shadowColor: MaterialStatePropertyAll(Colors.black)),
                onPressed: () {
                  // Get.offAllNamed(AppRoutes.LOGIN);
                  controller.skipToLogIn();
                },
                child:  Text(
                  'skip'.tr,
                  style:const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0),
                )),

            const SizedBox(
              height: 40.0,
            ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       TextButton(
            //           onPressed: () {
            //             Get.to(Login());
            //           },
            //           child: const Text(
            //             'SKIP',
            //             style: TextStyle(fontSize: 15.0),
            //           )),
            //       SmoothPageIndicator(
            //         controller: controller.pageController,
            //         count: controller.labels.length,
            //         effect: const ColorTransitionEffect(
            //           dotColor: Colors.grey,
            //           activeDotColor: Colors.deepPurple,
            //           dotHeight: 15.0,
            //           dotWidth: 15.0,
            //           //strokeWidth: 10.0
            //         ),
            //       ),
            //       Obx(
            //         () => TextButton(
            //             onPressed: () {
            //               controller.next();
            //             },
            //             child: Text(
            //               controller.currentPage.value != 3 ? 'NEXT' : 'GOT IT',
            //               style: const TextStyle(fontSize: 15.0),
            //             )),
            //       ),
            //     ],
            //   ),
            // ),
          ]),
        ),
      ),
    );
  }
}
