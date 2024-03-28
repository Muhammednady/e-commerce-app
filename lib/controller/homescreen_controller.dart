
import 'package:ecommerceapp/view/screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/bottomAppBar_model.dart';

class HomeScreenController extends GetxController{

  int currentPage = 0;
  List<BottomAppBarModel> bottomItems = [
    BottomAppBarModel(icon: Icons.home_outlined, title: 'Home'),
    BottomAppBarModel(icon: Icons.favorite_outline_sharp, title: 'Favorite'),
    BottomAppBarModel(),
    BottomAppBarModel(icon: Icons.person_outline, title: 'Profile'),
    BottomAppBarModel(icon: Icons.settings_outlined, title: 'Settings'),

  ];
  final List<Widget> homeWidgets = [
    Home(),
    const Center(child: Text('Favorite'),),
    const SizedBox(),
    const Center(child: Text('Profile'),),
    const Center(child: Text('Settings'),),

  ];
  get getHomeWidget => homeWidgets[currentPage];

  changePage(int index){
    currentPage = index;
    update();
  }

}