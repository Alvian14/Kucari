import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_kucari/src/style.dart';

class CustomTextField2 extends StatefulWidget {
  const CustomTextField2({
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    required this.dropdownItems, // Menambahkan list item dropdown
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final List<String> dropdownItems; // List item dropdown

  @override
  _CustomTextField2State createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextField2> {
  String selectedItem = ''; // Menyimpan item dropdown yang dipilih

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      cursorColor: AppColors.gray700,
      decoration: InputDecoration(
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
        suffixIcon: IconButton(
          icon: Icon(Icons.more_vert), // Icon titik tiga
          onPressed: () {
            _showDropdownMenu(context); // Panggil fungsi untuk menampilkan dropdown
          },
        ),
      ),
    );
  }

  void _showDropdownMenu(BuildContext context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    final result = await showMenu(
      context: context,
      position: position,
      items: widget.dropdownItems.map((item) {
        return PopupMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );

    if (result != null) {
      setState(() {
        selectedItem = result; // Simpan item dropdown yang dipilih
        widget.controller.text = selectedItem; // Isi nilai pada TextField
      });
    }
  }
}
