

import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../core/constant/colors.dart';

class CustomCategoryItemsList extends GetView<ItemsController>{
  @override
  Widget build(BuildContext context) {

    return GetBuilder<ItemsController>(builder: (controller) => Container(
      height: 35.0,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(
          width: 15.0,
        ),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {

            controller.changeCategory(controller.categories[index].id!);
          },
          child: Container(
              decoration: BoxDecoration(
                  border: controller.selectedCategory ==
                      controller.categories[index].id
                      ? const Border(
                      bottom: BorderSide(
                          width: 3.0, color: AppColors.primary))
                      : null),
              child: Text(
                controller.categories[index].name!,
                style: const TextStyle(fontSize: 18.0),
              )),
        ),
      ),
    ),

    );
  }

}



