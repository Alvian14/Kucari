import 'package:flutter/material.dart';
import 'package:project_kucari/src/navbar_screen.dart';
// import 'package:project_kucari/page/login_screen.dart';
import 'package:project_kucari/page/splash_screen.dart'; // Adjust the package name accordingly
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home: NavbarScreen(),
      
    );
  }
}

