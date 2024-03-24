import 'package:ecommerceapp/core/classes/crud.dart';
import 'package:ecommerceapp/core/constant/allApp_constants.dart';
import 'package:ecommerceapp/core/constant/connection_status.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/myservices.dart';
import 'package:ecommerceapp/data/datasources/remote/auth/signup_provider.dart';
import 'package:ecommerceapp/view/screen/auth/forget_password/forget_password.dart';
import 'package:ecommerceapp/view/screen/auth/forget_password/verify_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpControler extends GetxController {
  static SignUpControler get I => Get.put(SignUpControler());
  late TextEditingController userNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState>? formkey;

  RxBool obsecureText = true.obs;
  var visibIcon = Icons.visibility_outlined.obs;

  void toggleVisibility() {
    obsecureText.value = !obsecureText.value;
    visibIcon.value = obsecureText.value
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    update();
  }

  @override
  void onInit() {
    userNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    formkey = GlobalKey<FormState>();
    super.onInit();
  }

  String? validateEmail(email) {
    if (emailController.text.isEmpty) {
      return 'email_empty'.tr;
    } else if (!GetUtils.isEmail(emailController.text)) {
      return 'email_form'.tr;
    } else {
      return null;
    }
  }

  String? validatePassword(email) {
    if (passwordController.text.isEmpty) {
      return 'password_empty'.tr;
    } else if (!GetUtils.isPassport(passwordController.text)) {
      return 'password_len'.tr;
    } else {
      return null;
    }
  }

  String? validateUsername(email) {
    if (userNameController.text.isEmpty) {
      return 'username_empty'.tr;
    } else if (!GetUtils.isUsername(userNameController.text)) {
      return 'username_form'.tr;
    } else {
      return null;
    }
  }

  String? validatephone(email) {
    if (phoneController.text.isEmpty) {
      return 'phone_empty'.tr;
    } else if (!GetUtils.isUsername(phoneController.text)) {
      return 'phone_form'.tr;
    } else {
      return null;
    }
  }

  ConnectionStatus connectionStatus = ConnectionStatus.NONE;
  RxBool isLoading = false.obs;
   signup() async {
    isLoading.value = true;
     connectionStatus = ConnectionStatus.LOADING;
     update();
    if (formkey!.currentState!.validate()) {
      Map<String, dynamic> values = {
        "username": userNameController.text,
        "email": emailController.text,
        "phone": phoneController.text,
        "password": passwordController.text,
      };

      var result =
          await SignUpProvider(crud: Get.find<Crud>()).postData(data: values);
      if (result is ConnectionStatus) {
        connectionStatus = result;
        Get.defaultDialog(
            title: "warning".tr,
            middleText: "A problem in server connection or offline ${connectionStatus.toString()} ");
      } else {
        //It is supposed that result is model instance .
        connectionStatus = ConnectionStatus.SUCCESS;
        //It is supposed to be in login screen(storing model).
        Get.find<MyServices>()
            .sharedPreferences
            .setString(USER_MODEL, result.toString());
        goToVerifyCodeScreen();
      }
      connectionStatus = ConnectionStatus.SUCCESS;
      isLoading.value = false;

      print('isLoading.value inside      ${isLoading.value}');


    }else{
      connectionStatus = ConnectionStatus.NONE;
    }
    //  connectionStatus = ConnectionStatus.SUCCESS;
    update();

  }


  void goToVerifyCodeScreen() {
    Get.off(VerifyCode(screenType: CONFIRM_USER) ,arguments: emailController.text);

    //**********************************
    // shouldn't be implemented here as we need emailcontroller.text in VerifyCode
    //Get.delete<SignUpControler>();
    //**********************************
  }

  void goToLogIn() {
    Get.offNamed(AppRoutes.LOGIN);
    deleteSignUpController();
  }

  void goToForgetPassword() {
    Get.offNamed(AppRoutes.forgetPassword);
    deleteSignUpController();
  }

  void deleteSignUpController() {
    Get.delete<SignUpControler>();
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
