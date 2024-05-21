import 'package:e_commerce_ui/screens/products_screen.dart';
import 'package:flutter/material.dart';

// Home Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Screen'),
    );
  }
}

// Shop Screen
class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProductListScreen();
  }
}

// Bag Screen
class BagScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Bag Screen'),
    );
  }
}

// Profile Screen
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen'),
    );
  }
}
