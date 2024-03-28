import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constant/colors.dart';

class CustomAppBar extends StatelessWidget {
  final TextEditingController searchController;
  final String label;
  final void Function()? onSearchPressed;
  final void Function()? onNotificationPressed;

  const CustomAppBar(
      {super.key,
      required this.searchController,
      required this.label,
      required this.onSearchPressed,
      required this.onNotificationPressed,

      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
                hintText: label,
                hintStyle:
                    const TextStyle(fontSize: 20.0, color: AppColors.primary),
                prefixIcon: IconButton(
                    onPressed: onSearchPressed,
                    icon: const Icon(
                      Icons.search_outlined,
                      color: Colors.black,
                    )),
                fillColor: AppColors.primary.withOpacity(0.2),
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0))),
          )),
          const SizedBox(
            width: 10.0,
          ),
          Container(
            height: 60.0,
            //width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10.0),
              color: AppColors.primary.withOpacity(0.2),
            ),
            child: IconButton(
                onPressed: onNotificationPressed,
                icon: const Icon(Icons.notifications_active_outlined)),
          )
        ],
      ),
    );
  }
}
