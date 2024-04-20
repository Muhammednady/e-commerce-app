
import 'package:ecommerceapp/core/constant/connection_status.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/data/datasources/remote/address_provider.dart';
import 'package:get/get.dart';

import '../../data/model/address_model.dart';

class AddressViewController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAddresses();
  }

  List<Address> addresses = [];
  ConnectionStatus connectionStatus = ConnectionStatus.NONE;

  getAddresses() async {
    connectionStatus = ConnectionStatus.LOADING;
    AddressProvider().getLocations().then((value) {
      addresses.addAll(value.address!);
      connectionStatus = ConnectionStatus.SUCCESS;
      update();
    }).catchError((error) {
      connectionStatus = ConnectionStatus.FAILURE;
      update();
    });
    update();
  }

  goToAddAddress() {
    Get.toNamed(AppRoutes.addressAdd);
  }

  void deleteAddress(int? id) {
    connectionStatus = ConnectionStatus.LOADING;
    update();
    AddressProvider()
        .deleteLocations(id)
        .then((value) {
          if(value == 1){
            connectionStatus = ConnectionStatus.SUCCESS;
            addresses.removeWhere((element) => element.id == id);
            update();
          }else{
            connectionStatus = ConnectionStatus.NONE;
            update();
          }
    })
        .catchError((Object error) {
      connectionStatus = ConnectionStatus.FAILURE;
    });
  }
}
