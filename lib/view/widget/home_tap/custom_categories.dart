import 'package:ecommerceapp/controller/homescreen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/hometap_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../data/datasources/constant/constant.dart';
import '../../../data/model/categories_model.dart';

class CustomCategories extends GetView<HomeController>{
  final List<MyData> blackImages;

  const CustomCategories({super.key, required this.blackImages});
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      height: 110.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: blackImages.length,
        itemBuilder: (context, index) {
          //blackImages[index].id;
          return InkWell(
            onTap: (){
              controller.goToItemsView(blackImages,blackImages[index].id!);
            },
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Image.network(
                          alignment: AlignmentDirectional.center,
                          height: 60.0,
                          width: 60.0,
                          blackImages[index].image!),
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
                  blackImages[index].name!,
                  style: const TextStyle(fontSize: 15.0),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 10.0,
        ),
      ),
    );
  }

}