import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/items_controller.dart';
import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/view/widget/custom_appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../core/constant/connection_status.dart';
import '../../widget/customcategory_itemslist.dart';

class ItemsScreen extends GetView<ItemsController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ItemsController());
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: const Text('Products'),
        ),
        body: Container(
          padding: const EdgeInsetsDirectional.all(20.0),
          child: ListView(physics: const BouncingScrollPhysics(), children: [
            CustomAppBar(
                searchController: controller.searchController,
                label: 'Find Product',
                onSearchPressed: controller.onSearchClicked,
                onNotificationPressed: controller.onNotificationClicked),
            const SizedBox(
              height: 15.0,
            ),
            CustomCategoryItemsList(),
            const SizedBox(
              height: 10.0,
            ),
            GetBuilder<ItemsController>(
              init: controller,
              builder: (controller) => controller.connectionStatus ==
                      ConnectionStatus.LOADING
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    )
                  : Container(
                      color: AppColors.grey.withOpacity(0.3),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.45,
                                crossAxisSpacing: 0.5,
                                mainAxisSpacing: 0.5,
                                crossAxisCount: 2),
                        itemCount: controller.filteredProducts.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                          controller.goToItemDetails(controller.filteredProducts[index]);

                          },
                          child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              margin: EdgeInsets.zero,
                              color: AppColors.white,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Hero(
                                        tag: controller.filteredProducts[index].id!,
                                        child: CachedNetworkImage(
                                          // fit: BoxFit.fill,
                                          height: Get.width / 2.7,
                                          width: Get.width / 2.4,
                                          imageUrl: controller
                                              .filteredProducts[index].image!,
                                          errorWidget: (context, url, error) =>
                                              const Center(
                                            child: Icon(Icons.error),
                                          ),
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: CircularProgressIndicator(
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (controller.filteredProducts[index]
                                              .discount! >
                                          0)
                                        Positioned(
                                            bottom: 0.0,
                                            left: 0.0,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 3.0),
                                              color: AppColors.secondary,
                                              child: const Text(
                                                'DISCOUNT',
                                                style: TextStyle(
                                                    fontSize: 10.0,
                                                    color: AppColors.white),
                                              ),
                                            ))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      controller.filteredProducts[index].name!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      controller
                                          .filteredProducts[index].description!,
                                      style: const TextStyle(fontSize: 12.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${controller.filteredProducts[index].price!}',
                                          style: const TextStyle(
                                              fontSize: 14.0,
                                              color: AppColors.primary),
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          '${controller.filteredProducts[index].oldPrice!}',
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 12.0),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              controller.addToFavorite(index);
                                            },
                                            icon: controller
                                                    .filteredProducts[index]
                                                    .inFavorites!
                                                ? const Icon(
                                                    Icons.favorite_outlined,
                                                    color: AppColors.primary,
                                                  )
                                                : const CircleAvatar(
                                                    backgroundColor:
                                                        AppColors.grey,
                                                    radius: 14.0,
                                                    child: Icon(
                                                      Icons.favorite_outline,
                                                      color: AppColors.white,
                                                    ),
                                                  ))
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () {
                                      controller.addToCart(index);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5.0),
                                      color: controller
                                              .filteredProducts[index].inCart!
                                          ? Colors.blueAccent.shade400
                                          : AppColors.grey,
                                      child: const Text(
                                        '+ add To Cart',
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
            )
          ]),
        ));
  }
}
