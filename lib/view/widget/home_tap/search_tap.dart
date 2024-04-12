import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/search_model.dart';

class SearchTap extends StatelessWidget {
  final Product product;

  const SearchTap({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       // Get.to
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: product.image!,
              //fit: BoxFit.cover,
              height: 100.0,
              width: 100.0,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Center(
                child: Icon(Icons.error_outline),
              ),
            ),
            const SizedBox(width: 5.0,),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  product.name!,
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(product.price!.toString(),
                    style:
                        const TextStyle(fontSize: 15.0, color: AppColors.primary))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
