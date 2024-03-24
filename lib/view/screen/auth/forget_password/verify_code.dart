import 'dart:ui';

import 'package:ecommerceapp/view/widget/auth/customtxt_bodyAuth.dart';
import 'package:ecommerceapp/view/widget/auth/customtxt_titleAuth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forget_password/verify_controller.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/connection_status.dart';

class VerifyCode extends GetView<VerificationController> {
  final String screenType;

  const VerifyCode({super.key, required this.screenType});

 // String get email => Get.arguments;

  @override
  Widget build(BuildContext context) {
    String email = Get.arguments;
    //VerificationController controller = VerificationController.I;
    Get.lazyPut(() => VerificationController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey2,
        title: Text(
          'verify_code'.tr,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<VerificationController>(
        init: controller,
        builder: (controller) => Container(
          color: AppColors.grey2,
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              CustomTitleAuthText(title: 'check_code'.tr),
              const SizedBox(
                height: 10.0,
              ),
              CustomBodyAuthText(bodyText: 'enter_vcode'.tr),
              const SizedBox(
                height: 0.0,
              ),
              Text(
                email,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 15.0,
                    color: AppColors.primary,
                    decoration: TextDecoration.underline),
              ),
              const SizedBox(
                height: 10.0,
              ),
              if (controller.connectionStatus == ConnectionStatus.LOADING)
                const LinearProgressIndicator(
                  color: AppColors.primary,
                ),
              const SizedBox(
                height: 10,
              ),
              OtpTextField(
                numberOfFields: 5,
                focusedBorderColor: AppColors.primary,
                borderRadius: BorderRadius.circular(50.0),
                enabledBorderColor: Colors.grey,
                cursorColor: AppColors.primary,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                keyboardType: TextInputType.number,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  controller.checkVerificationCode(
                      verificationCode, screenType);

                  // showDialog(
                  //     context: context,
                  //     builder: (context){
                  //       return AlertDialog(
                  //         title: Text("Verification Code"),
                  //         content: Text('Code entered is $verificationCode'),
                  //       );
                  //     }
                  // );
                }, // end onSubmit
              ),

              const SizedBox(
                height: 20.0,
              ),
              // OnBoardingButton(
              //     height: 50.0,
              //     radius: 50.0,
              //     margin: 0.0,
              //     text: 'log_in'.tr,
              //     textColor: AppColors.white,
              //     onClick: () {}),
              // const SizedBox(
              //   height: 20.0,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
