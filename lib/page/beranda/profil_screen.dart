import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_kucari/page/beranda/ubah_kataSandi.dart';
import 'package:project_kucari/page/beranda/ubah_profil.dart';
import 'package:project_kucari/page/login_screen.dart';
import 'package:project_kucari/src/style.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  late ImagePicker _imagePicker; // Declare image picker instance
  File? _imageFile; // Declare variable to store selected image file

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker(); // Initialize image picker instance
  }

  // Function to open image picker and select image
  Future<void> _pickImage(ImageSource source) async {
    final XFile? selectedImage =
        await _imagePicker.pickImage(source: source);
    if (selectedImage != null) {
      setState(() {
        _imageFile = File(selectedImage.path); // Set selected image file to state
      });
    }
  }

  Future<dynamic> _showSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () => _pickImage(ImageSource.camera),
                backgroundColor: Colors.black,
                heroTag: 'camera',
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 15),
              FloatingActionButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                backgroundColor: Colors.purple,
                heroTag: 'gallery',
                child: const Icon(
                  Icons.image_outlined,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 15),
              _imageFile != null
                  ? FloatingActionButton(
                      onPressed: () {
                        setState(() => _imageFile = null);
                        Navigator.pop(context);
                      },
                      backgroundColor: Colors.blueGrey,
                      heroTag: 'delete',
                      child: const Icon(
                        Icons.delete_outlined,
                        color: Colors.white,
                      ),
                    )
                  : const Material(),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // Check if image is selected, if not, use default image, else use selected image
                  backgroundImage: _imageFile != null
                      ? FileImage(_imageFile!)
                      : AssetImage('assets/img/foto_profil.jpg') as ImageProvider,
                ),
                Positioned(
                  top: 55,
                  left: 55,
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _showSheet(context); // Call function to show bottom sheet
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
            Text(
              'email@example.com', // Ganti dengan email
              style: TextStyles.hint,
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ubahProfil()));
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
            //...

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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ubahKataSandi()));
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
            child: Text(
              "Tidak",
              // style,
            ),
          ),
          TextButton(
            onPressed: () {
              // Perform logout action here
              Navigator.pushReplacement(
                // Use pushReplacement to prevent going back to the previous screen
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
