import 'dart:convert';

import 'package:ecommerceapp/core/constant/allApp_constants.dart';
import 'package:ecommerceapp/core/services/myservices.dart';
import 'package:get/get.dart';

import '../data/model/products_model.dart';

class CartController extends GetxController {
  final List<Data> cart = [];
  MyServices myServices=Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getCartItems();
  }

  getCartItems() {
    if (myServices.sharedPreferences.get(cart_list) != null) {
      print('==============================*********************');
      print(myServices.sharedPreferences.get(cart_list));
      List list = jsonDecode(
          myServices.sharedPreferences.get(cart_list).toString());
      for (var element in list) {
        cart.add(Data.fromJson(element));
      }
      // favorites.addAll(list.map((e) => Data.fromJson(e)));
    }
    update();
  }

  void deleteElement(int index) {
    cart.removeAt(index);
    update();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    myServices.sharedPreferences.setString(cart_list,jsonEncode(cart));

  }

//
// InternalFinalCallback<void> get onDelete  {
//   myServices.sharedPreferences.setString(favorites_list,jsonEncode(favorites));
//  // myServices.sharedPreferences.setString(cart_list,jsonEncode(inCartProducts));
//
//   return super.onDelete;
//
// }
}
