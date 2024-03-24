import 'package:ecommerceapp/core/classes/crud.dart';
import 'package:ecommerceapp/core/constant/app_links.dart';

class ResetPasswordProvider {

  final Crud crud;

  ResetPasswordProvider({required this.crud});

  resetPassword(Map data) async {
   //  var response = await crud.postData(AppLinks.resetpassword, data);
    var response = await crud.getData(AppLinks.resetpassword, data);
    return response.fold((l) => l, (r) => r);
  }


}


