import 'package:ecommerceapp/core/constant/allApp_constants.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/myservices.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

class MyMiddleWare extends GetMiddleware{

  late MyServices myServices;
  MyMiddleWare({required int priority}){ //:super(priority: p);
    priority = priority;
    myServices= Get.find<MyServices>();
  }

@override
int? get priority => priority;

  @override
  RouteSettings? redirect(String? route) {
    if(myServices.sharedPreferences.getString(USER_MODEL) != null){
      if(myServices.sharedPreferences.getString(USER_MODEL)!.isNotEmpty) {
        return const RouteSettings(name: AppRoutes.home);
      }
    }
    if(myServices.sharedPreferences.getBool(ONBOARDING) != null){
      return const RouteSettings(name: AppRoutes.LOGIN);
    }
    return null;
  }

  // @override
  // RouteSettings? redirect(String? route) {
  //   if(myServices.sharedPreferences.getBool(LANGUAGE) == null){
  //     return RouteSettings(name: AppRoutes.language);
  //
  //   }else if(myServices.sharedPreferences.getBool(ONBOARDING) == null){
  //     return RouteSettings(name:AppRoutes.ONBOARDING);
  //   }else if(myServices.sharedPreferences.getString(USER_MODEL) == null){
  //      return RouteSettings(name: AppRoutes.LOGIN);
  //
  //   }
  //   return null;
  // }



}