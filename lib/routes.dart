import 'package:ecommerceapp/core/classes/middle_ware.dart';
import 'package:ecommerceapp/view/screen/address_location.dart/address_add.dart';
import 'package:ecommerceapp/view/screen/address_location.dart/address_details.dart';
import 'package:ecommerceapp/view/screen/address_location.dart/address_view.dart';
import 'package:ecommerceapp/view/screen/auth/forget_password/forget_password.dart';
import 'package:ecommerceapp/view/screen/auth/forget_password/reset_password.dart';
import 'package:ecommerceapp/view/screen/cart_view.dart';
import 'package:ecommerceapp/view/screen/favorites_view.dart';
import 'package:ecommerceapp/view/screen/items_screen.dart';
import 'package:ecommerceapp/view/screen/auth/login.dart';
import 'package:ecommerceapp/view/screen/auth/sign_up.dart';
import 'package:ecommerceapp/view/screen/home.dart';
import 'package:ecommerceapp/view/screen/home_screen.dart';
import 'package:ecommerceapp/view/screen/item_details.dart';
import 'package:ecommerceapp/view/screen/language.dart';
import 'package:ecommerceapp/view/screen/onBoarding.dart';
import 'package:ecommerceapp/view/screen/settings.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'core/constant/routes.dart';

//
// Map<String, Widget Function(BuildContext)> routes = {
//   AppRoutes.LOGIN: (context) => const Login(),
//   AppRoutes.ONBOARDING: (context) => const OnBoarding(),
//   AppRoutes.SIGNUP: (context) => const SignUpView(),
//   AppRoutes.forgetPassword: (context) => Forgetpassword(),
//   //AppRoutes.verifyEmail: (context) => VerifyCode(screenType: FORGET_PASSWORD),
//   AppRoutes.resetPassword: (context) => const ResetPassword(),
//   //AppRoutes.successReset:(context)=> const SucessResetPasswordOrSignUp(),
// };

List<GetPage<dynamic>> routes = [
  //GetPage(name: AppRoutes.initialRoute, page: () => const TestView()),
  GetPage(
      name: AppRoutes.initialRoute,
      page: () => const LanguageView(),
      middlewares: [MyMiddleWare(priority: 1)]),
  GetPage(name: AppRoutes.ONBOARDING, page: () => const OnBoarding()),
  GetPage(name: AppRoutes.LOGIN, page: () => const Login()),
  GetPage(name: AppRoutes.SIGNUP, page: () => const SignUpView()),
  GetPage(name: AppRoutes.home, page: () => HomeScreen()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const Forgetpassword()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.settings, page: () => const SettingsView()),
  GetPage(name: AppRoutes.itemsView, page: () =>   ItemsScreen()),
  GetPage(name: AppRoutes.itemDetails, page: () => ItemDetailsView()),
  GetPage(name: AppRoutes.favorites, page: () => FavoritesDisplay()),
  GetPage(name: AppRoutes.cart, page: () => CartView()),
  GetPage(name: AppRoutes.addressView, page: () => AddressView()),
  GetPage(name: AppRoutes.addressAdd, page: () => AddressAdd()),
  GetPage(name: AppRoutes.addressDetails, page: () => AddressDetails()),


];




