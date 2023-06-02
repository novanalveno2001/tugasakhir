import 'package:tugasakhir/data.dart';
import 'package:tugasakhir/mock api/datadata.dart';
import 'package:tugasakhir/mock%20api/akses%20API.dart';

class FavoriteListModel {

  static List<String> itemNames = [
    'MUHAMMADKU SAYANGKU 3',
    'DONGENG MBAH JIWO',
    'MANTIQ',
    'TENTANG KITA DAN LAUT',
    'SIRAH NABAWIYAH',
    'PULANG KE RINJANI',
    'SEPOTONG HATI DI ANGKRINGAN',
    'SESAUDARA DALAM IMAN',
    'ADAB DI ATAS ILMU',
    'WAYAHE NGOPI 2',


  ];



  static List<String> itemSubtitle = [
    'Edi Ah iyubenu',
    'Sudjiwo Tedjo',
    'Aziz Anwar Fachrudin',
    'Yetti A.KA',
    'Syaikh Shafiyur Rahman al-Mubarakpuri',
    'Reza Nufa',
    'Joko Pinurbo',
    'Edi AH Iyubenu',
    'Imam Nawawi',
    'Tri Wibowo BS'

  ];

  static List<String> itemImages = [
    ('assets/buku1.jpg'),
    ("assets/buku2.jpg"),
    ("assets/buku3.jpg"),
    ("assets/buku4.jpg"),
    ("assets/buku5.jpg"),
    ("assets/buku6.jpg"),
    ("assets/buku7.jpg"),
    ("assets/buku8.jpg"),
    ("assets/buku9.jpg"),
    ("assets/buku10.jpg"),
  ];





  

  Item getById(int id) => Item(
    id,
    itemNames[id % itemNames.length],
    itemSubtitle[id % itemSubtitle.length],
    itemImages[id % itemImages.length],
  );

  Item getByPosition(int position) {
    return getById(position);
  }
}

class Item {
  final int id;
  final String name;
  final String subtitle;
  final String image;

  const Item (
      this.id,
      this.name,
      this.subtitle,
      this.image,
      );

  @override
  int get hashCode => id;

  @override
  bool operator == (Object other) => other is Item && other.id == id;

}

class ItemFavorite {
  final int id;
  final String title;
  final String writer;
  final String gambar;

  ItemFavorite(
      this.id,
      this.title,
      this.writer,
      this.gambar
      );

  @override
  int get hashCode => id;

  @override
  bool operator == (Object other) => other is ItemFavorite && other.id == id;

}

class ListFavoriteModel {

  static List<String> itemTitle = [];

  static List<String> itemWriter = [];

  static List<String> itemImages = [];


  ItemFavorite getById(int id) => ItemFavorite(
      id,
      itemTitle[id % itemTitle.length],
      itemWriter[id % itemWriter.length],
      itemImages[id % itemImages.length],
  );

  ItemFavorite getByPosition(int position) {
    return getById(position);
  }
}