
import 'package:ecommerceapp/view/screen/home.dart';
import 'package:ecommerceapp/view/screen/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/bottomAppBar_model.dart';

class HomeScreenController extends GetxController{

  int currentPage = 0;
  List<BottomAppBarModel> bottomItems = [
    BottomAppBarModel(icon: Icons.home_outlined, title: 'Home'),
    BottomAppBarModel(icon: Icons.notifications_active_outlined, title: 'Notification'),
    BottomAppBarModel(),
    BottomAppBarModel(icon: Icons.person_pin_outlined, title: 'Profile'),
    BottomAppBarModel(icon: Icons.settings_outlined, title: 'Settings'),

  ];
  final List<Widget> homeWidgets = [
    const Home(),
    const Center(child: Text('Notification'),),
    const SizedBox(),
    const Center(child: Text('Profile'),),
    const SettingsView(),

  ];
  get getHomeWidget => homeWidgets[currentPage];

  changePage(int index){
    currentPage = index;
    update();
  }

}