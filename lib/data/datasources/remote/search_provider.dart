

import 'package:ecommerceapp/core/classes/crud.dart';
import 'package:ecommerceapp/core/constant/app_links.dart';
import 'package:ecommerceapp/data/model/search_model.dart';
import 'package:get/get.dart';

class SearchData extends GetConnect{

  final Crud crud;
  SearchData(this.crud);


  searchProduct(String text)async{

    final response = await crud.postData(AppLinks.search, {'text':text});

    return response.fold((l) => l, (r) => SearchModel.fromJson(r));
  }
}