

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/constant/allApp_constants.dart';
import 'package:ecommerceapp/core/services/myservices.dart';
import 'package:ecommerceapp/data/model/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/connection_status.dart';
import '../core/constant/routes.dart';
import '../data/datasources/remote/items_provider.dart';
import '../data/model/categories_model.dart';

class ItemsController extends GetxController{


  late MyServices myServices ;
  List<MyData> categories = [];
  List<Data> products = [];
  List<Data> favorites = [];
  List<Data> filteredProducts = [];
  List<Data> inCartProducts = [];
  late int selectedCategory;
  late TextEditingController searchController;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    searchController = TextEditingController();
    categories = Get.arguments['categories'];
    selectedCategory = Get.arguments['selectedID'];
    myServices = Get.find<MyServices>();
    getProducts().then((value) {
      categorizeProducts(selectedCategory);
    });


  }

  void goToFavorites(){
    Get.toNamed(AppRoutes.favorites);
  }

  void categorizeProducts(int id){
    filteredProducts.clear();
    connectionStatus = ConnectionStatus.LOADING;
    //getProducts();
    // filteredProducts.addAll(products.map<Data>((e) => e.catid! == id).toList());
    // products.map<Data>((e) => e.catid == id? e:  );
    products.forEach((element) {
      if(element.catid == id) {
        filteredProducts.add(element);
      }
    });
    connectionStatus = ConnectionStatus.SUCCESS;
    update();
  }

  ItemsProvider itemsProvider = ItemsProvider(crud:Get.find(),);
  RxBool isLoading = false.obs; //another solution for loading
  ConnectionStatus connectionStatus = ConnectionStatus.NONE;

  Future<void> getProducts()async{
    isLoading.value = true;
    ConnectionStatus connectionStatus = ConnectionStatus.LOADING;
    update();


    var response =  await itemsProvider.getProducts('en');
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





      }

      isLoading.value = false;

      print('connection status is $connectionStatus');

    }


    update();

  }



  void changeCategory(int id ){
    selectedCategory = id;
    //categorization
    categorizeProducts(id);
    update();
  }

  onSearchClicked(){}

  onNotificationClicked(){}

  void addToFavorite(int index) {
    connectionStatus = ConnectionStatus.LOADING;
    update();
    //
    // products[index].inFavorites = ! products[index].inFavorites!;
    //
    // if(products[index].inFavorites!){
    //
    //   favorites.add(products[index]);
    //
    // }else{
    //   favorites.remove(products[index]);
    // }
    // update();

    filteredProducts[index].inFavorites = ! filteredProducts[index].inFavorites!;

    if(filteredProducts[index].inFavorites!){

      favorites.add(filteredProducts[index]);

    }else{
      favorites.remove(filteredProducts[index]);
    }
    connectionStatus = ConnectionStatus.SUCCESS;
    update();
  }

  void addToCart(int index) {
    connectionStatus = ConnectionStatus.LOADING;
    update();

  //   products[index].inCart = !products[index].inCart!;
  //   if(products[index].inCart!){
  //
  //     inCartProducts.add(products[index]);
  //
  //   }else{
  //     inCartProducts.remove(products[index]);
  //   }
  //   update();
  //
  // }
    filteredProducts[index].inCart = !filteredProducts[index].inCart!;
    if(filteredProducts[index].inCart!){

      inCartProducts.add(filteredProducts[index]);

    }else{
      inCartProducts.remove(filteredProducts[index]);
    }

    connectionStatus = ConnectionStatus.SUCCESS;
    update();
    update();

  }

  goToItemDetails(Data product){
    Get.toNamed(AppRoutes.itemDetails , arguments: product);
  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    myServices.sharedPreferences.setString(favorites_list,jsonEncode(favorites));
    myServices.sharedPreferences.setString(cart_list,jsonEncode(inCartProducts));

  }


}