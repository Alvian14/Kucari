import 'package:flutter/material.dart';
import 'package:project_kucari/src/navbar_screen.dart';
import 'package:project_kucari/page/daftar_screen.dart';
import 'package:project_kucari/page/lupa_kata_sandi/lupa_kataSandi.dart';
import 'package:project_kucari/src/style.dart';
import 'package:project_kucari/widget/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 55.0),
                // SizedBox(height: 4.0),
                Image.asset(
                  'assets/img/login.png',
                  width: 230.0,
                  height: 230.0,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 12.0),
                Text(
                  'MASUK',
                  style: TextStyles.body,
                ),

                // Email
                SizedBox(height: 5.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'E-mail',
                        style: TextStyles.title,
                      ),
                    ),
                    // Tambahkan widget lainnya di sini jika diperlukan
                  ],
                ),

                // TextField Email
                SizedBox(height: 3.0),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 340.0,
                  ),
                   child: CustomTextField( // Mengganti CustomTextField menjadi CostumTextField
                    controller: emailController, // Menggunakan emailController
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    prefixIcon: 'assets/img/email.png',
                    hint: 'email@gmail.com', // Menggunakan textInputAction dengan huruf kecil
                  ),
                ),

                // Kata Sandi
                SizedBox(height: 12.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Kata Sandi',
                        style: TextStyles.title,
                      ),
                    ),
                  ],
                ),

                // TextField Kata Sandi
                SizedBox(height: 3.0),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 340.0,
                  ),
                  child: CustomTextField( // Mengganti CustomTextField menjadi CostumTextField
                    controller: passwordController, 
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


                SizedBox(height: 9.0),
                Align(
                  alignment: FractionalOffset(0.92, 0.0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman lupa kata sandi
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LupaKataSandi()),
                      );
                    },
                    child: Text(
                      'Lupa Kata Sandi?',
                      style: TextStyles.tomato,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => NavbarScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 143.0, vertical: 12.0), // Sesuaikan dengan kebutuhan
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: AppColors.hijau,
                  ),
                  child: Text(
                    'MASUK',
                    style: TextStyle(color: Colors.white).
                    copyWith(
                      fontSize: 16.0,
                    ),
                  ),
                ),

                SizedBox(height: 18.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 100.0,  // Ganti dengan lebar minimum yang diinginkan
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 83.0),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HalamanDaftar()));
                          },
                          child: RichText(
                            text: TextSpan(
                              style: TextStyles.title,
                              children: [
                                TextSpan(
                                  text: 'Belum punya akun? ',
                                ),
                                TextSpan(
                                  text: 'Daftar',
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
