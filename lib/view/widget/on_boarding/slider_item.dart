import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class SliderItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String desc;

  const SliderItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40.0,
        ),
        Container(
          margin: const EdgeInsetsDirectional.only(bottom: 60.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Image.asset(
          imageUrl,
          // width: 200,
          // height: 220,
          filterQuality: FilterQuality.high,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          height: 35.0,
        ),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1 ,
        ),
      ],
    );
  }
}
