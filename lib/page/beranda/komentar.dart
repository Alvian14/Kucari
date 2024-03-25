import 'package:flutter/material.dart';
import 'package:project_kucari/src/style.dart';

class Komentar extends StatelessWidget {
  const Komentar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        surfaceTintColor: AppColors.putih,
        backgroundColor: AppColors.putih,
        elevation: 3,
        shadowColor: AppColors.hitam,
        title: Text(
          'Komentar',
          style: TextStyles.body,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: KomentarWidget(
        nama: 'Agus Fernando',
        waktu: '19:30 22/09/2024',
        isi:
            'Sebuah kucing berwarna oren yang tidak diketahui namanya telah ditemukan. Bulunya berwarna oren dengan corak belang yang mencolok.',
        isBalas: true,
        fotoProfil:
            'path/to/your/image.jpg', // Ganti dengan path ke gambar Anda
      ),
    );
  }
}

class KomentarWidget extends StatefulWidget {
  const KomentarWidget({
    Key? key,
    required this.nama,
    required this.waktu,
    required this.isi,
    this.isBalas = false,
    required this.fotoProfil,
  }) : super(key: key);

  final String nama;
  final String waktu;
  final String isi;
  final bool isBalas;
  final String fotoProfil;

  @override
  _KomentarWidgetState createState() => _KomentarWidgetState();
}

class _KomentarWidgetState extends State<KomentarWidget> {
  TextEditingController _replyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.only(bottom: 100),
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(widget.fotoProfil),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    widget.nama,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    widget.waktu,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(widget.isi),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: widget.isBalas
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: Colors.grey[200],
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _replyController,
                          decoration: InputDecoration(
                            hintText: 'Balas komentar...',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          String reply = _replyController.text;
                          print('Balasan: $reply');
                          _replyController.clear();
                        },
                      ),
                    ],
                  ),
                )
              : SizedBox.shrink(),
        ),
      ],
    );
  }
}
