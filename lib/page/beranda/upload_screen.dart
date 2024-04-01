import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_kucari/src/style.dart';
import 'package:project_kucari/widget/textfield/custom_textfield3.dart';
import 'package:project_kucari/widget/textfield/custom_textfield2.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final kategoriController = TextEditingController();
  final judulController = TextEditingController();
  final deskripsiController = TextEditingController();
  final alamatontroller = TextEditingController();
  final lokasiController = TextEditingController();
  final tanggalController = TextEditingController();
  final waktuController = TextEditingController();
  final forController = TextEditingController();
  bool isObscure = true;
  String selectedCategory = 'Kehilangan'; // Default category
  late XFile? _imageFile = null; // Inisialisasi variabel _imageFile dengan null

  // Metode untuk memilih gambar dari galeri
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _imageFile = image;
    }
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
                      controller: alamatontroller,
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: 300, // Atur lebar container di sini
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
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

                  // end gambar upload
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
