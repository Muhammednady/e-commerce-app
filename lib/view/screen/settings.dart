import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/localization/change_lang.dart';
import 'package:ecommerceapp/view/widget/auth/customtxt_titleAuth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../core/constant/allApp_constants.dart';

class SettingsView extends GetView<LanguageController> {
  const SettingsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomTitleAuthText(title: 'Settings'),
          centerTitle: true,
        ),
        body: GetBuilder<LanguageController>(
            init: controller,
            builder: (controller) => Container(
              width: Get.width,
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'choose_lang'.tr,
                        selectionColor: AppColors.primary,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      MaterialButton(
                        onPressed: () {
                          //controller.changeLocale(ARABIC);
                          Get.updateLocale(Locale('ar'));
                          Get.offAllNamed(AppRoutes.LOGIN);
                        },
                        color: AppColors.primary,
                        child: Text(
                          'ar'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 18.0),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      MaterialButton(
                        onPressed: () {
                         // controller.changeLocale(ENGLISH);
                          Get.updateLocale(Locale('en'));
                          Get.offAllNamed(AppRoutes.LOGIN);
                        },
                        color: AppColors.primary,
                        child: Text(
                          'en'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 18.0),
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
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
            )));
  }
}