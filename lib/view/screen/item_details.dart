import 'package:ecommerceapp/controller/itemDetails_controller.dart';
import 'package:ecommerceapp/core/constant/app_images.dart';
import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:ecommerceapp/core/localization/change_lang.dart';
import 'package:ecommerceapp/view/widget/home_tap/custom_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/constant/allApp_constants.dart';

class ItemDetailsView extends GetView<ItemDetailsController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ItemDetailsController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Item Details'),
          centerTitle: true,
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(10.0),
          child: MaterialButton(
            onPressed: () {},
            height: 50.0,
            minWidth: double.infinity,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadiusDirectional.all(Radius.circular(20.0))),
            color: AppColors.primary,
            child: const Text(
              'add to cart',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white),
            ),
          ),
        ),
        body: GetBuilder<ItemDetailsController>(
          builder: (controller) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  fit: StackFit.passthrough,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 200.0,
                      width: double.infinity,
                      color: AppColors.primary,
                    ),
                    Positioned(
                      top: 100.0,
                      left: LanguageController.I.myServices!.sharedPreferences!
                                  .getString(LOCALE) ==
                              ENGLISH_SYMBOL
                          ? Get.width / 4.2
                          : null,
                      right: LanguageController.I.myServices!.sharedPreferences!
                                  .getString(LOCALE) ==
                              ARABIC_SYMBOL
                          ? Get.width / 4.2
                          : null,
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20.0),
                        ),
                        child: Hero(
                          tag: controller.productDetails.id!,
                          child: Image.network(
                            height: 200.0,
                            width: 200.0,
                            fit: BoxFit.fill,
                            controller.productDetails.image!,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsetsDirectional.only(top: 90.0, bottom: 5.0),
                    child:
                        CustomHeader(header: controller.productDetails.name!)),
                Row(
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                        Container(
                          height: 35.0,
                          width: 35.0,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              border: Border.fromBorderSide(BorderSide(
                                  color: AppColors.primary, width: 3.0))),
                          child: const Text(
                            '2',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      '${controller.productDetails.price.toString()} \$',
                      style: TextStyle(color: AppColors.primary),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  controller.productDetails.description!.replaceAll('\n', ' '),
                  style: TextStyle(fontSize: 15.0, color: AppColors.grey),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Color',
                      style: TextStyle(color: AppColors.primary),
                    )),
                Row(
                  children: [
                    ...List.generate(
                      3,
                      (index) => Container(
                        margin: EdgeInsets.only(right: 5.0),
                        height: 50.0,
                        width: 70.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            border: Border.fromBorderSide(BorderSide(
                                color: AppColors.primary, width: 3.0))),
                        child: Text(
                          'red',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
