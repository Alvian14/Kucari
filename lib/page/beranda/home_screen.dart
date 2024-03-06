import 'package:flutter/material.dart';
import 'package:project_kucari/buang/login_page.dart';
import 'package:project_kucari/page/beranda/upload_screen.dart';
import 'package:project_kucari/page/login_screen.dart';
import 'package:project_kucari/src/navbar_screen.dart';
import 'package:project_kucari/src/style.dart';

class homeSreen extends StatefulWidget {
  const homeSreen({super.key});

  @override
  State<homeSreen> createState() => _homeSreenState();
}

class _homeSreenState extends State<homeSreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          surfaceTintColor: AppColors.putih,
          backgroundColor: AppColors
              .putih, // Sesuaikan dengan warna latar belakang yang diinginkan
          elevation: 0,
          shadowColor: AppColors
              .hitam, // Ubah sesuai dengan kebutuhan (misalnya, 0 untuk menghilangkan bayangan)
          title: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage('assets/img/Profile.png'),
                      backgroundColor: AppColors.hijauMuda,
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat datang👋',
                          style: TextStyles.hint,
                        ),
                        Text(
                          'Tiyaaa',
                          style: TextStyles.username,
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/icon/bell.png',
                    width: 24.0,
                    height: 24.0,
                    color: AppColors.hitam,
                  ),
                  onPressed: () {
                    // Tambahkan fungsi yang ingin dijalankan ketika tombol ditekan
                  },
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          // color: AppColors.hijauMuda,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        // padding: EdgeInsets.all(20),
                        child: Card(
                          surfaceTintColor: AppColors.hijauMuda,
                          color: AppColors.hijauMuda,
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween, // Mengatur jarak di antara widget
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Kehilangan sesuatu?',
                                          style: TextStyles.bodybold,
                                        ),
                                        Text(
                                          'atau Menemukan sesuatu?',
                                          style: TextStyles.bodybold,
                                        ),
                                        Text(
                                          'Kamu dapat membagikannya',
                                        ),
                                        Text(
                                          'disini untuk membantu',
                                        ),
                                        Text(
                                          'seseorang',
                                        ),
                                      ],
                                    ),
                                    Image(
                                      image:
                                          AssetImage('assets/img/logohome.png'),
                                      width: 100,
                                      height: 100,
                                      // Sesuaikan ukuran dan path gambar sesuai kebutuhan
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30.0),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => NavbarScreen(
                                        selectedIndex: 1,onTabPressed: (p0) {
                                      },),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 50.0, vertical: 12.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    backgroundColor: AppColors.hijau,
                                  ),
                                  child: Text(
                                    'LAPORKAN',
                                    style:
                                        TextStyle(color: Colors.white).copyWith(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'Laporan Kehilangan',
                              style: TextStyles.username,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      //continer
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 1,
                              color: AppColors.gray100,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Agus Fernando',
                                            style: TextStyles.bodybold,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '19:30',
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                '22/09/2024',
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                          vertical:
                                              1.0), // Sesuaikan dengan kebutuhan
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      backgroundColor: AppColors.hijau,
                                    ),
                                    child: Text(
                                      'Ditemukan',
                                      style: TextStyles.label,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Sebuah kucing berwarna oren yang tidak diketahui namanya',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              height: 200,
                              width: double.infinity,
                              child: Image.network(
                                'https://asset.kompas.com/crops/PjtznDXwZQ4vrjNDVLmpCj-2R4g=/19x5:960x633/1200x800/data/photo/2022/01/05/61d54b808e254.jpg',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            SizedBox(height: 1),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Image.asset(
                                      'assets/icon/komentar.png',
                                      width: 24.0,
                                      height: 24.0,
                                      color: AppColors.hitam,
                                    ),
                                    onPressed: () {
                                      // Tambahkan fungsi yang ingin dijalankan ketika tombol ditekan
                                    },
                                  ),
                                  SizedBox(
                                      width:
                                          1.0), // Sesuaikan jarak antara ikon dan teks
                                  Text(
                                    'Komentar',
                                    style: TextStyle(
                                      color: AppColors.hitam,
                                      fontSize: 16.0,
                                      // Sesuaikan dengan gaya teks yang diinginkan
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
