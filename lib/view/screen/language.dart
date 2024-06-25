import 'dart:io';

import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:ecommerceapp/core/localization/change_lang.dart';
import 'package:ecommerceapp/view/widget/on_boarding/onBoarding_btn.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/allApp_constants.dart';

class LanguageView extends GetView<LanguageController> {
  const LanguageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'choose_lang'.tr,
              selectionColor: AppColors.primary,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(decoration: TextDecoration.underline),
            ),
            const SizedBox(
              height: 30.0,
            ),
            MaterialButton(
              onPressed: () {
                controller.changeLocale(ARABIC);
              },
              color: AppColors.primary,
              child: Text(
                'ar'.tr,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18.0),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              onPressed: () {
                controller.changeLocale(ENGLISH);
              },
              color: AppColors.primary,
              child: Text(
                'en'.tr,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18.0),
              ),
            ),
            const SizedBox(height: 50.0,),
            // OnBoardingButton(
            //     margin: 80.0,
            //     text: 'Click Here',
            //     textColor: Colors.black,
            //     onClick: (){
            //       exit(0);
            //     },
            //     radius: 0.0,
            //     height: 50.0
            // )
          ],
        ),
      )),
    );
  }
}
