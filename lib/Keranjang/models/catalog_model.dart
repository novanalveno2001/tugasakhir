import 'package:flutter/material.dart';
import 'package:tugasakhir/favorit/favorite_list_models.dart';
import 'package:tugasakhir/data.dart';

class CatalogModel {

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

  static List<int> itemPrices = [
    40000,
    50000,
    42000,
    60000,
    65000,
    40000,
    55000,
    60000,
    42000,
    50000,
  ];

  Item getById(int id) => Item(
    id,
    itemNames[id % itemNames.length],
    itemSubtitle[id % itemSubtitle.length],
    itemImages[id % itemImages.length],
    itemPrices[id % itemPrices.length],
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
  final int price;

  const Item (
      this.id,
      this.name,
      this.subtitle,
      this.image,
      this.price

      );

  @override
  int get hashCode => id;

  @override
  bool operator == (Object other) => other is Item && other.id == id;

}