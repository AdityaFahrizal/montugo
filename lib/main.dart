import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart'; 
import 'package:montugo/Mechanic/UI/NavigationBar/custom_bottom_navbar.dart';
import 'package:montugo/Screens/Catalog/category_catalog.dart';
import 'package:montugo/Screens/FaQ/faq.dart';
// import 'package:montugo/Screens/Favorite/favorite.dart';
import 'package:montugo/Screens/home.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding); 
  await Firebase.initializeApp();
  runApp(const MyApp());
  FlutterNativeSplash.remove(); 
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
    // Favorite(),
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