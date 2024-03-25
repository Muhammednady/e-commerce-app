import 'dart:ui';

import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('home_page'.tr),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        init: controller,
        builder: (controller) => Container(
          //color: AppColors.primary.withOpacity(0.4),
          padding: const EdgeInsetsDirectional.all(20.0),
          child: ListView(
            children: [
              SizedBox(
                height: 60.0,
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Find Product',
                          hintStyle: const TextStyle(
                              fontSize: 20.0, color: AppColors.primary),
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search_outlined,
                                color: Colors.black,
                              )),
                          fillColor: AppColors.primary.withOpacity(0.2),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0))),
                    )),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      height: 60.0,
                      //width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(10.0),
                        color: AppColors.primary.withOpacity(0.2),
                      ),
                      child: IconButton(
                          onPressed: () {
                            // Get.defaultDialog(title: 'Greetings !' , middleText: 'Ahmed El sakat' , );
                          },
                          icon:
                              const Icon(Icons.notifications_active_outlined)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Stack(
                children: [
                  Container(
                    height: Get.width / 2.6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadiusDirectional.circular(20.0)),
                    child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                        title: Text(
                          'A summer surprise ',
                          style: TextStyle(
                              color: AppColors.white.withOpacity(0.8),
                              fontSize: 20.0),
                        ),
                        //titleTextStyle: TextStyle(color: AppColors.white.withOpacity(0.8),),
                        subtitle: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.0, vertical: 10.0),
                          child: Text('Cashback 20%',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              )),
                        )),
                  ),
                  Positioned(
                    top: -20.0,
                    right: -20.0,
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: const BoxDecoration(
                          color: AppColors.secondary, shape: BoxShape.circle),
                    ),
                  )
                ],
              ),
              // const SizedBox(
              //   height: 10.0,
              // ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Text('Categories' , style: TextStyle(color: AppColors.primary),),
              ),
              Container(
                //color: Colors.green,
                height: 110.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: CategoriesImages.blackImages.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Image.asset(
                                  alignment: AlignmentDirectional.center,
                                  height: 60.0,
                                  width: 60.0,
                                  CategoriesImages.blackImages[index].image),
                            ),
                            Container(
                              height: 80.0,
                              width: 80.0,
                              decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.3),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(20.0)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          CategoriesImages.blackImages[index].title,
                          style: const TextStyle(fontSize: 15.0),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10.0,
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 10.0,
              // ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Text('Products For You' , style: TextStyle(color: AppColors.primary),),
              ),
              controller.products.isEmpty
                  ? const Center(
                      child: Text(
                        'No Products Yet !',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : SizedBox(
                      //color: Colors.yellow,
                      height: 150.0,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Image.network(
                                  alignment: AlignmentDirectional.center,
                                  height: 100.0,
                                  width: 100.0,
                                  controller.products[index].image!,
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
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5.0, left: 5.0),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  controller.products[index].name!
                                      .substring(0, 20),
                                  style: TextStyle(
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
                    ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Text('Banners' , style: TextStyle(color: AppColors.primary),),
              ),
              SizedBox(
                //color: Colors.yellow,
                height: 150.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 10, top: 10),
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
      ),
    );
  }
}
