import 'package:flutter/material.dart';
import 'package:project_kucari/src/style.dart';
import 'package:project_kucari/widget/custom_textfield.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final passwordController = TextEditingController();
  final passwordforController = TextEditingController();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lupa Kata Sandi',
          style: TextStyles.body,
        ),
        // backgroundColor: AppColors.putih,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 140),
                Text(
                  'Kode telah dikirim ke WhatsApp Anda \n08**********',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 40),
                OtpTextField(
                  numberOfFields: 4,
                  borderRadius: BorderRadius.circular(8),
                  borderColor: AppColors.gray200,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Code entered is $verificationCode'),
                            ],
                          ),
                        );
                      },
                    );
                  }, // end onSubmit
                ),
                SizedBox(height: 20),
                Text(
                  'Kirim ulang kode dalam',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '53',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      ' detik',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 270),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: 145.0,
                        vertical: 20.0), // Sesuaikan dengan kebutuhan
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Tidak ada radius
                    ),
                    backgroundColor: AppColors.hijau,
                  ),
                  child: Text(
                    'VERIFIKASI',
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
    );
  }
}