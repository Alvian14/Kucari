import 'package:flutter/material.dart';
import 'package:project_kucari/page/lupa_kata_sandi/kodeOtp_screen.dart';
import 'package:project_kucari/src/style.dart';
import 'package:project_kucari/widget/textfield/custom_textfield.dart';

class LupaKataSandi extends StatefulWidget {
  @override
  _LupaKataSandi createState() => _LupaKataSandi();
}

class _LupaKataSandi extends State<LupaKataSandi> {
  final WhatsAppController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.putih,
        shadowColor: AppColors.hitam,
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
                SizedBox(height: 30.0),
                Image.asset(
                  'assets/img/lupaSandi.png',
                ),
                SizedBox(height: 16.0),
                Text(
                  'LUPA KATA SANDI',
                  style: TextStyles.body,
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Silakan masukkan Email yang telah terdaftar pada akun anda.',
                    style: TextStyles.hint,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 5.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Email',
                        style: TextStyles.title,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 3.0),
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 340.0,
                  ),
                  child: CustomTextField(
                    controller: WhatsAppController,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    prefixIcon: 'assets/img/email.png',
                    hint: '',
                  ),
                ),
                SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OTPScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: 130.0,
                        vertical: 13.0), // Sesuaikan dengan kebutuhan
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Tidak ada radius
                    ),
                    backgroundColor: AppColors.hijau,
                  ),
                  child: Text(
                    'KONFIRMASI',
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
