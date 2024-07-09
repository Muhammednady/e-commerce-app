import 'package:ecommerceapp/controller/addresses_location.dart/addressview_controller.dart';
import 'package:ecommerceapp/controller/checkout_controller/checkout_controller.dart';
import 'package:ecommerceapp/core/constant/app_images.dart';
import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:ecommerceapp/view/widget/check_out/shipping_address.dart';
import 'package:ecommerceapp/view/widget/check_out/delivery_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CheckOutView extends GetView<CheckoutController> {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    var checkOutController = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: AppColors.primary),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: AppColors.primary),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: AppColors.primary,
            )),
      ),
      bottomNavigationBar: Container(
        height: 55.0,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: MaterialButton(
          onPressed: () {
            // Get.to(GetWidgetCacheElement(widget));
          },
          // height: 45.0,
          color: AppColors.primary,
          // elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          child: const Text(
            'Checkout',
            style: TextStyle(
                color: AppColors.white,
                fontSize: 17.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GetBuilder<AddressViewController>(builder: (ctx) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                'Choose Payment Method',
                style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 10.0,
              ),
              //option 111111
              Obx(
                () => InkWell(
                  onTap: () {
                    controller.changePaymentOption(1);
                  },
                  child: Container(
                    width: Get.width,
                    height: 35.0,
                    decoration: BoxDecoration(
                        color: checkOutController.paymentOption.value == 1
                            ? AppColors.primary
                            : AppColors.primary.withOpacity(0.3),
                        borderRadius: const BorderRadiusDirectional.all(
                            Radius.circular(30.0))),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Cash On Delivery',
                          style: TextStyle(
                            color: checkOutController.paymentOption.value == 1
                                ? AppColors.white
                                : AppColors.primary,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              //option 222222
              Obx(
                () => InkWell(
                  onTap: () {
                    controller.changePaymentOption(2);
                  },
                  child: Container(
                    width: Get.width,
                    height: 35.0,
                    decoration: BoxDecoration(
                        color: checkOutController.paymentOption.value == 2
                            ? AppColors.primary
                            : AppColors.primary.withOpacity(0.3),
                        borderRadius: const BorderRadiusDirectional.all(
                            Radius.circular(30.0))),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Payment Cards',
                          style: TextStyle(
                            color: checkOutController.paymentOption.value == 2
                                ? AppColors.white
                                : AppColors.primary,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Choose Delivery Type',
                style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Obx(
                () => Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.changeDeliveryType(1);
                      },
                      child: AnimatedSwitcher(
                        key: const Key('1'),
                        duration: const Duration(milliseconds: 600),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                              scale: animation, child: child);
                        },
                        child: DeliveryTypeWidget(
                            title: 'Delivery',
                            image: AppImagesPath.motorCycle2,
                            isActive: checkOutController.deliveryType.value == 1
                                ? true
                                : false),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    InkWell(
                      onTap: () {
                        controller.changeDeliveryType(2);
                      },
                      child: AnimatedSwitcher(
                        key: const Key('2'),
                        duration: const Duration(milliseconds: 600),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                              scale: animation, child: child);
                        },
                        child: DeliveryTypeWidget(
                            title: 'Receive',
                            image: AppImagesPath.car2,
                            isActive: checkOutController.deliveryType.value == 2
                                ? true
                                : false),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Obx(
                () => Visibility(
                  visible: checkOutController.deliveryType.value == 1,
                  child: const Text(
                    'Shipping Address',
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              if (checkOutController.deliveryType.value == 1)
                Obx(
                  () => Visibility(
                    visible: checkOutController.deliveryType.value == 1,
                    child: checkOutController
                            .addressController.addresses.isEmpty
                        ? const Center(
                            child: Text(
                              'No Addressess yet !',
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        : SizedBox(
                            height: 300.0,
                            width: double.infinity,
                            child:
                                GetBuilder<CheckoutController>(builder: (ctx) {
                              return ListView.builder(
                                  itemCount: checkOutController
                                      .addressController.addresses.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                        onTap: () {
                                          checkOutController
                                              .changeShippingAddress(
                                                  checkOutController
                                                      .addressController
                                                      .addresses[index]
                                                      .id!);
                                        },
                                        child: ShippingAddressWidget(
                                            title: checkOutController
                                                .addressController
                                                .addresses[index]
                                                .title!,
                                            address: checkOutController
                                                .addressController
                                                .addresses[index]
                                                .address!,
                                            isActive: checkOutController
                                                        .shippingAddress
                                                        .value ==
                                                    checkOutController
                                                        .addressController
                                                        .addresses[index]
                                                        .id
                                                ? true
                                                : false),
                                      ));
                            }),
                          ),
                  ),
                )
            ],
          ),
        );
      }),
    );
  }
}
