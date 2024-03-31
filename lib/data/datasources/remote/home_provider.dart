import 'package:ecommerceapp/core/constant/app_links.dart';
import 'package:ecommerceapp/data/model/categories_model.dart';
import 'package:ecommerceapp/data/model/productsandbanners_model.dart';

import '../../../core/classes/crud.dart';

class HomeProvider {
  Crud crud;

  HomeProvider(this.crud);

  getProducts(String lang) async {
    var response = await crud.getData(AppLinks.home,lang, {});
    // r is supposed to be model
    return response.fold((l) => l, (r) => ProductsAndBannersModel.fromJson(r));
  }


  getCategories(String lang) async {
    var response = await crud.getData(AppLinks.categories,lang ,{});
    // r is supposed to be model
    return response.fold((l) => l, (r) => MyCategoriesModel.fromJson(r));
  }
}
