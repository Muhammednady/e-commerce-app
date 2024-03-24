

import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/data/datasources/remote/home_provider.dart';
import 'package:get/get.dart';

import '../core/constant/connection_status.dart';
import '../data/model/products_model.dart';

class HomeController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProducts();
  }
  HomeProvider homeProvider = HomeProvider( Get.find());
  RxBool isLoading = false.obs; //another solution for loading
  ConnectionStatus connectionStatus = ConnectionStatus.NONE;

  List<Banners> banners = [];
  List<Products> products = [];

  getProducts() async{
    isLoading.value = true;
    ConnectionStatus connectionStatus = ConnectionStatus.LOADING;
    update();


      var response =  await homeProvider.getProducts();
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
        print('response in else  is $response');
        if(cast<ProductsModel>(response).message == false){
          connectionStatus = ConnectionStatus.FAILURE;
        }else{
          connectionStatus = ConnectionStatus.SUCCESS;

          products.addAll(cast<ProductsModel>(response).data!.products!);
          banners.addAll(cast<ProductsModel>(response).data!.banners!);
        }

        isLoading.value = false;

        print('connection status is $connectionStatus');

      }


    update();
  }
}