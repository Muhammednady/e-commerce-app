import 'package:ecommerceapp/controller/auth/forget_password/forgetpassword_controller.dart';
import 'package:ecommerceapp/controller/auth/signup_controller.dart';
import 'package:ecommerceapp/core/constant/allApp_constants.dart';
import 'package:ecommerceapp/core/constant/connection_status.dart';
import 'package:ecommerceapp/data/datasources/remote/auth/forgetpassword/verifycode_forgetpassword.dart';
import 'package:ecommerceapp/view/screen/auth/forget_password/successResetPasswordOrSignUp.dart';
import 'package:ecommerceapp/view/screen/auth/forget_password/verify_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes.dart';
import '../../../data/datasources/remote/auth/verifycode_provider.dart';

class VerificationController extends GetxController {
  static VerificationController get I => Get.put(VerificationController());

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments;
    print('email is ========= $email');
  }

  late String email;
  ConnectionStatus connectionStatus = ConnectionStatus.NONE;

  void checkVerificationCode(String verificationCode, String screenType) async {
    connectionStatus = ConnectionStatus.LOADING;
    update();
    Map data = {
      'email': email,
      // 'email': screenType == CONFIRM_USER
      //     ? SignUpControler.I.emailController.text
      //     : ForgetPasswordController.I.emailController.text,
      'code': verificationCode
    };

    if (screenType == FORGET_PASSWORD) {

      var res = await VerifyCodeForgetProvider(crud: Get.find()).verifyCode(data);
      if (res is ConnectionStatus) {
        connectionStatus = res ;
        Get.snackbar(
            'error'.tr,
            res == ConnectionStatus.SERVERFAILURE
                ? 'server_failure'.tr
                : 'offline_failure'.tr);

      } else {
        connectionStatus = ConnectionStatus.SUCCESS;
        // if (res['status'] == FAILURE_RESPONSE) {
        //   Get.snackbar('alert'.tr, 'correct_vc'.tr);
        // } else {
        gotoResetPassword();

        //}
      }


    } else if (screenType == CONFIRM_USER) {
      var res = await VerifyCodeProvider(crud: Get.find()).verifyCode(data);
      if (res is ConnectionStatus) {
        connectionStatus = res ;
        Get.snackbar(
            'error'.tr,
            res == ConnectionStatus.SERVERFAILURE
                ? 'server_failure'.tr
                : 'offline_failure'.tr);

      } else {
        connectionStatus = ConnectionStatus.SUCCESS;
        // if (res['status'] == FAILURE_RESPONSE) {
        //   Get.snackbar('alert'.tr, 'correct_vc'.tr);
        // } else {
        goToSuccessResetPasswordOrSignUp();
        //}
      }

    }


    update();
  }

  bool verifyCode(String code, String email) {
    return true;
  }

  // void goToForgetPassword(){
  //   Get.toNamed(AppRoutes.verifyEmail);
  // }
  void goToSuccessResetPasswordOrSignUp() {
    Get.off(SuccessResetPasswordOrSignUp(screenType: CONFIRM_USER));
  }

  void gotoResetPassword() {
    Get.offNamed(AppRoutes.resetPassword , arguments: email);
  }
}
