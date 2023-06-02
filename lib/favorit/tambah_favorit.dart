//
//
// import 'package:tugasakhir/mock%20api/datadata.dart';
//
// class TambahFavorit {
//   final Users users;
//
//   static List<String> itemTitle = [];
//   static List<String> itemWriter = [];
//   static List<String> itemImage = [];
//
//
//   ItemFavorite getById(int id) => ItemFavorite(
//       id,
//       itemTitle[id % itemTitle.length],
//       itemWriter[id % itemWriter.length],
//       itemImage[id % itemImage.length],
//   );
//
//   ItemFavorite getByPosition(int position) {
//     return getById(position);
//   }
//
//   TambahFavorit(this.users);
// }
//
// class ItemFavorite {
//   final int id;
//   final String title;
//   final String writer;
//   final String image;
//
//   const ItemFavorite (
//       this.id,
//       this.title,
//       this.writer,
//       this.image,
//       );
//
//   @override
//   int get hashCode => id;
//
//   @override
//   bool operator == (Object other) => other is ItemFavorite && other.id == id;
//
// }