
import 'package:ecommerceapp/core/constant/allApp_constants.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/myservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../constant/app_theme.dart';

class LanguageController extends GetxController {
  static LanguageController get I => Get.put(LanguageController());
  Locale? languageApp;
  MyServices? myServices;
  late ThemeData appTheme;
  //final st = Get
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    myServices = Get.find<MyServices>();
    restoreLang();
  }

  void changeThemeAndBrightness(){
   //  Theme.up

  }

  final langs = ['english', 'arabic'];
  final locals = const [Locale('en'), Locale('ar')];

  void changeLocale(String language) {
    Locale lang_locale  = getLocaleFromLanguage(language)!;
    myServices!.sharedPreferences
        .setString('locale', lang_locale.languageCode);
    if(lang_locale.languageCode == 'en'){
      appTheme = appThemeEn;
    }else{
      appTheme = appThemeAR;
    }
    Get.changeTheme(appTheme);
    Get.updateLocale(lang_locale);
    myServices!.sharedPreferences.setBool(LANGUAGE, true);
    Get.offNamed(AppRoutes.ONBOARDING);
  }

   restoreLang() {
    if (myServices!.sharedPreferences.getString('locale') ==
        locals[0].languageCode) {
      languageApp =  locals[0];
      appTheme = appThemeEn;
    } else if (myServices!.sharedPreferences.getString('locale') ==
        locals[1].languageCode) {
      languageApp = locals[1];
      appTheme = appThemeAR;

    } else {
      languageApp = Get.deviceLocale!;
      appTheme = languageApp!.languageCode == 'en'? appThemeEn:appThemeAR;
    }
  }

  Locale? getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (langs[i] == lang) return locals[i];
    }
    return Get.deviceLocale!;
  }
}
