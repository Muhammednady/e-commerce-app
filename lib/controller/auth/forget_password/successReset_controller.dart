
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:get/get.dart';

class SuccessResetController extends GetxController{

  static SuccessResetController get I => Get.put(SuccessResetController());


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }


  void backToLogIn(){
    Get.offNamed(AppRoutes.LOGIN);
  }
}