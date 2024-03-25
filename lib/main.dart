import 'package:flutter/material.dart';
import 'package:project_kucari/page/beranda/home_screen.dart';
import 'package:project_kucari/page/beranda/komentar.dart';
import 'package:project_kucari/page/beranda/profil_screen.dart';
import 'package:project_kucari/page/lupa_kata_sandi/lupaSandi_konfirmasi.dart';
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
      // home: Komentar(),
    );
  }
}

