import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_kucari/firebase_options.dart';
// import 'package:project_kucari/page/login_screen.dart';
import 'package:project_kucari/page/splash_screen.dart'; // Adjust the package name accordingly

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home: UplodKegiatanPage(),
    );
  }
}

