


import 'package:flutter/material.dart';

import 'colors.dart';

 ThemeData appThemeEn = ThemeData(
   fontFamily: 'Tinos',
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    useMaterial3: true,
    textTheme: const TextTheme(
      headline1: TextStyle(
          height: 1.6,
          fontSize: 16.0,
          color: AppColors.grey,
          fontFamily: 'Tinos'),
      headline2: TextStyle(
          fontSize: 18.0,
          color: AppColors.grey,
          fontFamily: 'Tinos'),
      bodyText1: TextStyle(
          fontSize: 22.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Tinos'),
      bodyText2:   TextStyle(
          fontSize: 25.0,
          color: AppColors.grey,
          fontWeight: FontWeight.bold,
          fontFamily: 'Tinos'),

    ));



ThemeData appThemeAR = ThemeData(
    fontFamily: 'Cairo',
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    useMaterial3: true,
    textTheme: const TextTheme(
      headline1: TextStyle(
          height: 1.6,
          fontSize: 16.0,
          color: AppColors.grey,
          fontFamily: 'Cairo'),
      headline2: TextStyle(
          fontSize: 18.0,
          color: AppColors.grey,
          fontFamily: 'Cairo'),
      bodyText1: TextStyle(
          fontSize: 22.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo'),
      bodyText2:   TextStyle(
          fontSize: 25.0,
          color: AppColors.grey,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo'),

    ));