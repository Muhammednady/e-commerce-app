
import 'package:ecommerceapp/view/screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/bottomAppBar_model.dart';

class HomeScreenController extends GetxController{

  int currentPage = 0;
  List<BottomAppBarModel> bottomItems = [
    BottomAppBarModel(Icons.home_outlined, 'Home'),
    BottomAppBarModel(Icons.favorite_outline_sharp, 'Favorite'),
    BottomAppBarModel(Icons.person_outline, 'Profile'),
    BottomAppBarModel(Icons.settings_outlined, 'Settings'),

  ];
  final List<Widget> homeWidgets = [
    Home(),
    const Center(child: Text('Favorite'),),
    const Center(child: Text('Profile'),),
    const Center(child: Text('Settings'),),

  ];
  get getHomeWidget => homeWidgets[currentPage];

  changePage(int index){
    currentPage = index;
    update();
  }

}