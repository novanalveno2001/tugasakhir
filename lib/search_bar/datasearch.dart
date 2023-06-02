

import 'package:tugasakhir/mock%20api/datadata.dart';

class DataSearch {
  String gambar, judul;


  DataSearch(
    this.gambar,
    this.judul,
  );
}

final List<DataSearch> search = [
  DataSearch('assets/sosial1.jpg', 'Catatan Para Mantan')
];

List<String> items = [

  "Muhammadku Sayangku 3",
  "Dongeng Mbah Jiwo",
  "Mantiq",
  "Tentang kita dan laut",
  "Sirah Nabawiyah",
  "Pulang ke rinjani",
  "Sepotong hati di angkringan",
  "Sesaudara dalam iman",
  "Adab di atas ilmu",
];



// class DataSearch {
//   String gambar, judul, penerbit;
//
//   DataSearch(this.gambar, this.judul, this.penerbit);
//
//
//   List<DataSearch> pencarian = [
//     DataSearch(
//         'assets/buku1.jpg',
//         'MUHAMMADKU SAYANGKU 3',
//         'Diva Press',
//     ),
//     DataSearch(
//       'assets/buku2.jpg',
//       'DONGENG MBAH JIWO',
//       'Diva Press',
//     ),
//     DataSearch(
//       'assets/buku3.jpg',
//       'MANTIQ',
//       'Ircisod',
//     ),
//     DataSearch(
//       'assets/buku1.jpg',
//       'MUHAMMADKU SAYANGKU 3',
//       'Diva Press',
//     ),
//   ];
// }
