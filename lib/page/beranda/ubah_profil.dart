import 'package:flutter/material.dart';
import 'package:project_kucari/src/style.dart';
import 'package:project_kucari/widget/custom_textfield.dart';

class ubahProfil extends StatelessWidget {
  ubahProfil({super.key});
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final WhatsAppController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Ubah Profil',
            style: TextStyles.titlehome,
          ),
          leading: IconButton( // Tambahkan IconButton sebagai leading di AppBar
            icon: Icon(Icons.arrow_back), // Gunakan ikon kembali dari material icons
            onPressed: () {
              Navigator.pop(context); // Kembali ke halaman sebelumnya saat ikon kembali ditekan
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(14.0),
              child: Column(
                children: [
                  // start textfield nama
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Nama',
                          style: TextStyles.title,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 340.0,
                    ),
                    child: CustomTextField(
                      controller: namaController,
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      prefixIcon: 'assets/img/Profile.png',
                      hint: '',
                    ),
                  ),
                  // finish textfield nama
      
                  // start textfield email
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Email',
                          style: TextStyles.title,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 340.0,
                    ),
                    child: CustomTextField(
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      prefixIcon: 'assets/img/email.png',
                      hint: '',
                    ),
                  ),
                  // finish textfield email
      
                  // start no wa
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'WhatsApp',
                          style: TextStyles.title,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 340.0,
                    ),
                    child: CustomTextField(
                      controller: WhatsAppController,
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      prefixIcon: 'assets/img/whatsapp.png',
                      hint: '',
                    ),
                  ),
                  // finish textfield no wa
      
                  // button start
                  SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 13.0), // Sesuaikan dengan kebutuhan
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Tidak ada radius
                      ),
                      backgroundColor: AppColors.hijau,
                    ),
                    child: Text(
                      'UBAH',
                      style: TextStyle(color: Colors.white).
                      copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  // button Finish
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
