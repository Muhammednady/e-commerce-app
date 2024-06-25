import 'package:ecommerceapp/controller/addresses_location.dart/addressview_controller.dart';
import 'package:ecommerceapp/core/classes/crud.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/localization/change_lang.dart';
import 'package:ecommerceapp/core/localization/translations.dart';
import 'package:ecommerceapp/core/services/myservices.dart';
import 'package:ecommerceapp/routes.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import 'core/constant/allApp_constants.dart';
import 'core/constant/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await MyServices.injectMyServices();
  String? token = await FirebaseMessaging.instance.getToken();
  print("Token is :::: $token");
  Get.find<MyServices>().sharedPreferences.setString('Token', token!);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LanguageController controller = Get.put(LanguageController());
    return GetMaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      translations: LanguagesTranslation(),
      locale: controller.languageApp,
      fallbackLocale: Get.deviceLocale,

      theme: controller.appTheme,
      //routes: routes,
      //initialRoute: AppRoutes.home,
      getPages: routes,
      // home: LanguageView(),
      initialBinding: initialBinding(),
    );
  }
}

getInitialRoute() {
  var myServices = Get.find<MyServices>();
  if (myServices.sharedPreferences.getBool(LANGUAGE) == null) {
    return AppRoutes.language;
  } else if (myServices.sharedPreferences.getBool(ONBOARDING) == null) {
    return AppRoutes.ONBOARDING;
  } else if (myServices.sharedPreferences.getString(USER_MODEL) == null) {
    return AppRoutes.LOGIN;
  }
  return AppRoutes.home;
}

class initialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
   // Get.put(AddressViewController());
    // Get.lazyPut(() => OnBoardingController(), fenix: true);
    // //With fenix = true; you can Get.find<OnBoardingController>(); from any screen.
  }
}
