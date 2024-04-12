import 'dart:core';

import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/view/screen/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/products_model.dart';

class ItemDetailsController extends GetxController {
  late Data productDetails;
  //late Product _product;
  List<Map<String, Object>> myColors = [
    {'text': 'red', 'color': Colors.red},
    {'text': 'green', 'color': Colors.green},
    {'text': 'blue', 'color': Colors.blue},
  ];
  int count = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    productDetails = Get.arguments;
  }

  countUp() {
    count++;
    update();
  }

  countDown() {
    if (count > 0) {
      count--;
    }
    update();
  }

  goToCart() {
    Get.to(CartView());
  }
}
