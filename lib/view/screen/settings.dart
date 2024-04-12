import 'package:ecommerceapp/core/constant/app_images.dart';
import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:ecommerceapp/core/localization/change_lang.dart';
import 'package:ecommerceapp/view/widget/auth/customtxt_titleAuth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../controller/settings_controller.dart';
import '../../core/constant/allApp_constants.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SettingsController());
    return GetBuilder<SettingsController>(
      init: controller,
      builder: (controller) => Container(
        padding: const EdgeInsets.all(10.0),
        width: Get.width,
        child: Column(children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: Get.width / 2.9,
                color: AppColors.primary,
              ),
              const Positioned(
                top: 80.0,
                child: CircleAvatar(
                  radius: 43.0,
                  backgroundColor: AppColors.white,
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundColor: AppColors.white,
                    backgroundImage: AssetImage(AppImagesPath.avatar),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 70.0,
          ),
          Card(
            child: ListTile(
              onTap: () {},
              leading: Text(
                'Disable Notifications',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 17.0),
              ),
              trailing: Switch(
                splashRadius: 10.0,
                value: controller.switchValue.value,
                onChanged: (val) => controller.changeSwitch(val),
              ),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {},
              leading: Text(
                'Address',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 17.0),
              ),
              trailing:const Icon(Icons.location_on_outlined)
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {},
              leading: Text(
                'About us',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 17.0),
              ),
              trailing:const Icon(Icons.question_mark_outlined)
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {},
              leading: Text(
                'Contact us',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 17.0),
              ),
              trailing: const Icon(Icons.phone_callback_outlined)
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                controller.logout();
              },
              leading: Text(
                'Logout',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 17.0),
              ),
              trailing: const Icon(Icons.logout_outlined)
            ),
          ),
        ]),
      ),
    );
  }
}
