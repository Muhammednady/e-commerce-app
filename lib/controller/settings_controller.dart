import 'dart:convert';

import 'package:ecommerceapp/core/constant/allApp_constants.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/myservices.dart';
import 'package:ecommerceapp/data/model/users_model.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController{


  MyServices myServices = Get.find<MyServices>();
  MyUserModel? myUserModel;
  RxBool switchValue = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   String? result =  myServices.sharedPreferences.getString(USER_MODEL);
   if(result != null) {
     myUserModel = MyUserModel.fromJson(jsonDecode(result));
     //print(result);
   }
  }

  changeSwitch(bool val) {
    switchValue.value = val;
    if(val){

    }else{

    }
    update();
  }

  void logout() {
    myServices.sharedPreferences.setString(USER_MODEL, "");
    Get.offAllNamed(AppRoutes.LOGIN);
  }

  void goToAddressView() {
    Get.toNamed(AppRoutes.addressView);
  }
}