import 'package:ecommerceapp/core/constant/colors.dart';
import 'package:ecommerceapp/view/screen/home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('homeScreen'),
      ),
      body: const Home(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primary,
          items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home) , label: 'Home',),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_sharp), label: 'Favourites'),
        BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.settings) , label: 'Settings'),
      ]),
    );
  }
}
