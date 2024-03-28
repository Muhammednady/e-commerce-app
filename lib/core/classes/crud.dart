import "dart:convert";

import "package:dartz/dartz.dart";
import "package:ecommerceapp/core/constant/allApp_constants.dart";
import "package:ecommerceapp/core/constant/connection_status.dart";
import "package:ecommerceapp/core/functions/check_internet.dart";
import 'package:http/http.dart' as http;

class Crud {
  // late final MyServices myServices;
  // Crud(this.myServices){
  //   myServices = Get.find<MyServices>();
  //
  // }
  Future<Either<ConnectionStatus, List>> getData2(
      String url, Map data) async {
    try {
      if (await connectedToInternet()) {
        var response = await http.get(
            Uri.parse(url)
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          print(jsonDecode(response.body));
          return Right(jsonDecode(response.body ));
        } else {
          return const Left(ConnectionStatus.SERVERFAILURE);
          // return Future.error(response.statusCode);
        }
      } else {

        return const Left(ConnectionStatus.OFFLINEFAILURE);
      }
    } catch (e) {
      print(e);
      return const Left(ConnectionStatus.SERVERFAILURE);

      //  return Future.error(e.toString());
    }
  }
  ////////////////////////////////////////////////
  Future<Either<ConnectionStatus, Map<String,dynamic>>> getData(
      String url, Map data) async {
    try {
      if (await connectedToInternet()) {
        var response = await http.get(
           Uri.parse(url) ,// headers: {
        //     'lang':'en',
        //      'Accept':'application/json'
        // }
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          print(jsonDecode(response.body));
          return Right(jsonDecode(response.body ));
        } else {
          return const Left(ConnectionStatus.SERVERFAILURE);
          // return Future.error(response.statusCode);
        }
      } else {

        return const Left(ConnectionStatus.OFFLINEFAILURE);
      }
    } catch (e) {
      print(e);
      return const Left(ConnectionStatus.SERVERFAILURE);

      //  return Future.error(e.toString());
    }
  }
  Future<Either<ConnectionStatus, Map>> postData(
      String url, Map data) async {
    try {
      if (await connectedToInternet()) {
        var response = await http.post(
            Uri.parse(url) , body: data,
            headers: {
              'Content-Type':'application/json',
              'authorization':'Bearer $token'
            }
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          print(jsonDecode(response.body));
          return Right(jsonDecode(response.body ));
        } else {
          return const Left(ConnectionStatus.SERVERFAILURE);
          // return Future.error(response.statusCode);
        }
      } else {

        return const Left(ConnectionStatus.OFFLINEFAILURE);
      }
    } catch (e) {
      print(e);
      return const Left(ConnectionStatus.SERVERFAILURE);

      //  return Future.error(e.toString());
    }
  }
}
