import 'package:ecommerceapp/controller/auth/forget_password/resetpassword_controller.dart';
import 'package:ecommerceapp/core/constant/allApp_constants.dart';
import 'package:ecommerceapp/core/constant/connection_status.dart';
import 'package:ecommerceapp/core/functions/validate_input.dart';
import 'package:ecommerceapp/view/widget/auth/customtxt_bodyAuth.dart';
import 'package:ecommerceapp/view/widget/auth/customtxt_titleAuth.dart';
import 'package:ecommerceapp/view/widget/on_boarding/onBoarding_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/localization/change_lang.dart';
import '../../../widget/auth/custom_field_auth.dart';

class ResetPassword extends GetView<ResetPasswordController> {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // ResetPasswordController controller = ResetPasswordController.I;
    Get.lazyPut(() => ResetPasswordController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey2,
        title: Text(
          'reset_password'.tr,
          style:
              Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 22.0),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<ResetPasswordController>(
          init: controller,
          builder: (controller) {
            return Container(
              color: AppColors.grey2,
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
              child: Form(
                key: controller.formKey,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTitleAuthText(title: 'new_password'.tr),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomBodyAuthText(bodyText: 'new_password_desc'.tr),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomAuthField(
                      obsecureText: true,
                      controller: controller.passwordController1!,
                      hint: 'enter_password'.tr,
                      label:
                          LanguageController.I.languageApp!.languageCode == 'en'
                              ? 'Password'
                              : 'كلمة المرور',
                      textInputType: TextInputType.number,
                      prefixIcon: Icons.lock_outline,
                      validate: (String? val) =>
                          validateInput(val!, 8, 16, PASSWORD),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomAuthField(
                      obsecureText: true,
                      controller: controller.passwordController2!,
                      hint: 'reenter_password'.tr,
                      label:
                          LanguageController.I.languageApp!.languageCode == 'en'
                              ? 'Password'
                              : 'كلمة المرور',
                      textInputType: TextInputType.number,
                      prefixIcon: Icons.lock_outline,
                      validate: (String? val) =>
                          validateInput(val!, 8, 16, PASSWORD),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    controller.connectionStatus == ConnectionStatus.LOADING
                        ? const Center(
                            child: CircularProgressIndicator(color: AppColors.primary,),
                          )
                        : OnBoardingButton(
                            height: 50.0,
                            radius: 50.0,
                            margin: 0.0,
                            text: 'reset_password'.tr,
                            textColor: AppColors.white,
                            onClick: () async {
                              await controller.resetPassword();
                            }),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
