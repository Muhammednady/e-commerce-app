import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTitleAuthText extends StatelessWidget{
  final String title;

  const CustomTitleAuthText({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(
        title,
        textAlign: TextAlign.center,
        style:
        Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 25));
  }

}