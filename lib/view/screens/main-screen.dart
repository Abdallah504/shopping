import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping/view-model/core/constant.dart';
import 'package:shopping/view/screens/cart-screen.dart';
import 'package:shopping/view/screens/cat-screen.dart';
import 'package:shopping/view/screens/home-screen.dart';
import 'package:shopping/view/screens/profile-screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors().orange,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items:  [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home'.tr(),
            backgroundColor: AppColors().orange
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'categories'.tr(),
              backgroundColor: AppColors().orange
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'cart'.tr(),
              backgroundColor: AppColors().orange
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile'.tr(),
              backgroundColor: AppColors().orange
          ),
        ],
      ),
    );
  }
}
