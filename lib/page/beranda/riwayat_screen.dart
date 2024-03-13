// import 'package:flutter/material.dart';
// import 'package:project_kucari/src/style.dart';

// class RiwayatScreen extends StatefulWidget {
//   const RiwayatScreen({super.key});

//   @override
//   State<RiwayatScreen> createState() => _RiwayatScreenState();
// }

// class _RiwayatScreenState extends State<RiwayatScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DefaultTabController(
//         length: 2, // Jumlah tab, sesuaikan dengan kebutuhan
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text(
//               'RIWAYAT POSTINGAN',
//               style: TextStyles.titlehome,
//             ),
//             bottom: TabBar(
//               tabs: [
//                 Tab(text: 'Kehilangan'),
//                 Tab(text: 'Menu 2'),
//               ],
//             ),
//           ),
//           body: SafeArea(
//             child: TabBarView(
//               children: [
//                 // Konten untuk Menu 1
//                 ListView(
//                   children: [
//                     ListTile(
//                       title: Text('Postingan 1'),
//                     ),
//                     ListTile(
//                       title: Text('Postingan 2'),
//                     ),
//                     // Tambahkan item list sesuai dengan kebutuhan
//                   ],
//                 ),
//                 // Konten untuk Menu 2
//                 ListView(
//                   children: [
//                     ListTile(
//                       title: Text('Postingan A'),
//                     ),
//                     ListTile(
//                       title: Text('Postingan B'),
//                     ),
//                     // Tambahkan item list sesuai dengan kebutuhan
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
