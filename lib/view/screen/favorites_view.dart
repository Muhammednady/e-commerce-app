import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/favorites_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/colors.dart';

class FavoritesDisplay extends GetView<FavoritesController> {
  @override
  Widget build(BuildContext context) {
    Get.put(FavoritesController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        centerTitle: true,
      ),
      body: controller.favorites.isEmpty
          ? Center(
              child: Text(
                'No Favorites added Yet !',
                style: TextStyle(color: AppColors.grey2),
              ),
            )
          : GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.45,
                  crossAxisSpacing: 0.5,
                  mainAxisSpacing: 0.5,
                  crossAxisCount: 2),
              itemCount: controller.favorites.length,
              itemBuilder: (context, index) => Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.zero,
                  color: AppColors.white,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                            // fit: BoxFit.fill,
                            height: Get.width / 2.7,
                            width: Get.width / 2.4,
                            imageUrl: controller.favorites[index].image!,
                            errorWidget: (context, url, error) => const Center(
                              child: Icon(Icons.error),
                            ),
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          if (controller.favorites[index].discount! > 0)
                            Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  color: AppColors.secondary,
                                  child: const Text(
                                    'DISCOUNT',
                                    style: TextStyle(
                                        fontSize: 10.0, color: AppColors.white),
                                  ),
                                ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          controller.favorites[index].name!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          controller.favorites[index].description!,
                          style: const TextStyle(fontSize: 12.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          children: [
                            Text(
                              '${controller.favorites[index].price!}',
                              style: const TextStyle(
                                  fontSize: 14.0, color: AppColors.primary),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '${controller.favorites[index].oldPrice!}',
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 12.0),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.favorite_outlined,
                              color: AppColors.primary,
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
    );
  }
}
