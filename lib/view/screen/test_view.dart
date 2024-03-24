import 'package:ecommerceapp/controller/test_controller.dart';
import 'package:ecommerceapp/core/constant/app_images.dart';
import 'package:ecommerceapp/core/constant/connection_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    // var controller = Get.put(TestController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('TestView'),
          centerTitle: true,
        ),
        body: Center(
          child: GetBuilder<TestController>(
            init: Get.put(TestController()),
            builder: (controller) {

              if (controller.getStatus == ConnectionStatus.LOADING) {
                return Lottie.asset(AppImagesPath.loading);
              } else if (controller.getStatus == ConnectionStatus.FAILURE) {
                return Lottie.asset(AppImagesPath.emptyData);
              }
              else if (controller.getStatus ==
                  ConnectionStatus.SERVERFAILURE) {
                return Lottie.asset(AppImagesPath.serverFailure);
              } else if(controller.getStatus == ConnectionStatus.OFFLINEFAILURE){
                return Lottie.asset(AppImagesPath.offlineFailure);
              }else{
                return Text(
                  '${controller.data}',
                  style: const TextStyle(fontSize: 25.0),
                );
              }
            }
          ),
        ));
  }
  // Widget detectStatus(ConnectionStatus cs){
  //
  // }
}
