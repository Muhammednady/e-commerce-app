import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:flutter/material.dart';

class ShippingAddressWidget extends StatelessWidget {
  final String title;
  final String address;
  final bool isActive;
  const ShippingAddressWidget(
      {super.key,
      required this.title,
      required this.address,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive ? AppColors.primary : AppColors.white,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 15.0,
                  color: isActive ? AppColors.white : AppColors.black),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(address,
                style: TextStyle(
                    fontSize: 15.0,
                    color: isActive ? AppColors.white : AppColors.black)),
          ],
        ),
      ),
    );
  }
}
