import 'package:ecommerceapp/core/constant/connection_status.dart';
import 'package:ecommerceapp/data/datasources/remote/address_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddressDetailsController extends GetxController {
  TextEditingController? titleController;
  TextEditingController? noteController;
  GlobalKey<FormState>? formKey;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    titleController = TextEditingController();
    noteController = TextEditingController();
    formKey = GlobalKey<FormState>();
    data = Get.arguments;
  }

  Map data = {};

  //String? Function(String?)?
  String? validateTitle(String? text) {
    if (text!.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

  String? validateNote(String? text) {
    if (text!.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

  ConnectionStatus connectionStatus = ConnectionStatus.NONE;

  submitLocation() async {
    connectionStatus = ConnectionStatus.LOADING;
    update();

    if (formKey!.currentState!.validate()) {
      data.addAll({
        'title': titleController!.text,
        'note': noteController!.text,
      });

      AddressProvider().postLocations(data).then((value) {
        if (value == 1) {
          connectionStatus = ConnectionStatus.SUCCESS;
          Get.snackbar('info', 'Location has been sent');
        } else {
          connectionStatus = ConnectionStatus.FAILURE;
          Get.snackbar('info', 'FAILURE:Location has not been sent');

        }
        update();
      }).catchError((error) {
        connectionStatus = ConnectionStatus.SERVERFAILURE;
        Get.snackbar('info', 'SERVERFAILURE: Location has not been sent');
        update();
      });
    } else {
      connectionStatus = ConnectionStatus.NONE;
    }
    update();
  }
}
