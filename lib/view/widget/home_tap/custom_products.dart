import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constant/colors.dart';
import '../../../data/model/products_model.dart';

class CustomProducts extends StatelessWidget {
  final List<Products>? products;
  final List<Banners>? banners;

  const CustomProducts({super.key, this.products, this.banners});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.yellow,
      height: 130.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: banners != null ? banners!.length : products!.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: CachedNetworkImage(
                  alignment: Alignment.center,
                  width: 100.0,
                  height: 100.0,
                  imageUrl: banners != null
                      ? banners![index].image!
                      : products![index].image!,
                  fit: banners != null ? BoxFit.fill : BoxFit.contain,
                  placeholder: (context, url) =>  const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                        strokeWidth: 0.1,
                      )),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  errorListener: (e) {
                    if (e is SocketException) {
                      print('Error with ${e.address} and message ${e.message}');
                    } else {
                      print('Image Exception is: ${e.runtimeType}');
                    }
                  },
                ),
              ),
              Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadiusDirectional.circular(15.0)),
              ),
              banners != null
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        products![index].name!.substring(0, 20),
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.white),
                      ),
                    ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 10.0,
        ),
      ),
    );
  }
}
