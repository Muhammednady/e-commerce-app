


import 'package:ecommerceapp/controller/addresses_location.dart/addressview_controller.dart';
import 'package:ecommerceapp/view/widget/check_out/shipping_address.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController{


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    addressController.getAddresses();

  }

  var addressController = Get.put(AddressViewController());

  // cash on delivry = 1
  // payment cards = 2

  RxInt paymentOption = 1.obs;

  RxInt deliveryType = 1.obs;

  RxInt shippingAddress = 0.obs;

  void changePaymentOption(int i){

    paymentOption.value = i;
    update();

  }
  void changeDeliveryType(int i){

    deliveryType.value = i;
    update();

  }
  void changeShippingAddress(int i){

    shippingAddress.value = i;
    update();

  }

}