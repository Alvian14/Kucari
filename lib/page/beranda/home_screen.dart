import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_kucari/buang/login_page.dart';
import 'package:project_kucari/page/beranda/komentar.dart';
import 'package:project_kucari/page/beranda/upload_screen.dart';
import 'package:project_kucari/page/login_screen.dart';
import 'package:project_kucari/src/ApiService.dart';
import 'package:project_kucari/src/navbar_screen.dart';
import 'package:project_kucari/src/style.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.userId});

  final int userId;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String _username = '';
  late String _kategori = '';
  late String _deskripsi = '';
  late String _tgl = '';
  late String _jam = '';
  // late String _foto_postingan = '';
  List<dynamic> posting = [];
  File? _imageFile;

  @override
  void initState() {
    // _fetchUserImage();
    super.initState();
    _fetchUserData();
    _fetchPostingan();
  }

  // Future<void> fetchPostings() async {
  //   final String apiUrl = ApiService.url('postingan.php').toString();
  //   try {
  //     final response = await http.get(Uri.parse(apiUrl));
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         posting = json.decode(response.body)['posting'];
  //       });
  //     } else {
  //       throw Exception('Failed to load postings');
  //     }
  //   } catch (e) {
  //     throw Exception('Error fetching postings: $e');
  //   }
  // }

  Future<void> _fetchUserImage() async {
    final String apiUrl = ApiService.url('get_user_image.php')
        .toString(); // Ensure correct endpoint name
    final response =
        await http.get(Uri.parse('$apiUrl?userId=${widget.userId}'));
    if (response.statusCode == 200) {
      final imageData = json.decode(response.body);
      final fileName = imageData['fileName'];
      if (fileName != null && fileName.isNotEmpty) {
        setState(() {
          _imageFile = File('images/$fileName'); // Ensure correct file path
        });
      }
    } else {
      throw Exception('Failed to load user image');
    }
  }

  Future<void> _fetchUserData() async {
    final String apiUrl = ApiService.url('user.php')
        .toString(); // Ganti 'user.php' dengan nama endpoint yang benar
    final response =
        await http.get(Uri.parse('$apiUrl?userId=${widget.userId}'));
    if (response.statusCode == 200) {
      final userData = json.decode(response.body);
      setState(() {
        _username = userData[
            'username']; // Ubah 'username' sesuai dengan key yang benar di respons API
      });
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<void> _fetchPostingan() async {
    final String apiUrl = ApiService.url('postingan.php')
        .toString(); // Ganti 'user.php' dengan nama endpoint yang benar
    final response =
        await http.get(Uri.parse('$apiUrl?userId=${widget.userId}'));
    if (response.statusCode == 200) {
      final pos = json.decode(response.body);
      setState(() {
        _kategori = pos['kategori'];
        _deskripsi = pos['deskripsi'];
        _tgl = pos['tanggal_postingan'];
        _jam = pos['jam_postingan'];
        // _foto_postingan = userData['foto_postingan'];
      });
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          surfaceTintColor: AppColors.putih,
          backgroundColor: AppColors.putih,
          elevation: 0,
          shadowColor: AppColors.hitam,
          title: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: _imageFile != null
                          ? FileImage(_imageFile!)
                          : AssetImage('assets/img/logoKucari.png')
                              as ImageProvider,
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
                          _username,
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavbarScreen(
                          userId: widget.userId,
                          onTabPressed: (index) {
                            print('Tab $index selected');
                          },
                          selectedIndex: 2,
                        ),
                      ),
                    );
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
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Card(
                          surfaceTintColor: AppColors.hijauMuda,
                          color: AppColors.hijauMuda,
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30.0),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NavbarScreen(
                                          userId: widget.userId,
                                          onTabPressed: (index) {
                                            print('Tab $index selected');
                                          },
                                          selectedIndex: 1,
                                        ),
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
                      //container
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
                                      CircleAvatar(
                                        backgroundColor: AppColors.hijau,
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Vita',
                                            style: TextStyles.bodybold,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                _jam,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                _tgl,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 1.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      backgroundColor: AppColors.hijau,
                                    ),
                                    child: Text(
                                      _kategori,
                                      style: TextStyles.label,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                // 'Sebuah kucing berwarna oren yang tidak diketahui namanya',
                                _deskripsi,
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
                                      color: AppColors.gray100,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Komentar()));
                                    },
                                  ),
                                  SizedBox(width: 1.0),
                                  Text(
                                    'Komentar',
                                    style: TextStyle(
                                      color: AppColors.hitam,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      //container
                      // Container(
                      //   child: Column(
                      //     children: [
                      //       Container(
                      //         height: 1,
                      //         color: AppColors.gray100,
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                      //         child: Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 CircleAvatar(
                      //                   backgroundColor: AppColors.hijau,
                      //                 ),
                      //                 SizedBox(width: 10),
                      //                 Column(
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     Text(
                      //                       'Tiyaaa',
                      //                       style: TextStyles.bodybold,
                      //                     ),
                      //                     Row(
                      //                       children: [
                      //                         Text(
                      //                           '19:30',
                      //                         ),
                      //                         SizedBox(width: 10),
                      //                         Text(
                      //                           '22/09/2024',
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ],
                      //             ),
                      //             ElevatedButton(
                      //               onPressed: () {
                      //                 Navigator.pushReplacement(
                      //                   context,
                      //                   MaterialPageRoute(
                      //                       builder: (context) =>
                      //                           LoginScreen()),
                      //                 );
                      //               },
                      //               style: ElevatedButton.styleFrom(
                      //                 padding: EdgeInsets.symmetric(
                      //                     horizontal: 10.0, vertical: 1.0),
                      //                 shape: RoundedRectangleBorder(
                      //                   borderRadius:
                      //                       BorderRadius.circular(30.0),
                      //                 ),
                      //                 backgroundColor: AppColors.merahPudar,
                      //               ),
                      //               child: Text(
                      //                 'Kehilangan',
                      //                 style: TextStyles.label,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       Align(
                      //         alignment: Alignment.topLeft,
                      //         child: Text(
                      //           'Sebuah kucing berwarna oren yang tidak diketahui namanya',
                      //           maxLines: 3,
                      //           overflow: TextOverflow.ellipsis,
                      //           textAlign: TextAlign.justify,
                      //         ),
                      //       ),
                      //       SizedBox(height: 20),
                      //       Container(
                      //         height: 200,
                      //         width: double.infinity,
                      //         child: Image.network(
                      //           'https://asset.kompas.com/crops/PjtznDXwZQ4vrjNDVLmpCj-2R4g=/19x5:960x633/1200x800/data/photo/2022/01/05/61d54b808e254.jpg',
                      //           fit: BoxFit.fitWidth,
                      //         ),
                      //       ),
                      //       SizedBox(height: 1),
                      //       Align(
                      //         alignment: Alignment.topLeft,
                      //         child: Row(
                      //           children: [
                      //             IconButton(
                      //               icon: Image.asset(
                      //                 'assets/icon/komentar.png',
                      //                 width: 24.0,
                      //                 height: 24.0,
                      //                 color: AppColors.hitam,
                      //               ),
                      //               onPressed: () {
                      //                 // Tambahkan fungsi yang ingin dijalankan ketika tombol ditekan
                      //               },
                      //             ),
                      //             SizedBox(width: 1.0),
                      //             Text(
                      //               'Komentar',
                      //               style: TextStyle(
                      //                 color: AppColors.hitam,
                      //                 fontSize: 16.0,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
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
