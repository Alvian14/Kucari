import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_kucari/src/style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    required this.prefixIcon,
    required this.hint,
    this.focusNode, // Tambahkan properti focusNode
    this.maxLength, 
    this.isObscure = false,
    this.hasSuffix = false,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String prefixIcon;
  final String hint;
  final bool isObscure;
  final bool hasSuffix;
  final VoidCallback? onPressed;
  final int? maxLength;
  final FocusNode? focusNode; // Deklarasikan focusNode sebagai parameter

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      cursorColor: AppColors.gray700,
      obscureText: isObscure,
      maxLength: maxLength,
      focusNode: focusNode, // Tambahkan focusNode ke dalam TextField
      decoration: InputDecoration(
        suffixIcon: hasSuffix
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
        filled: true,
        fillColor: AppColors.gray300,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.gray200,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: AppColors.gray200,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: Image.asset(
          prefixIcon,
          width: 20.0,
          height: 20.0,
          color: AppColors.gray700,
        ),
        hintText: hint,
        hintStyle: TextStyles.hint,
      ),
    );
  }
}
