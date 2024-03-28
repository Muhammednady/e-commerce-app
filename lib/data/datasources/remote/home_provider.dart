import 'package:ecommerceapp/core/constant/app_links.dart';
import 'package:ecommerceapp/data/model/categories_model.dart';
import 'package:ecommerceapp/data/model/productsandbanners_model.dart';

import '../../../core/classes/crud.dart';

class HomeProvider {
  Crud crud;

  HomeProvider(this.crud);

  getProducts() async {
    var response = await crud.getData(AppLinks.home, {});
    // r is supposed to be model
    return response.fold((l) => l, (r) => ProductsAndBannersModel.fromJson(r));
  }


  getCategories() async {
    var response = await crud.getData(AppLinks.categories, {});
    // r is supposed to be model
    return response.fold((l) => l, (r) => MyCategoriesModel.fromJson(r));
  }
}
