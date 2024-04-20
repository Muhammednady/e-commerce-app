import 'package:ecommerceapp/controller/addresses_location.dart/addressadd_controller.dart';
import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:ecommerceapp/core/constant/connection_status.dart';
import 'package:ecommerceapp/view/widget/on_boarding/onBoarding_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends GetView<AddressAddController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddressAddController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('add a Location '),
        ),
        body: GetBuilder<AddressAddController>(
          init: controller,
          builder: (controller) =>
              controller.connectionStatus == ConnectionStatus.LOADING
                  ? const Center(
                    child:  CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                  )
                  : Center(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: controller.cameraPosition!,
                           onMapCreated: (GoogleMapController controllerx) {
                             controllerx.animateCamera(CameraUpdate.newCameraPosition(controller.cameraPosition!));
                           },
                            onTap:  (LatLng argument) {
                              controller.getFinalLocation(argument);
                            },
                            markers: controller.markers.toSet(),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10.0),
                            child: OnBoardingButton(margin: 60.0, text: 'complete', textColor: AppColors.white, onClick: (){
                              controller.goToAddressDetails();
                            }, radius: 20.0, height: 40.0),
                          )
                        ],
                      ),
                    ),
        ));
  }
}
