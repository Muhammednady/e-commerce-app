import 'package:ecommerceapp/core/classes/crud.dart';
import 'package:ecommerceapp/core/constant/app_links.dart';
import 'package:get/get.dart';

class CheckEmailProvider {
  final Crud crud;

  CheckEmailProvider({required this.crud});

  checkEmail(Map data) async {
   // var reponse = await crud.postData(AppLinks.checkemail, data);
    var reponse = await crud.getData(AppLinks.login,'en', data);
    return reponse.fold((l) => l, (r) => r);
  }
}
