


import 'package:get/get.dart';

import '../data/model/products_model.dart';

class ItemDetailsController extends GetxController{

  late Data productDetails;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    productDetails = Get.arguments;

  }





}