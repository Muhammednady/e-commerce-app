import 'package:ecommerceapp/controller/addresses_location.dart/addressDetails_controller.dart';
import 'package:ecommerceapp/controller/addresses_location.dart/addressadd_controller.dart';
import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:ecommerceapp/core/constant/connection_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class AddressDetails extends GetView<AddressDetailsController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Details'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: GetBuilder<AddressDetailsController>(
          init: controller,
          builder: (controller) => ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: TextFormField(
                          maxLines: 1,
                          validator: controller.validateTitle,
                          controller: controller.titleController,
                          decoration: InputDecoration(
                              hintText: 'title',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                        )),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: TextFormField(
                          maxLines: 3,
                          validator: controller.validateNote,
                          controller: controller.noteController,
                          decoration: InputDecoration(
                              hintText: 'Note',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    controller.connectionStatus == ConnectionStatus.LOADING
                        ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.secondary,
                      ),
                    )
                        : MaterialButton(
                      color: AppColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadiusDirectional.circular(20.0)),
                      child: Text(
                        'Submit Location',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                            color: AppColors.white, fontSize: 20.0),
                      ),
                      onPressed: () {
                        controller.submitLocation();
                      },
                    )
                  ],
                ))
          ],
        ),),
      ),
    );
  }
}
