import 'package:ecommerceapp/controller/addresses_location.dart/addressview_controller.dart';
import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:ecommerceapp/core/constant/connection_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends GetView<AddressViewController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddressViewController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.goToAddAddress();
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Locations '),
        ),
        body: GetBuilder<AddressViewController>(
            init: controller,
            builder: (controller) => controller.connectionStatus ==
                    ConnectionStatus.LOADING
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  )
                : controller.connectionStatus == ConnectionStatus.FAILURE
                    ? const Center(
                        child: Text(
                          'Server Failure',
                          style: TextStyle(
                              fontSize: 20.0, color: AppColors.primary),
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.addresses.length,
                        itemBuilder: (BuildContext context, int index) => Card(
                          child: ListTile(
                            title: Text(controller.addresses[index].title!),
                            subtitle: Text(
                                '${controller.addresses[index].address!} '),
                            subtitleTextStyle: const TextStyle(
                                fontSize: 15.0, color: AppColors.primary),
                            trailing: IconButton(
                                onPressed: () {
                                  controller.deleteAddress(
                                      controller.addresses[index].id);
                                },
                                icon: const Icon(
                                  Icons.delete_outline_outlined,
                                  color: AppColors.secondary,
                                )),
                          ),
                        ),
                      )));
  }
}
