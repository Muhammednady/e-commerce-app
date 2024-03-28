import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomBottomBarButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onPress;
  final bool active;

  const CustomBottomBarButton(
      {super.key, required this.icon, required this.title, this.onPress, required this.active});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPress,
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: active
                  ? AppColors.primary
                  : AppColors.grey,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 15.0,
                color: active
                    ? AppColors.primary
                    : AppColors.grey,
              ),
            )
          ],
        ));

  }


}