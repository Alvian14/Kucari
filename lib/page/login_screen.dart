import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_kucari/page/daftar_screen.dart';
import 'package:project_kucari/page/lupa_kata_sandi/lupa_kataSandi.dart';
// import 'package:project_kucari/page/lupa_kata_sandi/lupa_kata_sandi.dart';
import 'package:project_kucari/src/navbar_screen.dart';
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

  Future<void> _login() async {
    final String apiUrl ='http://172.17.202.28/project_kucari/mobile/login.php'; // Ganti dengan alamat API login Anda
    final response = await http.post(Uri.parse(apiUrl),
        body: jsonEncode({
          'email': emailController.text,
          'password': passwordController.text,
        }));

    final responseData = jsonDecode(response.body);
    if (responseData['status'] == 'success') {
      // Navigasi ke halaman setelah login berhasil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => NavbarScreen(
                  onTabPressed: (p0) {},
                )),
      );
    } else {
      // Tampilkan pesan kesalahan jika login gagal
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Gagal'),
            content: Text(responseData['message']),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

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
                  ],
                ),
                SizedBox(height: 3.0),
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
                SizedBox(height: 3.0),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 340.0,
                  ),
                  child: CustomTextField(
                    controller: passwordController,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    prefixIcon: 'assets/img/Lock.png',
                    hint: '',
                    isObscure: isObscure,
                    hasSuffix: true,
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  ),
                ),
                SizedBox(height: 9.0),
                Align(
                  alignment: FractionalOffset(0.92, 0.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LupaKataSandi()),
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
                  onPressed:
                      _login, // Panggil fungsi _login saat tombol ditekan
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 143.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: AppColors.hijau,
                  ),
                  child: Text(
                    'MASUK',
                    style: TextStyle(color: Colors.white).copyWith(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                SizedBox(height: 18.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 100.0,
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 11.0, horizontal: 83.0),
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
                            style: TextStyle(color: Colors.black).copyWith(
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HalamanDaftar()));
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
