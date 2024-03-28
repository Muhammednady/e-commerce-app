



import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controller/homescreen_controller.dart';
import 'Custombottombar_button.dart';

class BottomAppBarView extends GetView<HomeScreenController>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (controller) => BottomAppBar(
      notchMargin: 10.0,
      //  elevation: 10,
      height: 85.0,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:

        List.generate(controller.bottomItems.length, (index) {
          if(index == 2){
            return Spacer();
          }
          return CustomBottomBarButton(
            icon: controller.bottomItems[index].icon!,
            title: controller.bottomItems[index].title!,
            active: controller.currentPage == index ? true : false,
            onPress: () {
              controller.changePage(index);
            },
          );/*.paddingOnly(left: index == 2 ? 60.0 :0.0)*/
        } ),



      ),
    ),);
  }


}


