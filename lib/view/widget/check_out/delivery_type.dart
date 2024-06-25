import 'package:ecommerceapp/core/constant/app_images.dart';
import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:flutter/material.dart';

class DeliveryTypeWidget extends StatelessWidget {
  final String title;
  final String image;
  final bool isActive;
  const DeliveryTypeWidget(
      {super.key,
      required this.title,
      required this.image,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary, width: 2),
          color: isActive
              ? AppColors.primary
              : AppColors.primary.withOpacity(0.3)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 60.0,
            width: 60.0,
            color: isActive ? AppColors.white :null,
          ),
          // const SizedBox(
          //   height: 5.0,
          // ),
          Text(
            title,
            style: TextStyle(
                color: isActive ? AppColors.white : AppColors.primary,
                fontSize: 18.0),
          )
        ],
      ),
    );
  }
}
