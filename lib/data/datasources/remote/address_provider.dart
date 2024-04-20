import 'package:ecommerceapp/core/constant/allApp_constants.dart';
import 'package:ecommerceapp/core/constant/app_links.dart';
import 'package:ecommerceapp/core/services/myservices.dart';
import 'package:get/get.dart';

import '../../model/address_model.dart';

class AddressProvider extends GetConnect {
  MyServices myServices = Get.find();

  Future<int> postLocations(Map data) async {
    // print('==================================');
    try {
      final res = await post(
        AppLinks.location,
        data,
        headers: {
          'Accept':'application/json',
          "Authorization":
              "Bearer ${token}",
        },
      );
      print('================response.body======================');
       print(res.body);
      if (res.body['code'] == 0) {
        //error
        return res.body['code'];
      }

      if (res.body['code'] == 1) {
        //success
        return res.body['code'];
      }

      if (res.status.hasError) {
        return Future.error(res.status);
      } else {
        return res.body['code'];
      }
    } catch (e, s) {
      print('=============exception=====================');
      print(e);
      return Future.error(e.toString());
    }
  }

  Future<AddressModel> getLocations() async {

    try {
      final res = await get(
        "${AppLinks.apiEndpoint}/locations",
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${token}",
        },
      );

      if (res.status.hasError) {
        return Future.error(res.status);
      } else {
        return AddressModel.fromJson(res.body);
      }
    } catch (e, s) {
     // await Sentry.captureException(e, stackTrace: s);
      return Future.error(e.toString());
    }
  }

  Future<int> deleteLocations(id) async {
    try {
      final res = await delete(
        "${AppLinks.apiEndpoint}/locations/$id",
        headers: {
          "Authorization": "Bearer ${token}",
        },
      );
      if (res.body['code'] == 1) {

        return res.body['code'];
      }
      if (res.body['code'] == 0) {

        return res.body['code'];
      }
      if (res.status.hasError) {
        return Future.error(res.status);
      } else {
        return res.body['code'];
      }
    } catch (e, s) {
      return Future.error(e.toString());
    }
  }
}


