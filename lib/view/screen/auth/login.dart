import 'package:ecommerceapp/controller/auth/login_controller.dart';
import 'package:ecommerceapp/core/constant/allApp_constants.dart';
import 'package:ecommerceapp/core/constant/app_images.dart';
import 'package:ecommerceapp/core/constant/connection_status.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/functions/validate_input.dart';
import 'package:ecommerceapp/view/widget/auth/custom_field_auth.dart';
import 'package:ecommerceapp/view/widget/auth/custom_socialMedia_btn.dart';
import 'package:ecommerceapp/view/widget/auth/customtxt_bodyAuth.dart';
import 'package:ecommerceapp/view/widget/auth/customtxt_titleAuth.dart';
import 'package:ecommerceapp/view/widget/on_boarding/onBoarding_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';
import '../../../core/functions/exitalert_app.dart';
import '../../../core/localization/change_lang.dart';

class Login extends GetView<LoginController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    //LoginControler controller = LoginControler.I;
    //This is the best status of initializing any controller
    Get.lazyPut(() => LoginController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey2,
        title: Text(
          'log_in'.tr,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.settings);
              },
              icon: const Icon(CupertinoIcons.settings))
        ],
      ),
      body: GetBuilder<LoginController>(
        init: controller,
        builder: (controller) => WillPopScope(
          onWillPop: exitAlertApp,
          child: Container(
            color: AppColors.grey2,
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
            child: Form(
              key: controller.formkey,
              child: ListView(
                children: [
                  Image.asset(AppImagesPath.logo, height: 130, width: 130),
                  const SizedBox(
                    height: 5.0,
                  ),
                  CustomTitleAuthText(title: 'welcome_back'.tr),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomBodyAuthText(bodyText: 'login_welcome_desc'.tr),
                  const SizedBox(
                    height: 10.0,
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
                    height: 20.0,
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
                            LanguageController.I.languageApp!.languageCode ==
                                    'en'
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                        child: InkWell(
                            onTap: () {
                              controller.goToForgetPassword();
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                'forget_password'.tr,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    decoration: TextDecoration.underline),
                              ),
                            ))),
                  ),
                  Obx(
                    () => controller.isLoading.value
                        ? const Center(
                          child:  CircularProgressIndicator()
                        )
                        : OnBoardingButton(
                            height: 50.0,
                            radius: 50.0,
                            margin: 0.0,
                            text: 'log_in'.tr,
                            textColor: AppColors.white,
                            onClick: () async {
                              await controller.login();
                            }),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'have_not_account'.tr,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      InkWell(
                        onTap: () {
                          controller.goToSignUp();
                        },
                        child: Text(
                          'sign_up'.tr,
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
      ),
    );
  }
}
