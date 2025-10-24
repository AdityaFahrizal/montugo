import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:montugo/Mechanic/UI/NavigationBar/bottom_nav_bar.dart';
import 'package:montugo/Screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool acceptedTerms = prefs.getBool('accepted_terms') ?? false;
  runApp(MyApp(acceptedTerms: acceptedTerms));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final bool acceptedTerms;
  const MyApp({super.key, required this.acceptedTerms});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF36454F),
          secondary: const Color(0xFF36454F),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFF36454F),
        ),
      ),
      home: acceptedTerms ? BottomNavBar() : WelcomeScreen(),
    );
  }
}
