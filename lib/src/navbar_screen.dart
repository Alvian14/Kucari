import 'package:flutter/material.dart';
import 'package:project_kucari/page/beranda/home_screen.dart';
import 'package:project_kucari/page/beranda/notifikasi_screen.dart';
import 'package:project_kucari/page/beranda/profil_screen.dart';
import 'package:project_kucari/page/beranda/riwayat_screen.dart';
import 'package:project_kucari/page/beranda/upload_screen.dart';
import 'package:project_kucari/src/style.dart'; 

class NavbarScreen extends StatefulWidget {
  int selectedIndex;
  final Function(int) onTabPressed; // Tambahkan baris ini

  NavbarScreen({Key? key, required this.onTabPressed, this.selectedIndex = 0}) : super(key: key); // Tambahkan baris ini

  @override
  _NavbarScreenState createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {


  void _onItemTapped(int index) {
  setState(() {
    widget.selectedIndex = index;
  });

  widget.onTabPressed(index); // Tambahkan baris ini
}

  // static int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.w500, fontFamily: 'Inter');
  static const List<Widget> _widgetOptions = <Widget>[
    homeSreen(), 
    UploadScreen(), 
    // RiwayatScreen(),
    NotifScreen(),
    ProfilScreen(),
  ];

  void onTabPressed(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  static void update(){
      // widget.selectedIndex = 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(widget.selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icon/home.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icon/upload.png')),
            label: 'Upload',
          ),
          // BottomNavigationBarItem(
          //   icon: ImageIcon(AssetImage('assets/icon/note.png')),
          //   label: 'Riwayat',
          // ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icon/bell.png')),
            label: 'Notifikasi',
          ),
           BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icon/user.png')),
            label: 'Profil',
          ),
        ],
        currentIndex: widget.selectedIndex,
        selectedItemColor: AppColors.hijau,
        unselectedItemColor: AppColors.gray100,
        iconSize: 20,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
