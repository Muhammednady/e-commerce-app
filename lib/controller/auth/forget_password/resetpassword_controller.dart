import 'package:ecommerceapp/core/constant/allApp_constants.dart';
import 'package:ecommerceapp/data/datasources/remote/auth/forgetpassword/resetpassword_provider.dart';
import 'package:ecommerceapp/view/screen/auth/forget_password/successResetPasswordOrSignUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/constant/connection_status.dart';
import '../../../core/constant/routes.dart';

class ResetPasswordController extends GetxController {
  static ResetPasswordController get I => Get.put(ResetPasswordController());
  late TextEditingController passwordController1;
  late TextEditingController passwordController2;
  late GlobalKey<FormState> formKey;

  @override
  void onInit() {
    passwordController1 = TextEditingController();
    passwordController2 = TextEditingController();
    formKey = GlobalKey<FormState>();
    email = Get.arguments;
    super.onInit();
  }

  late String email;
  var isLoading = false.obs;
  ConnectionStatus connectionStatus = ConnectionStatus.NONE;
  ResetPasswordProvider rpp = ResetPasswordProvider(crud: Get.find());

  resetPassword() async {
    ConnectionStatus connectionStatus = ConnectionStatus.LOADING;
    update();
    Map data = {'email': email, 'password': passwordController1.text};
    if (formKey.currentState!.validate() &&
        passwordController1.text == passwordController2.text) {
      var res = await rpp.resetPassword(data);
      if (res is ConnectionStatus) {
        connectionStatus = res;
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
        goToSuccessReset();

        //}
      }
    } else {
      isLoading.value = false;
      connectionStatus = ConnectionStatus.NONE;
    }
    update();
  }

  void goToSuccessReset() {
    Get.off(const SuccessResetPasswordOrSignUp(screenType: FORGET_PASSWORD));
  }

  void backToPassword() {
    Get.offNamed(AppRoutes.forgetPassword);
  }

  @override
  void dispose() {
    passwordController1.dispose();
    passwordController2.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
