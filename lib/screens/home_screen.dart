import 'package:caffino_coffee_shop_app/components/custom_bottom_nav_bar.dart';
import 'package:caffino_coffee_shop_app/components/custom_drawer.dart';
import 'package:caffino_coffee_shop_app/constatns.dart';
import 'package:caffino_coffee_shop_app/screens/cart_screen.dart';
import 'package:caffino_coffee_shop_app/screens/shop_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void navigateButtomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      bottomNavigationBar: CustomBottomNavBar(
        onTabChange: (index) => navigateButtomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        iconTheme: const IconThemeData(color: kPrimaryColor),
      ),
      drawer: Drawer(
        backgroundColor: kMaybeColor.withOpacity(0.9),
        child: const CustomDrawer(),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
