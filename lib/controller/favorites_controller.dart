import 'dart:convert';

import 'package:ecommerceapp/core/constant/allApp_constants.dart';
import 'package:ecommerceapp/core/services/myservices.dart';
import 'package:get/get.dart';

import '../data/model/products_model.dart';

class FavoritesController extends GetxController {
   List<Data> favorites = [];
  late MyServices myServices;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    myServices = Get.find();
    favorites.addAll(
        jsonDecode(myServices.sharedPreferences.get(favorites_list).toString())
            as List<Data>);
  }
}
