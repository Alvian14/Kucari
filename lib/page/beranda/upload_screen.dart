import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_kucari/src/ApiService.dart';
import 'package:project_kucari/src/style.dart';
import 'package:project_kucari/widget/textfield/custom_textfield3.dart';
import 'package:project_kucari/widget/textfield/custom_textfield2.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key, required this.userId});
  final int userId;

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final kategoriController = TextEditingController();
  final judulController = TextEditingController();
  final deskripsiController = TextEditingController();
  final alamatController = TextEditingController();
  final lokasiController = TextEditingController();
  final tanggalController = TextEditingController();
  final waktuController = TextEditingController();
  final forController = TextEditingController();
  bool isObscure = true;
  // String selectedCategory = 'Kehilangan'; // Default category
  late XFile? _imageFile = null; // Inisialisasi variabel _imageFile dengan null

  // Metode untuk memilih gambar dari galeri
  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = image;
    });
  }


   Future<void> _uploadPostingan() async {
    var request = http.MultipartRequest('POST', ApiService.url('coba.php'));
    request.fields['id_user'] = widget.userId.toString(); // Menggunakan userId dari widget
    request.fields['kategori'] = kategoriController.text;
    request.fields['judul_postingan'] = judulController.text;
    request.fields['deskripsi'] = deskripsiController.text;
    request.fields['alamat'] = alamatController.text;
    request.fields['lokasi'] = lokasiController.text;
    request.fields['tanggal_postingan'] = tanggalController.text;
    request.fields['jam_postingan'] = waktuController.text;

    if (_imageFile != null) {
      request.files.add(await http.MultipartFile.fromPath('foto_postingan', _imageFile!.path));
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Postingan berhasil diunggah')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal mengunggah postingan')));
    }
  }


  // Metode untuk menampilkan modal bottom sheet
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          surfaceTintColor: AppColors.putih,
          backgroundColor: AppColors.putih,
          elevation: 5,
          shadowColor: AppColors.hitam,
          title: Text(
            'UNGGAH LAPORAN',
            style: TextStyles.titlehome,
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //textField Kategori
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Text(
                      'Kategori',
                      style: TextStyles.title,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 370.0,
                    ),
                    child: CustomTextField2(
                      controller: kategoriController,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      dropdownItems: ['Kehilangan', 'Ditemukan'],
                    ),
                  ),
                  // end textField Kategori

                  // textField Judul
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Text(
                      'Judul',
                      style: TextStyles.title,
                    ),
                  ),

                  SizedBox(height: 8.0),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 370.0,
                    ),
                    child: CustomTextField2(
                      controller: judulController,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      enableDropdown: false, // Dropdown tidak diaktifkan
                    ),
                  ),
                  // end TextField Judul

                  // start textfield deskripsi
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Text(
                      'Deskripsi',
                      style: TextStyles.title,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 370.0,
                    ),
                    child: CustomTextField3(
                      controller: deskripsiController,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.newline,
                    ),
                  ),
                  // end textfield deskripsi

                  // start Alamat
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Text(
                      'Alamat',
                      style: TextStyles.title,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 370.0,
                    ),
                    child: CustomTextField2(
                      controller: alamatController,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      dropdownItems: [
                        'Bagor',
                        'Baron',
                        'Berbek',
                        'Gondang',
                        'Jatikalen',
                        'Kertosono',
                        'Lengkong',
                        'Loceret',
                        'Nganjuk',
                        'Ngetos',
                        'Ngluyu',
                        'Ngronggot',
                        'Pace',
                        'Patianrowo',
                        'Prambon',
                        'Rejoso',
                        'Sawahan',
                        'Sukomoro',
                        'Tanjunganom',
                        'Wilangan',
                      ],
                    ),
                  ),
                  // end alamat

                  // start lokasi
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Text(
                      'Lokasi terakhir',
                      style: TextStyles.title,
                    ),
                  ),

                  SizedBox(height: 8.0),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 370.0,
                    ),
                    child: CustomTextField2(
                      controller: lokasiController,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      enableDropdown: false, // Dropdown tidak diaktifkan
                    ),
                  ),
                  // end lokasi

                  // start tanggal dan waktu
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tanggal',
                              style: TextStyles.title,
                            ),
                            SizedBox(height: 8.0),
                            InkWell(
                              onTap: () async {
                                final selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                if (selectedDate != null) {
                                  // Update value in TextField if date selected
                                  setState(() {
                                    tanggalController.text =
                                        DateFormat('yyyy-MM-dd')
                                            .format(selectedDate);
                                  });
                                }
                              },
                              child: IgnorePointer(
                                child: CustomTextField2(
                                  controller: tanggalController,
                                  textInputType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  enableDropdown:
                                      false, // Dropdown tidak diaktifkan
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.0), // Jarak antara tanggal dan waktu
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Waktu',
                              style: TextStyles.title,
                            ),
                            SizedBox(height: 8.0),
                            InkWell(
                              onTap: () async {
                                final selectedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (selectedTime != null) {
                                  // Update value in TextField if time selected
                                  setState(() {
                                    waktuController.text =
                                        selectedTime.format(context);
                                  });
                                }
                              },
                              child: IgnorePointer(
                                child: CustomTextField2(
                                  controller: waktuController,
                                  textInputType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  enableDropdown:
                                      false, // Dropdown tidak diaktifkan
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // end tanggal dan waktu
                  Text(
                    'Note: tanggal & waktu terakhir dilihat',
                    style: TextStyles.hint,
                  ),

                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Text(
                      'Foto',
                      style: TextStyles.title,
                    ),
                  ),

                  // start gambar upload
                  SizedBox(height: 0.9),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () => _showSheet(context),
                      child: Container(
                        width: 400, // Atur lebar container di sini
                        height: 200,
                        decoration: BoxDecoration(
                          // border: Border.all(color: AppColors.gray100),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              // blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: _imageFile != null
                            ? Image.file(
                                File(_imageFile!.path),
                                fit: BoxFit.cover,
                              )
                            : Icon(Icons.add_a_photo,
                                size: 100, color: Colors.grey),
                      ),
                    ),
                  ),
                  Text(
                    'Note:Optional ',
                    style: TextStyles.hint,
                  ),
                  // end gambar upload
                  SizedBox(height: 50),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _uploadPostingan();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 100.0, vertical: 13.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: AppColors.hijau,
                      ),
                      child: Text(
                        'Unggah',
                        style: TextStyle(color: Colors.white).copyWith(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
