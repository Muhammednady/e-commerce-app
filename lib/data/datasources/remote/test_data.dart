//provider of test data.......

import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/classes/crud.dart';
import 'package:ecommerceapp/core/constant/app_links.dart';
import 'package:ecommerceapp/core/constant/connection_status.dart';

import '../../model/users_model.dart';

class TestData {
  late final Crud crud;

  TestData({required this.crud});

  postData() async {
    final response = await crud.getData(AppLinks.login, {});

    return response.fold((l) => l, (r) => r);
  }
}

//UsersModel
//Future<Either<ConnectionStatus, List<dynamic>>>
