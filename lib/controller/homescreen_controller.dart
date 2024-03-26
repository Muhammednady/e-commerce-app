
import 'package:ecommerceapp/view/screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController{

  int currentPage = 0;

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