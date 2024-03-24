//
// appBar: AppBar(title: const Text('Sign up'),),
// body: const Center(child: Text('Sign up'),),

import 'package:ecommerceapp/controller/auth/signup_controller.dart';
import 'package:ecommerceapp/core/constant/app_images.dart';
import 'package:ecommerceapp/core/constant/connection_status.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/localization/change_lang.dart';
import 'package:ecommerceapp/view/widget/auth/custom_field_auth.dart';
import 'package:ecommerceapp/view/widget/auth/custom_socialMedia_btn.dart';
import 'package:ecommerceapp/view/widget/auth/customtxt_bodyAuth.dart';
import 'package:ecommerceapp/view/widget/auth/customtxt_titleAuth.dart';
import 'package:ecommerceapp/view/widget/on_boarding/onBoarding_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/allApp_constants.dart';
import '../../../core/constant/colors.dart';
import '../../../core/functions/validate_input.dart';

class SignUpView extends GetView<SignUpControler> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControler controller = SignUpControler.I;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey2,
        title: Text(
          'sign_up'.tr,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<SignUpControler>(
        init: controller,
        builder: (controller) => Container(
          color: AppColors.grey2,
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
          child: Form(
            key: controller.formkey,
            child: ListView(
              children: [
                CustomTitleAuthText(title: 'welcome_back'.tr),
                const SizedBox(
                  height: 10.0,
                ),
                CustomBodyAuthText(bodyText: 'signup_welcome_desc'.tr),
                const SizedBox(
                  height: 10.0,
                ),
                CustomAuthField(
                    obsecureText: false,
                    validate: controller.validateUsername,
                    controller: controller.userNameController!,
                    hint: "enter_username".tr,
                    label:
                        LanguageController.I.languageApp!.languageCode == 'en'
                            ? 'username'
                            : 'اسم المستخدم',
                    textInputType: TextInputType.name,
                    prefixIcon: Icons.person_outline),
                const SizedBox(
                  height: 15.0,
                ),
                CustomAuthField(
                    obsecureText: false,
                    validate: controller.validateEmail,
                    controller: controller.emailController!,
                    hint: 'enter_email'.tr,
                    label:
                        LanguageController.I.languageApp!.languageCode == 'en'
                            ? 'Email'
                            : 'الايميل',
                    textInputType: TextInputType.text,
                    prefixIcon: Icons.email_outlined),
                const SizedBox(
                  height: 15.0,
                ),
                CustomAuthField(
                    obsecureText: false,
                    validate: controller.validatephone,
                    controller: controller.phoneController!,
                    hint: "enter_phonenumber".tr,
                    label:
                        LanguageController.I.languageApp!.languageCode == 'en'
                            ? 'phone'
                            : 'رقم الموبايل',
                    textInputType: TextInputType.phone,
                    prefixIcon: Icons.phone_android),
                const SizedBox(
                  height: 15.0,
                ),
                Obx(
                  () => CustomAuthField(
                    validate: (val) => validateInput(val!, 8, 16, PASSWORD),
                    controller: controller.passwordController!,
                    hint: 'enter_password'.tr,
                    label:
                        LanguageController.I.languageApp!.languageCode == 'en'
                            ? 'Password'
                            : 'كلمة المرور',
                    textInputType: TextInputType.number,
                    prefixIcon: Icons.lock_outline,
                    obsecureText: controller.obsecureText.value,
                    suffixIcon: controller.visibIcon.value,
                    onClick: controller.toggleVisibility,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Align(
                      alignment:
                          LanguageController.I.languageApp!.languageCode == 'en'
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            controller.goToForgetPassword();
                          },
                          child: Text(
                            'forget_password'.tr,
                            style: const TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.underline,
                            ),
                          ))),
                ),
               controller.connectionStatus == ConnectionStatus.LOADING
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : OnBoardingButton(
                    height: 50.0,
                    radius: 50.0,
                    margin: 0.0,
                    text: 'sign_up'.tr,
                    textColor: AppColors.white,
                    onClick: () async {
                      await controller.signup();
                      //
                    }),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'have_account'.tr,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    InkWell(
                      onTap: () {
                        controller.goToLogIn();
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
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton(
                      dimension: 50.0,
                      image: AppImagesPath.facebook,
                      onPressed: () {},
                    ),
                    SocialMediaButton(
                      dimension: 50.0,
                      image: AppImagesPath.google,
                      onPressed: () {},
                    ),
                    SocialMediaButton(
                      dimension: 50.0,
                      image: AppImagesPath.twitter,
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
