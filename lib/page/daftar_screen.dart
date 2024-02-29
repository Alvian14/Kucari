import 'package:flutter/material.dart';
import 'package:project_kucari/page/login_screen.dart';
import 'package:project_kucari/src/style.dart';
import 'package:project_kucari/widget/custom_textfield.dart';

class HalamanDaftar extends StatefulWidget {
  @override
  _HalamanDaftarState createState() => _HalamanDaftarState();
}

class _HalamanDaftarState extends State<HalamanDaftar> {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final WhatsAppController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordforController = TextEditingController();
   bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Ganti dengan warna yang diinginkan
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16.0,),
                Text(
                  'DAFTAR',
                  style: TextStyles.body,
                ),

               SizedBox(height: 30.0),
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
                    // Tambahkan widget lainnya di sini jika diperlukan
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
                    hint: 'Nama', 
                  ),
                ),


                SizedBox(height: 16.0),
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
                    hint: 'email@gmail.com', 
                  ),
                ),


                SizedBox(height: 16.0),
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
                   controller: WhatsAppController, // Menggunakan emailController
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    prefixIcon: 'assets/img/whatsapp.png',
                    hint: '08123456789', 
                  ),
                ),

                SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'kata Sandi',
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
                  child: CustomTextField( // Mengganti CustomTextField menjadi CostumTextField
                    controller: passwordController, 
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    prefixIcon: 'assets/img/Lock.png',
                    hint: '',
                    isObscure: isObscure,
                    hasSuffix: true,
                    onPressed: (){
                      setState(() {
                        isObscure = ! isObscure;
                      });
                    }, 
                  ),
                ),


                SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Konfirmasi Kata Sandi',
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
                  child: CustomTextField( // Mengganti CustomTextField menjadi CostumTextField
                    controller: passwordforController, 
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    prefixIcon: 'assets/img/Lock.png',
                    hint: '',
                    isObscure: isObscure,
                    hasSuffix: true,
                    onPressed: (){
                      setState(() {
                        isObscure = ! isObscure;
                      });
                    }, 
                  ),
                ),

                SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 145.0, vertical: 13.0), // Sesuaikan dengan kebutuhan
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Tidak ada radius
                    ),
                    backgroundColor: AppColors.hijau,
                  ),
                  child: Text(
                    'DAFTAR',
                    style: TextStyle(color: Colors.white).
                    copyWith(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                

                SizedBox(height: 20.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 100.0,  // Ganti dengan lebar minimum yang diinginkan
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 85.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: Colors.white, 
                        side: BorderSide(
                          color: AppColors.gray200,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/img/search.png',
                            width: 24.0,
                            height: 24.0,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            'Masuk dengan Google',
                            style: TextStyle(color: Colors.black).copyWith(  // Menggunakan warna kontras agar terlihat
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


                SizedBox(height: 50.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                        child: RichText(
                          text: TextSpan(
                            style: TextStyles.title,
                            children: [
                              TextSpan(
                                text: 'Sudah punya akun? ',
                              ),
                              TextSpan(
                                text: 'Masuk',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
