import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:ecommerceapp/core/constant/connection_status.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/data/datasources/remote/auth/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../core/constant/allApp_constants.dart';
import '../../view/screen/auth/forget_password/forget_password.dart';

class LoginController extends GetxController {
  static LoginController get I => Get.put(LoginController());

  TextEditingController? emailController;
  TextEditingController? passwordController;
  GlobalKey<FormState>? formkey;

  RxBool obsecureText = true.obs;
  var visibIcon = Icons.visibility_outlined.obs;

  void toggleVisibility() {
    obsecureText.value = !obsecureText.value;
    visibIcon.value = obsecureText.value
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    //update here will update whole container body everyTime i change visibility.
    update();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formkey = GlobalKey<FormState>();
    super.onInit();
  }

  String? validateEmail(email) {
    if (emailController!.text.isEmpty) {
      return 'email_empty'.tr;
    } else if (!GetUtils.isEmail(emailController!.text)) {
      return 'email_form'.tr;
    } else {
      return null;
    }
  }

  String? validatePassword(password) {
    if (passwordController!.text.isEmpty) {
      return 'password_empty'.tr;
    } else if (passwordController!.text.length < 8 ||
        passwordController!.text.length > 16) {
      //passwordController!.text.length < 8
      return 'password_len'.tr;
    } else {
      return null;
    }
  }
  LoginProvider loginProvider = LoginProvider(crud: Get.find());
  RxBool isLoading = false.obs; //another solution for loading
  ConnectionStatus connectionStatus = ConnectionStatus.NONE;

   login() async{
     isLoading.value = true;
    ConnectionStatus connectionStatus = ConnectionStatus.LOADING;
    update();

    if (formkey!.currentState!.validate()) {

     var response =  await loginProvider.postData();

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
         Get.offAllNamed(AppRoutes.home);

      // }


     }

    }else{
      isLoading.value = false;
    }
    update();
  }

  void goToSignUp() {
    Get.offNamed(AppRoutes.SIGNUP);
  }

  void goToForgetPassword() {
    //Get.offNamed(AppRoutes.forgetPassword);
    Get.offNamed(AppRoutes.forgetPassword);
  }

  get back => Get.back();

  @override
  void dispose() {
    emailController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }
}
