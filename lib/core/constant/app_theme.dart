


import 'package:flutter/material.dart';

import 'colors.dart';

 ThemeData appThemeEn = ThemeData(
   fontFamily: 'Tinos',
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    useMaterial3: true,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          height: 1.6,
          fontSize: 16.0,
          color: AppColors.grey,
          fontFamily: 'Tinos'),
      displayMedium: TextStyle(
          fontSize: 18.0,
          color: AppColors.grey,
          fontFamily: 'Tinos'),
      bodyLarge: TextStyle(
          fontSize: 22.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Tinos'),
      bodyMedium:   TextStyle(
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
      displayLarge: TextStyle(
          height: 1.6,
          fontSize: 16.0,
          color: AppColors.grey,
          fontFamily: 'Cairo'), 
      displayMedium: TextStyle(
          fontSize: 18.0,
          color: AppColors.grey,
          fontFamily: 'Cairo'),
      bodyLarge: TextStyle(
          fontSize: 22.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo'),
      bodyMedium:   TextStyle(
          fontSize: 25.0,
          color: AppColors.grey,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo'),

    ));