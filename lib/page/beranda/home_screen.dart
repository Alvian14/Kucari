import 'dart:convert';
import 'dart:io';

import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_kucari/buang/login_page.dart';
import 'package:project_kucari/page/beranda/komentar.dart';
import 'package:project_kucari/page/beranda/upload_screen.dart';
import 'package:project_kucari/src/listview.dart';
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
  // late String _kategori = '';
  // late String _deskripsi = '';
  // late String _tgl = '';
  // late String _jam = '';
  // late String _foto_postingan = '';
  // File? _imageFile;
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _fetchUserImage();
      await _fetchPostingan();
      await _fetchUserData();
      // await _fetchPostImage();
    });
  }

  Future<void> _fetchUserImage() async {
    final String apiUrl = ApiService.url('get_user_image.php').toString();
    final response =
        await http.get(Uri.parse('$apiUrl?userId=${widget.userId}'));
    if (response.statusCode == 200) {
      final imageData = json.decode(response.body);
      final fileName = imageData['fileName']; // Ini adalah URL lengkap gambar
      if (fileName != null && fileName.isNotEmpty) {
        setState(() {
          _imageUrl = fileName; // Menyimpan URL gambar
        });
      }
    } else {
      throw Exception('Failed to load user image');
    }
  }

  Future<void> _fetchUserData() async {
    final String apiUrl = ApiService.url('user.php').toString();
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

  List<Postingan> postingan = [];

  Future<void> _fetchPostingan() async {
    final String apiUrl = ApiService.url('listData.php').toString();
    final response =
        await http.get(Uri.parse('$apiUrl?userId=${widget.userId}'));
    if (response.statusCode == 200) {
      final List<dynamic> postinganData = json.decode(response.body);
      if (postinganData.isNotEmpty) {
        // Contoh: Ambil postingan pertama dari array
        // final Map<String, dynamic> firstPostingan = postinganData;
        setState(
          () {
            // _kategori = firstPostingan['kategori'];
            // _deskripsi = firstPostingan['deskripsi'];
            // _tgl = firstPostingan['tanggal_postingan'];
            // _jam = firstPostingan['jam_postingan'];
            // // _foto_postingan = firstPostingan['foto_postingan'];
            postingan = Postingan.toList(postinganData);
          },
        );

        DMethod.log('cek data');

        for (var post in postingan) {
          DMethod.log('test : ${post.kategori}');
        }
      } else {
        // Respon kosong, atur state ke nilai default atau kosong
        setState(() {
          // _kategori = '';
          // _deskripsi = '';
          // _tgl = '';
          // _jam = '';
          postingan = [];
          // _foto_postingan = '';
        });
        DMethod.log('postingan is empty');
      }
    } else {
      throw Exception('Failed to load postingan data');
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
                    InkWell(
                      onTap: () {
                        // Navigasi ke halaman profil
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NavbarScreen(
                              userId: widget.userId,
                              onTabPressed: (index) {
                                print('Tab $index selected');
                              },
                              selectedIndex: 3,
                            ),
                          ), // Ganti ProfilePage dengan halaman profil sesuai aplikasi Anda
                        );
                      },
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: _imageUrl != null
                            ? NetworkImage(_imageUrl!)
                            : AssetImage('assets/img/logoKucari.png')
                                as ImageProvider,
                      ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                image: AssetImage('assets/img/logohome.png'),
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
                              style: TextStyle(color: Colors.white).copyWith(
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
                        'Riwayat Postingan Anda',
                        style: TextStyles.username,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                //container
                SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: postingan.length,
                  itemBuilder: (context, index) {
                    Postingan post = postingan[index];
                    print('post : ${post.kategori}');
                    return PostinganList(
                      imageUrl: _imageUrl,
                      username: _username,
                      jam: post.jamPostingan,
                      tgl: post.tanggalPostingan,
                      kategori: post.kategori,
                      deskripsi: post.deskripsi,
                      imagePost: post.fotoPostingan,
                      idPostingan: post.idPostingan,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PostinganList extends StatelessWidget {
  const PostinganList({
    super.key,
    required String? imageUrl,
    required String username,
    required String jam,
    required String tgl,
    required String kategori,
    required String deskripsi,
    required String imagePost,
    required String idPostingan,
  })  : _imageUrl = imageUrl,
        _username = username,
        _jam = jam,
        _tgl = tgl,
        _kategori = kategori,
        _deskripsi = deskripsi,
        _imagePost = imagePost,
        _idPostingan = idPostingan;

  final String? _imageUrl;
  final String _username;
  final String _jam;
  final String _tgl;
  final String _kategori;
  final String _deskripsi;
  final String _imagePost;
  final String _idPostingan;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 1,
            color: AppColors.gray100,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: _imageUrl != null
                          ? NetworkImage(_imageUrl!)
                          : AssetImage('assets/img/logoKucari.png')
                              as ImageProvider,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _username,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    backgroundColor: _kategori.toLowerCase() ==
                            'kehilangan' // pastikan kata 'kehilangan' kecil semua
                        ? AppColors.merahPudar
                        : AppColors.hijau,
                  ),
                  child: Text(
                    _kategori,
                    style: TextStyles.label,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.clear_outlined),
                  onPressed: () async {
                    final response = await http.post(ApiService.url('hapus_postingan.php'), // Sesuaikan dengan URL server Anda
                      body: {
                        'id_postingan':
                            _idPostingan // Pastikan Anda mendapatkan dan menyertakan ID postingan yang benar
                      },
                    );

                    if (response.statusCode == 200) {
                      // Decode the JSON response if needed
                      final responseJson = jsonDecode(response.body);

                      if (responseJson['success']) {
                        // Tampilkan pemberitahuan bahwa postingan berhasil dihapus
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Sukses'),
                              content: Text('Postingan berhasil dihapus'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Tutup dialog
                                    // Mungkin tambahkan navigasi untuk refresh atau kembali ke halaman sebelumnya
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        // Handle failure
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Gagal'),
                              content: Text(
                                  'Gagal menghapus postingan: ${responseJson['message']}'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    } else {
                      // Error handling
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('Terjadi kesalahan pada server'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
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
              ApiService.urlGambar(_imagePost),
              fit: BoxFit.fitWidth,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                    child: Text(
                        'Tidak dapat memuat gambar')); // Memberikan pesan error lebih informatif
              },
            ),
          ),
          // SizedBox(height: 1),
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: Row(
          //     children: [
          //       IconButton(
          //         icon: Image.asset(
          //           'assets/icon/komentar.png',
          //           width: 24.0,
          //           height: 24.0,
          //           color: AppColors.gray100,
          //         ),
          //         onPressed: () {
          //           Navigator.push(context,
          //               MaterialPageRoute(builder: (context) => Komentar()));
          //         },
          //       ),
          //       SizedBox(width: 1.0),
          //       Text(
          //         'Komentar',
          //         style: TextStyle(
          //           color: AppColors.hitam,
          //           fontSize: 16.0,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
