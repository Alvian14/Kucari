import 'package:flutter/material.dart';
import 'package:project_kucari/page/login_screen.dart';
import 'package:project_kucari/src/style.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Profile',
            style: TextStyles.titlehome,
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/img/foto_profil.jpg'),
                  ),
                  Positioned(
                    top: 55,
                    left: 55,
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Aksi ketika tombol edit foto ditekan
                        // Misalnya, tampilkan dialog atau navigasi ke halaman pengaturan foto profil
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Tiyaaa',
                style: TextStyles.textProfil,
              ),
              // SizedBox(height: 8),
              Text(
                'email@example.com', // Ganti dengan email
                style: TextStyles.hint
              ),

              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/icon/ballot.png', // Ganti dengan path gambar yang diinginkan
                              width: 25,
                              height: 25,
                            ),
                            SizedBox(width: 15),
                            Text(
                              'Ubah Profil',
                              style: TextStyles.hint,
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/icon/next.png',
                            width: 20,
                            height: 20,
                          ),
                          onPressed: () {
                            // Aksi ketika ikon lonceng ditekan
                          },
                        ),
                      ],
                    ),
                    Container(
                      height: 2,
                      color: AppColors.gray200,
                      margin: EdgeInsets.only(top: 5),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 11),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/icon/ballot.png', // Ganti dengan path gambar yang diinginkan
                              width: 25,
                              height: 25,
                            ),
                            SizedBox(width: 15),
                            Text(
                              'Ubah Kata Sandi',
                              style: TextStyles.hint,
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/icon/next.png',
                            width: 20,
                            height: 20,
                          ),
                          onPressed: () {
                            // Aksi ketika ikon lonceng ditekan
                          },
                        ),
                      ],
                    ),
                    Container(
                      height: 2,
                      color: AppColors.gray200,
                      margin: EdgeInsets.only(top: 5),
                    ),
                  ],
                ),
              ),
              

             SizedBox(height: 260),
              GestureDetector(
                onTap: () {
                   showLogoutConfirmationDialog(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Log out',
                      style: TextStyles.titlehome,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



void showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Keluar"),
        content: Text("Apakah kamu yakin ingin keluar?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text("Tidak"),
          ),
          TextButton(
            onPressed: () {
              // Perform logout action here
              Navigator.pushReplacement( // Use pushReplacement to prevent going back to the previous screen
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text("Iya"),
          ),
        ],
      );
    },
  );
}
