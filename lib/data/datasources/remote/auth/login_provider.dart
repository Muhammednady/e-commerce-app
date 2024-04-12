import 'package:ecommerceapp/core/classes/crud.dart';
import 'package:ecommerceapp/core/constant/app_links.dart';

class LoginProvider {
  Crud crud;

  LoginProvider({required this.crud});

  postData(Map data) async {
   // var response = await crud.postData(url, data);
    final response = await crud.postData(AppLinks.login, data);


    return response.fold((l) => l, (r) => r);
  }
}
