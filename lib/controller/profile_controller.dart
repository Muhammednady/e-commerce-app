import 'dart:convert';

import 'package:get/get.dart';

import '../core/constant/allApp_constants.dart';
import '../core/services/myservices.dart';
import '../data/model/users_model.dart';

class ProfileController extends GetxController{



  MyServices myServices = Get.find<MyServices>();
  MyUserModel? myUserModel;
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




}