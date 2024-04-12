import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/classes/crud.dart';
import 'package:ecommerceapp/core/constant/allApp_constants.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/services/myservices.dart';
import 'package:ecommerceapp/data/datasources/remote/home_provider.dart';
import 'package:ecommerceapp/data/model/categories_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/data/model/categories_model.dart';
import '../core/constant/connection_status.dart';
import '../data/datasources/remote/search_provider.dart';
import '../data/model/productsandbanners_model.dart';
import '../data/model/search_model.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    myServices = Get.find<MyServices>();
    searchController = TextEditingController();
    getHome();
    getCategories();
  }

  late TextEditingController searchController;
  MyServices? myServices;
  HomeProvider homeProvider = HomeProvider(Get.find());
  RxBool isLoading = false.obs; //another solution for loading
  ConnectionStatus connectionStatus = ConnectionStatus.NONE;
  List<Product> searchProducts = [];
  List<Banners> banners = [];
  List<Products> products = [];
  List<MyData> categories = [];

  void onWritten(String text){
    if(text.isEmpty){
      searchProducts = [];
      update();
    }
  }
  searchForProduct() async {
    connectionStatus = ConnectionStatus.LOADING;
    update();
    if (searchController.text.isNotEmpty) {
      final response = await SearchData(Get.find()).searchProduct(searchController.text);
      if (response is ConnectionStatus) {
        connectionStatus =ConnectionStatus.SERVERFAILURE;
        print('error');
      } else {
      //  if (response is SearchModel) {
        final SearchModel res = response as SearchModel;

          if (res.status!) {
            connectionStatus = ConnectionStatus.SUCCESS;
            searchProducts.addAll(res.data!.data!);
          } else {
            connectionStatus = ConnectionStatus.FAILURE;
          }
      //  }
      }
    }else{
      connectionStatus = ConnectionStatus.NONE;
    }
    print('in Search ==========>>>>> ${connectionStatus}');
    update();
  }

  getHome() async {
    isLoading.value = true;
    ConnectionStatus connectionStatus = ConnectionStatus.LOADING;
    update();

    var response = await homeProvider.getProducts(ARABIC_SYMBOL);
    print('response is $response');

    if (response is ConnectionStatus) {
      connectionStatus = response;
      isLoading.value = false;
      Get.snackbar(
          'error'.tr,
          response == ConnectionStatus.SERVERFAILURE
              ? 'server_failure'.tr
              : 'offline_failure'.tr);
    } else {
      print('response in else  is $response');
      if (cast<ProductsAndBannersModel>(response).message == false) {
        connectionStatus = ConnectionStatus.FAILURE;
      } else {
        connectionStatus = ConnectionStatus.SUCCESS;

        products
            .addAll(cast<ProductsAndBannersModel>(response).data!.products!);
        banners.addAll(cast<ProductsAndBannersModel>(response).data!.banners!);
        products.forEach((element) {
          print('++++++++++++++++++++++++++++++++++++++');
          print(element.name);
        });
      }

      isLoading.value = false;

      print('connection status is $connectionStatus');
    }

    update();
  }

  getCategories() async {
    isLoading.value = true;
    ConnectionStatus connectionStatus = ConnectionStatus.LOADING;
    update();

    var response = await homeProvider
        .getCategories(myServices!.sharedPreferences.getString(LOCALE)!);
    print('response is $response');

    if (response is ConnectionStatus) {
      connectionStatus = response;
      isLoading.value = false;
      Get.snackbar(
          'error'.tr,
          response == ConnectionStatus.SERVERFAILURE
              ? 'server_failure'.tr
              : 'offline_failure'.tr);
    } else {
      print('response in else  is $response');

      if (cast<MyCategoriesModel>(response).message == false) {
        connectionStatus = ConnectionStatus.FAILURE;
      } else {
        connectionStatus = ConnectionStatus.SUCCESS;

        categories.addAll(cast<MyCategoriesModel>(response).data!.data!);
      }

      isLoading.value = false;

      print('connection status is $connectionStatus');
    }

    update();
  }

  void goToFavorites() {
    Get.toNamed(AppRoutes.favorites);
  }

  goToItemsView(List<MyData> categories, int id) {
    Get.toNamed(AppRoutes.itemsView,
        arguments: {"categories": categories, "selectedID": id});
  }
}
