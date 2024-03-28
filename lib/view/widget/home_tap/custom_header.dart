import 'package:flutter/cupertino.dart';

import '../../../core/constant/colors.dart';

class CustomHeader extends StatelessWidget{
  final String header;

  const CustomHeader({super.key, required this.header});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
    child:  Text(
      header,
    style:const TextStyle(color: AppColors.primary ).copyWith(fontSize: 20.0),
    ));
  }
}