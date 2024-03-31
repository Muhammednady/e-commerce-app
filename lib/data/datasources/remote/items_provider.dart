

import 'package:ecommerceapp/core/constant/app_links.dart';
import 'package:get/get.dart';

import '../../../core/classes/crud.dart';
import '../../model/products_model.dart';

class ItemsProvider extends GetConnect{

  Crud crud;

  ItemsProvider({required this.crud});

  getProducts(String lang)async{
    var response = await crud.getData(AppLinks.products,lang,{});
    return response.fold((l) => l, (r) => ProductsModel.fromJson(r));
  }




}