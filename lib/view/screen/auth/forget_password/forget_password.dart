import 'package:ecommerceapp/controller/auth/forget_password/forgetpassword_controller.dart';
import 'package:ecommerceapp/core/constant/allApp_constants.dart';
import 'package:ecommerceapp/core/constant/app_images.dart';
import 'package:ecommerceapp/view/widget/auth/custom_field_auth.dart';
import 'package:ecommerceapp/view/widget/auth/customtxt_bodyAuth.dart';
import 'package:ecommerceapp/view/widget/auth/customtxt_titleAuth.dart';
import 'package:ecommerceapp/view/widget/on_boarding/onBoarding_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/connection_status.dart';
import '../../../../core/localization/change_lang.dart';

class Forgetpassword extends GetView<ForgetPasswordController> {
  //final String screenType;

  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordController controller = ForgetPasswordController.I;
    Get.lazyPut(() => ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey2,
        title: Padding(
          padding: const EdgeInsets.only(top: 0.0), // adjust padding ahead
          child: Text(
            'forget_password'.tr.replaceFirst(
                LanguageController.I.languageApp!.languageCode == 'en'
                    ? '?'
                    : '؟',
                ' '),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.grey2,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
        child: GetBuilder<ForgetPasswordController>(
          init: controller,
          builder: (controller) => ListView(
            children: [
              const SizedBox(
                height: 15.0,
              ),
              CustomTitleAuthText(title: 'check_email'.tr),
              const SizedBox(
                height: 10.0,
              ),
              CustomBodyAuthText(
                bodyText: 'forget_desc'.tr,
              ),
              const SizedBox(
                height: 15.0,
              ),
              if (controller.connectionStatus == ConnectionStatus.LOADING)
                const LinearProgressIndicator(
                  color: AppColors.primary,
                ),
              const SizedBox(height: 10.0),
              CustomAuthField(
                  obsecureText: false,
                  controller: controller.emailController!,
                  hint: 'enter_email'.tr,
                  label: LanguageController.I.languageApp!.languageCode == 'en'
                      ? 'Email'
                      : 'الايميل',
                  textInputType: TextInputType.text,
                  prefixIcon: Icons.email_outlined),
              const SizedBox(
                height: 20.0,
              ),
              OnBoardingButton(
                  height: 50.0,
                  radius: 50.0,
                  margin: 0.0,
                  text: 'check'.tr,
                  textColor: AppColors.white,
                  onClick: () {
                    controller.checkEmail();
                  }),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'return_login'.tr,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  InkWell(
                    onTap: () {
                      controller.gotoLogIn();
                    },
                    child: Text(
                      'log_in'.tr,
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
