import 'package:flutter/material.dart';
import 'package:project_kucari/src/style.dart';
import 'package:project_kucari/widget/custom_textfield.dart';

class ubahKataSandi extends StatefulWidget {
  ubahKataSandi({Key? key}) : super(key: key);

  @override
  _ubahKataSandiState createState() => _ubahKataSandiState();
}

class _ubahKataSandiState extends State<ubahKataSandi> {
  final passwordOldController = TextEditingController();
  final passwordNewController = TextEditingController();
  final passwordforController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Ubah Kata Sandi',
            style: TextStyles.titlehome,
          ),
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
                children: [
                  SizedBox(height: 50),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Kata Sandi Lama',
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
                      controller: passwordOldController,
                      textInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
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
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Kata Sandi Baru',
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
                      controller: passwordNewController,
                      textInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
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
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Konfirmasi Kata Sandi Baru',
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
                      controller: passwordforController,
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
                  SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 13.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      backgroundColor: AppColors.hijau,
                    ),
                    child: Text(
                      'UBAH',
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
      ),
    );
  }
}
