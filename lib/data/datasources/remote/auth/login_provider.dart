import 'package:ecommerceapp/core/classes/crud.dart';

class LoginProvider {
  Crud crud;

  LoginProvider({required this.crud});

  postData() async {
   // var response = await crud.postData(url, data);
    final response = await crud.getData2('https://jsonplaceholder.typicode.com/posts', {});


    return response.fold((l) => l, (r) => r);
  }
}
