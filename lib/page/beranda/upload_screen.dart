import 'package:flutter/material.dart';
import 'package:project_kucari/src/style.dart';
import 'package:project_kucari/widget/custom_textfield.dart';
import 'package:project_kucari/widget/custom_textfield2.dart';

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
  final lokasirdController = TextEditingController();
  final forController = TextEditingController();
  bool isObscure = true;
  String selectedCategory = 'Kehilangan'; // Default category

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
                    padding: const EdgeInsets.only(left: 10.0),
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
                      controller: judulController,
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      dropdownItems: ['Kehilangan', 'ditemukan'],
                    ),
                  ),
                  // end textField Kategori

                  // textField Judul
                   SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Judul',
                      style: TextStyles.title,
                    ),
                  ),

                  // SizedBox(height: 8.0),
                  // Container(
                  //   constraints: BoxConstraints(
                  //     maxWidth: 370.0,
                  //   ),
                  //   child: CustomTextField2(
                  //     controller: judulController,
                  //     textInputType: TextInputType.name,
                  //     textInputAction: TextInputAction.next,
              
                        
                  //     },
                  //   ),
                  // ),
                  // end TextField Judul





                  // SizedBox(height: 14.0), // Adjusted space
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Tambahkan logika yang sesuai ketika tombol diklik
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     padding: EdgeInsets.symmetric(horizontal: 130.0, vertical: 13.0),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //     ),
                  //     backgroundColor: AppColors.hijau,
                  //   ),
                  //   child: Text(
                  //     'KIRIM',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 14.0,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
