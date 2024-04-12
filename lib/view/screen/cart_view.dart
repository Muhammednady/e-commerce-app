import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/controller/favorites_controller.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../../core/constant/colors.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart Items'),
          centerTitle: true,
        ),
        body: GetBuilder<CartController>(
          builder: (controller) => controller.cart.isEmpty
              ? const Center(
            child: Text(
              'No Cart added Yet !',
              style: TextStyle(color: AppColors.grey),
            ),
          )
       // ListView()
              : GridView.builder(
            // shrinkWrap: true,
            //physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.6,
                crossAxisSpacing: 0.9,
                mainAxisSpacing: 0.9,
                crossAxisCount: 2),
            itemCount: controller.cart.length,
            itemBuilder: (context, index) {
              final product = controller.cart[index];

              return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: const EdgeInsets.all(2.0),
                  color: AppColors.white,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                            // fit: BoxFit.fill,
                            height: Get.width / 2.7,
                            width: Get.width / 2.4,
                            imageUrl: product.image!,
                            errorWidget: (context, url, error) =>
                            const Center(
                              child: Icon(Icons.error),
                            ),
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          if (product.discount! > 0)
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
                                        fontSize: 10.0,
                                        color: AppColors.white),
                                  ),
                                ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          product.name!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          product.description!,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12.0),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          children: [
                            Text(
                              '${product.price!}',
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  color: AppColors.primary),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '${product.oldPrice!}',
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
                      IconButton(
                          onPressed: () {
                            controller.deleteElement(index);
                          },
                          icon: const Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.red,
                          ))
                    ],
                  ));
           },
          ),
        ));
  }
}
