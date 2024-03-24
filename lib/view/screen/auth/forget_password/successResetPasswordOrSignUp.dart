import 'package:ecommerceapp/core/constant/allApp_constants.dart';
import 'package:ecommerceapp/view/widget/auth/customtxt_bodyAuth.dart';
import 'package:ecommerceapp/view/widget/auth/customtxt_titleAuth.dart';
import 'package:ecommerceapp/view/widget/on_boarding/onBoarding_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../controller/auth/forget_password/successReset_controller.dart';
import '../../../../core/constant/app_images.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/localization/change_lang.dart';

class SuccessResetPasswordOrSignUp extends GetView<SuccessResetController> {
  final String screenType;

  const SuccessResetPasswordOrSignUp({required this.screenType, super.key});

  @override
  Widget build(BuildContext context) {
    // var controller = SuccessResetController.I;
    Get.lazyPut(() => SuccessResetController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey2,
        title: Text(
          'success'.tr,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<SuccessResetController>(
        init: controller,
        builder: (controller) {
          return Container(
            color: AppColors.grey2,
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
            child: Column(
              children: [
                // const Icon(
                //   CupertinoIcons.check_mark_circled,
                //   size: 200.0,
                //   color: AppColors.primary,
                // ),
                Lottie.asset(AppImagesPath.success , width: 250,height: 250),
                const SizedBox(
                  height: 0.0,
                ),
                CustomTitleAuthText(title: 'congratulations'.tr),
                const SizedBox(
                  height: 10.0,
                ),
                CustomBodyAuthText(
                    bodyText: screenType == FORGET_PASSWORD
                        ? 'pass_update_success'.tr
                        : 'email_been_confirmed'.tr),
                const Spacer(),
                OnBoardingButton(
                    height: 50.0,
                    radius: 50.0,
                    margin: 0.0,
                    text: 'return_login'.tr.replaceAll(
                        LanguageController.I.languageApp!.languageCode == 'en'
                            ? '?'
                            : '؟',
                        ''),
                    textColor: AppColors.white,
                    onClick: () {
                      controller.backToLogIn();
                    }),
              ],
            ),
          );
        }
      ),
    );
  }
}
