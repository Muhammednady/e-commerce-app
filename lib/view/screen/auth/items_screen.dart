import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:ecommerceapp/view/widget/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../widget/customcategory_itemslist.dart';

class ItemsScreen extends GetView<ItemsController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ItemsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: GetBuilder<ItemsController>(
        init: controller,
        builder: (controller) => Container(
          padding: EdgeInsetsDirectional.all(20.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              CustomAppBar(
                  searchController: controller.searchController,
                  label: 'Find Product',
                  onSearchPressed: controller.onSearchClicked,
                  onNotificationPressed: controller.onNotificationClicked),
              const SizedBox(
                height: 15.0,
              ),
              CustomCategoryItemsList(),
              const SizedBox(height: 10.0,),


          ]
      ),
    )));
  }
}
