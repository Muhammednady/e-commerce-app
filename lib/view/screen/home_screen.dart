import 'package:ecommerceapp/controller/homescreen_controller.dart';
import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:ecommerceapp/view/screen/cart_view.dart';
import 'package:ecommerceapp/view/screen/home.dart';
import 'package:ecommerceapp/view/widget/home_screen/Custombottombar_button.dart';
import 'package:ecommerceapp/view/widget/home_screen/bottomappbar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeScreenController());
    return GetBuilder<HomeScreenController>(
        init: controller,
        builder: (controller) => Scaffold(
            appBar: AppBar(
              title: const Text('Ahmed Al sakat'),
              centerTitle: true,
            ),
            body: controller.getHomeWidget,
            floatingActionButton: FloatingActionButton(
                backgroundColor: AppColors.primary,
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.shopping_basket_outlined,
                  color: AppColors.white,
                  //size: 30.0,
                ),
                onPressed: () {
                  Get.to(CartView());
                }),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar:  BottomAppBarView()));
  }
}


