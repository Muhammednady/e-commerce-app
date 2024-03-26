import 'dart:ui';

import 'package:ecommerceapp/controller/hometap_controller.dart';
import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/view/widget/home_tap/custom_categories.dart';
import 'package:ecommerceapp/view/widget/home_tap/custom_header.dart';
import 'package:ecommerceapp/view/widget/home_tap/custom_appBar.dart';
import 'package:ecommerceapp/view/widget/home_tap/custom_card.dart';
import 'package:ecommerceapp/view/widget/home_tap/custom_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../data/datasources/constant/constant.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return
      GetBuilder<HomeController>(
        init: controller,
        builder: (controller) => Container(
          //color: AppColors.primary.withOpacity(0.4),
          padding: const EdgeInsetsDirectional.all(20.0),
          child: ListView(
            children: [
              CustomAppBar(
                  searchController: TextEditingController(),
                  label: 'Find Product',
                  onSearchPressed: () {},
                  onNotificationPressed: () {}),
              // const SizedBox(
              //   height: 10.0,
              // ),
              const CustomCard(title: 'A summer surprise ' , body: 'Cashback 20%'),
              // const SizedBox(
              //   height: 10.0,
              // ),
              const CustomHeader(header: 'Categories'),

              CustomCategories(blackImages: CategoriesImages.blackImages),
              // const SizedBox(
              //   height: 10.0,
              // ),
             const CustomHeader(header: 'Products For You'),
              controller.products.isEmpty
                  ? const Center(
                      child: Text(
                        'No Products Yet !',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : CustomProducts(products: controller.products),
              const CustomHeader(header: 'Banners'),
              controller.products.isEmpty
                  ? const Center(
                child: Text(
                  'No Banners Yet !',
                  style: TextStyle(color: Colors.grey),
                ),
              ):
              SizedBox(
                //color: Colors.yellow,
                height: 150.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.banners.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Image.network(
                            alignment: AlignmentDirectional.center,
                            height: 100.0,
                            width: 100.0,
                            controller.banners[index].image!,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          height: 120.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius:
                                  BorderRadiusDirectional.circular(15.0)),
                        ),
                        // Padding(
                        //   padding:
                        //   const EdgeInsets.only(top: 5.0, left: 5.0),
                        //   child: Text(
                        //     textAlign: TextAlign.center,
                        //     controller.banners[index].
                        //         .substring(0, 20),
                        //     style: TextStyle(
                        //         fontSize: 12, color: AppColors.white),
                        //   ),
                        //),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10.0,
                  ),
                ),
              ),
            ],
          ),
        ),

    );
  }
}
