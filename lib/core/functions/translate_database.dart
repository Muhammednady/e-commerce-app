

//If you receive data from DataBase in arabic and english


import 'package:ecommerceapp/core/constant/allApp_constants.dart';
import 'package:ecommerceapp/core/services/myservices.dart';
import 'package:get/get.dart';

translateDataBase({required String name_ar,required String name_en}){
  MyServices myServices=Get.find();
  if(myServices.sharedPreferences!.getString(LANGUAGE) == ARABIC_SYMBOL){
    return name_ar;
  }else{
    return name_en;
  }

}