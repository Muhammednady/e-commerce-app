import 'package:ecommerceapp/controller/homescreen_controller.dart';
import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:ecommerceapp/view/screen/home.dart';
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

        bottomNavigationBar: BottomAppBar(
          notchMargin: 10.0,
         elevation: 10,
          height: 85.0,
          shape: const CircularNotchedRectangle(),
          child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      controller.changePage(0);
                    },
                    icon:  Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: controller.currentPage == 0 ? AppColors.primary:AppColors.black,
                          //size: 30.0,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(fontSize: 15.0 ,color: controller.currentPage == 0 ? AppColors.primary:AppColors.black,),
                        )
                      ],
                    )),
                IconButton(
                    onPressed: () {controller.changePage(1);},
                    icon:  Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.favorite_border_outlined,color:controller.currentPage == 1 ? AppColors.primary:AppColors.black,
                        ),
                        Text(
                          'Favorite',
                          style: TextStyle(fontSize: 15.0 , color: controller.currentPage == 1 ? AppColors.primary:AppColors.black,),
                        )
                      ],
                    )),
              ],),
            const Spacer(),
            Row(children: [
              IconButton(
                  onPressed: () {controller.changePage(2);},
                  icon:  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.person_outline,
                        color: controller.currentPage == 2 ? AppColors.primary:AppColors.black,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(fontSize: 15.0 ,  color: controller.currentPage == 2 ? AppColors.primary:AppColors.black,),
                      )
                    ],
                  )),
              IconButton(
                  onPressed: () {controller.changePage(3);},
                  icon:  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.settings_outlined, color: controller.currentPage == 3 ? AppColors.primary:AppColors.black,
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(fontSize: 15.0 ,  color: controller.currentPage == 3 ? AppColors.primary:AppColors.black,),
                      )
                    ],
                  )),
            ],)
          ],
        ),)
        ));
  }
}

