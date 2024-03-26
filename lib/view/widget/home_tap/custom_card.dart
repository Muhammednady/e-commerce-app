import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/constant/colors.dart';

class CustomCard extends StatelessWidget{
  final String title;
  final String body;

  const CustomCard({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.width / 2.6,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadiusDirectional.circular(20.0)),
          child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 20.0, horizontal: 10.0),
              title: Text(
                title,
                style: TextStyle(
                    color: AppColors.white.withOpacity(0.8),
                    fontSize: 20.0),
              ),
              //titleTextStyle: TextStyle(color: AppColors.white.withOpacity(0.8),),
              subtitle:  Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 0.0, vertical: 10.0),
                child: Text(body,
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    )),
              )),
        ),
        Positioned(
          top: -20.0,
          right: -20.0,
          child: Container(
            height: 150.0,
            width: 150.0,
            decoration: const BoxDecoration(
                color: AppColors.secondary, shape: BoxShape.circle),
          ),
        )
      ],
    );
  }
}