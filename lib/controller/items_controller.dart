

import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/data/model/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/connection_status.dart';
import '../data/datasources/remote/items_provider.dart';
import '../data/model/categories_model.dart';

class ItemsController extends GetxController{

  List<MyData> categories = [];
  List<Data> products = [];
  late int selectedCategory;
  late TextEditingController searchController;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProducts();
    searchController = TextEditingController();
    categories = Get.arguments['categories'];
    selectedCategory = Get.arguments['selectedID'];

  }

  ItemsProvider itemsProvider = ItemsProvider(crud:Get.find(),);
  RxBool isLoading = false.obs; //another solution for loading
  ConnectionStatus connectionStatus = ConnectionStatus.NONE;

  getProducts()async{
    isLoading.value = true;
    ConnectionStatus connectionStatus = ConnectionStatus.LOADING;
    update();


    var response =  await itemsProvider.getProducts();
    print('response is $response');

    if(response is ConnectionStatus){
      connectionStatus = response;
      isLoading.value = false;
      Get.snackbar(
          'error'.tr,
          response == ConnectionStatus.SERVERFAILURE
              ? 'server_failure'.tr
              : 'offline_failure'.tr);
    }else{
      //print('response in else  is $response');

      if(cast<ProductsModel>(response).message == false){
        connectionStatus = ConnectionStatus.FAILURE;
      }else{
        connectionStatus = ConnectionStatus.SUCCESS;

        products.addAll(cast<ProductsModel>(response).allData!.data!);
        print('=====================================');
        print('Products in Items controller $products');
        print('=====================================');


      }

      isLoading.value = false;

      print('connection status is $connectionStatus');

    }


    update();

  }



  void changeCategory(int id ){
    selectedCategory = id;
    update();
  }

  onSearchClicked(){}

  onNotificationClicked(){}





}