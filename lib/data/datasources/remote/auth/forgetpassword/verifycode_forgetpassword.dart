import 'package:ecommerceapp/controller/auth/forget_password/verify_controller.dart';
import 'package:ecommerceapp/core/classes/crud.dart';
import 'package:ecommerceapp/core/constant/app_links.dart';

class VerifyCodeForgetProvider {

  final Crud crud;

  VerifyCodeForgetProvider({required this.crud});

  verifyCode(Map data) async {
    // var response = await crud.postData(AppLinks.verifyCodeforget, data);
    var response = await crud.getData(AppLinks.login, data);
    return response.fold((l) => l, (r) => r);
  }


}


