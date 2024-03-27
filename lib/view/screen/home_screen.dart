import 'package:ecommerceapp/controller/homescreen_controller.dart';
import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:ecommerceapp/view/screen/home.dart';
import 'package:ecommerceapp/view/widget/home_screen/Custombottombar_button.dart';
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
              title: const Text('homeScreen'),
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
                onPressed: () {}),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar:  BottomAppBar(
              notchMargin: 10.0,
              //  elevation: 10,
              height: 85.0,
              shape: const CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:

                  List.generate(controller.bottomItems.length, (index) {
                    return CustomBottomBarButton(
                      icon: controller.bottomItems[index].icon,
                      title: controller.bottomItems[index].title,
                      active: controller.currentPage == index ? true : false,
                      onPress: () {
                        controller.changePage(index);
                      },
                    ).paddingOnly(left: index == 2 ? 60.0 :0.0);
                  } ),
                  // CustomBottomBarButton(
                  //   icon: Icons.home_outlined,
                  //   title: 'Home',
                  //   active: controller.currentPage == 0 ? true : false,
                  //   onPress: () {
                  //     controller.changePage(0);
                  //   },
                  // ),
                  // CustomBottomBarButton(
                  //     icon: Icons.favorite_border_outlined,
                  //     title: 'Favorite',
                  //     onPress: () {
                  //       controller.changePage(1);
                  //     },
                  //     active: controller.currentPage == 1 ? true : false),
                  // const Spacer(),
                  // CustomBottomBarButton(
                  //     onPress: () {
                  //       controller.changePage(2);
                  //     },
                  //     icon: Icons.person_outline,
                  //     title: 'Profile',
                  //     active: controller.currentPage == 2 ? true : false),
                  // CustomBottomBarButton(
                  //     onPress: () {
                  //       controller.changePage(3);
                  //     },
                  //     icon: Icons.settings_outlined,
                  //     title: 'Settings',
                  //     active: controller.currentPage == 3 ? true:false)

              ),
            )));
  }
}


