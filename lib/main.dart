import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:montugo/Mechanic/UI/NavigationBar/custom_bottom_navbar.dart';
import 'package:montugo/Screens/Information/Mountain/JawaBarat/papandayan.dart';
import 'package:montugo/Screens/home.dart';
import 'package:montugo/Screens/category.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    Center(child: Text("Catalog")),     
    Papandayan(),  
    Categorymountain(),
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
          currentIndex : _selectedIndex,
          onTap: _onItemTapped,
        )
      ),
    );
  }
}