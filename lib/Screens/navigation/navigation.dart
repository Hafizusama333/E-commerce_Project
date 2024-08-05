import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:ecommerce_app/Screens/Main/Main2.dart';
import 'package:ecommerce_app/Screens/Main/Mainscreen.dart';
import 'package:ecommerce_app/Screens/profile/profile.dart';
import 'package:ecommerce_app/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/Screens/catlog/catlog.dart';
import 'package:ecommerce_app/Screens/cart/cart.dart';

class MainScreennavigation extends StatefulWidget {
  @override
  _MainScreennavigationState createState() => _MainScreennavigationState();
}

class _MainScreennavigationState extends State<MainScreennavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    MainScreen(),
    Catalog1(),
    CartScreen(cartItems: []),
    Main2(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: primaryclr,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.shop),
            title: Text('Shop'),
            activeColor: primaryclr,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            activeColor: primaryclr,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorite'),
            activeColor: primaryclr,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            activeColor: primaryclr,
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
