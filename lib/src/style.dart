import 'package:flutter/material.dart';

class AppColors {
  static const tomato = Color(0xFFFB1313);
  static const hijau = Color(0xFF259E73);
  static const biruMuda = Color(0xFF49BAD3);
  static const gray800 = Color(0xFF1F2A37);
  static const gray700 = Color(0xFF6B7280);
  static const gray300 = Color(0xFFF9FAFB);
  static const gray200 = Color(0xFFD1D5DB);
  static const gray100 = Color(0xFF9CA3AF);
  static const putih = Color(0xFFFFFFFF);
  static const hitam = Color(0xFF28293D);
}

class TextStyles {
  static TextStyle title = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500, // Gunakan FontWeight.w500 untuk medium
    fontSize: 15.0,
    color: AppColors.gray800,
  );


  static TextStyle body = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.bold,
    fontSize: 30.0,
    color: AppColors.gray800,
  );


  static TextStyle hint = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: AppColors.gray700
  );

  static TextStyle tomato = const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 15.0,
    color: AppColors.tomato,
  );

  
}

