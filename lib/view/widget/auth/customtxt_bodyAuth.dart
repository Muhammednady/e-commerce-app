import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBodyAuthText extends StatelessWidget{
  final String bodyText;

  const CustomBodyAuthText({super.key, required this.bodyText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        bodyText,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }




}