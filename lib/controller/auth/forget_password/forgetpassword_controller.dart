import 'package:ecommerceapp/core/constant/allApp_constants.dart';
import 'package:ecommerceapp/data/datasources/remote/auth/forgetpassword/checkemail_provider.dart';
import 'package:ecommerceapp/view/screen/auth/forget_password/verify_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/constant/connection_status.dart';
import '../../../core/constant/routes.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get I => Get.put(ForgetPasswordController());
  late TextEditingController emailController;

  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  RxBool isLoading = false.obs; //another solution for loading
  ConnectionStatus connectionStatus = ConnectionStatus.NONE;

  void checkEmail() async{
    //here code to check code
    connectionStatus = ConnectionStatus.LOADING;
    update();

    if (emailController.text.isNotEmpty) {

      var response = await CheckEmailProvider(crud: Get.find())
          .checkEmail({"email": emailController.text});

      if(response is ConnectionStatus){
        connectionStatus = response;
        isLoading.value = false;
        Get.snackbar(
            'error'.tr,
            response == ConnectionStatus.SERVERFAILURE
                ? 'server_failure'.tr
                : 'offline_failure'.tr);
      }else{
        // if(response['status'] == FAILURE_RESPONSE){
        //   connectionStatus = ConnectionStatus.FAILURE;
        // }else{
        isLoading.value = false;
        connectionStatus = ConnectionStatus.SUCCESS;
        goToVerifyCode();

        // }


      }

    }else{
      isLoading.value = false;
      connectionStatus = ConnectionStatus.NONE;
    }
    update();

  }

  void goToVerifyCode() {
    Get.off(const VerifyCode(screenType: FORGET_PASSWORD),
        arguments: emailController.text);
  }

  void gotoLogIn() {
    Get.offNamed(AppRoutes.LOGIN);
    deleteForgetPasswordController();
  }

  void deleteForgetPasswordController() {
    Get.delete<ForgetPasswordController>();
  }
}
