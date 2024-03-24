
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class OnBoardingButton extends StatelessWidget {
  final double margin;
  final String text;
  final Color textColor;
  final double radius;
  final double height;
  final Function onClick;

  const OnBoardingButton({
    super.key, required this.margin, required this.text, required this.textColor,required this.onClick, required this.radius, required this.height
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(
            color: AppColors.primary,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),],
            color: AppColors.primary,
            borderRadius: BorderRadiusDirectional.circular(radius)),
        width: double.infinity,
        height: height,
        margin:  EdgeInsets.symmetric(horizontal: margin),
        child: TextButton(
          onPressed:()=> onClick(), //onClick(),
          child: Text(
            text,
            style:  TextStyle(color: textColor, fontSize: 15.0),
          ),
        ));
  }
}