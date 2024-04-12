


import 'package:ecommerceapp/core/classes/crud.dart';

import '../../../../core/constant/app_links.dart';

class SignUpProvider{

  final Crud crud;
  SignUpProvider({required this.crud});


 postData({required Map<String , dynamic> data}) async {

   final response = await crud.postData(AppLinks.signup, data);
    return response.fold((l) => l, (r) => r);
  }






}