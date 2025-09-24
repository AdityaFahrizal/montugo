import 'package:flutter/material.dart';
import 'package:montugo/Mechanic/UI/NavigationBar/custom_bottom_navbar.dart';
import 'package:montugo/Screens/Catalog/category_catalog.dart';
import 'package:montugo/Screens/FaQ/faq.dart';
import 'package:montugo/Screens/Favorite/favorite.dart';
import 'package:montugo/Screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Home(),
    CategoryCatalog(),
    Favorite(),
    FaqPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: _pages[_selectedIndex],
          backgroundColor: Colors.white,
          bottomNavigationBar: CustomBottomNavbar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          )),
    );
  }
}
