import 'package:e_commerce_ui/screens/bottom_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;

  final List<Widget> _screens = [
    HomeScreen(),
    ShopScreen(),
    BagScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
         selectedItemColor: Color(0xFFDB3022), // Set the selected item color
        unselectedItemColor: Colors.grey,
        backgroundColor: Color(0xFFFFFFFF), 
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 30,),
            label: 'Home',
           
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop,size: 30,),
            label: 'Shop',
          
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag,size: 30,),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,size: 30,),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
