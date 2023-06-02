// import 'dart:convert';
//
// Data _dataDataFromJson(String str) => Data.fromJson(json.decode(str));
//
// String _dataDataToJson(Data data) => json.encode(data.toJson());
//
// class Data {
//   Data({
//     required this.data,
//     required this.totalResult,
//   });
//
//   List<Bookstore> data;
//   int totalResult;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     data: List<Bookstore>.from(json["data"].map((x) => Bookstore.fromJson(x))),
//     totalResult: json["totalResult"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     "totalResult": totalResult,
//   };
//
// }
//
// class Bookstore {
//   final String id;
//   final String gambar;
//   final String judul;
//   final String penulis;
//   final String tahun;
//   final String kategori;
//   final String harga;
//   final String deskripsi;
//   final String penerbit;
//   final String halaman;
//   // final String created_at;
//   // final String updated_at;
//
//   Bookstore(
//       {required this.id,
//         required this.gambar,
//         required this.judul,
//         required this.penulis,
//         required this.tahun,
//         required this.kategori,
//         required this.harga,
//         required this.deskripsi,
//         required this.penerbit,
//         required this.halaman,
//         // required this.created_at,
//         // required this.updated_at
//       });
//
//   // Users getById(String id) => Users(
//   //     id: id,
//   //     title: title,
//   //     writer: writer,
//   //     penerbit: penerbit,
//   //     tahun: tahun,
//   //     desc: desc,
//   //     price: price,
//   //     image: image,
//   //     rating: rating,
//   //     pages: pages
//   // );
//   //
//   // Users getByPosition(String position) {
//   //   return getById(position);
//   // }
//
//
//   factory Bookstore.fromJson(Map<String, dynamic> json) => Bookstore(
//     id: json['id'],
//     gambar: json['gambar'],
//     judul: json['judul'],
//     penulis: json['penulis'],
//     tahun: json['tahun'],
//     kategori: json['kategori'],
//     harga: json['harga'],
//     deskripsi: json['deskripsi'],
//     penerbit: json['penerbit'],
//     halaman: json['halaman'],
//     // created_at: json['created_at'],
//     // updated_at: json['updated_at'],
//   );
//
//   Map<String, dynamic> toJson() => {
//     'id': id.toString(),
//     'gambar': gambar.toString(),
//     'judul': judul.toString(),
//     'penulis': penulis.toString(),
//     'tahun': tahun.toString(),
//     'kategori': kategori.toString(),
//     'harga': harga.toString(),
//     'deskripsi': deskripsi.toString(),
//     'penerbit': penerbit.toString(),
//     'halaman': halaman.toString(),
//     // 'created_at': created_at.toString(),
//     // 'updated_at': updated_at.toString()
//   };
//
// }

import 'dart:convert';

Data _DataFromJson(String str) => Data.fromJson(json.decode(str));

String _DataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    required this.data,
    required this.totalResult,
  });

  List<Bookstores> data;
  int totalResult;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<Bookstores>.from(json["data"].map((x) => Bookstores.fromJson(x))),
    totalResult: json["totalResult"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "totalResult": totalResult,
  };

}

class  Bookstores {
  final String id;
  final String gambar;
  final String judul;
  final String penulis;
  final String tahun;
  final String kategori;
  final String harga;
  final String deskripsi;
  final String penerbit;
  final String halaman;

  Bookstores(
      {required this.id,
        required this.gambar,
        required this.judul,
        required this.penulis,
        required this.tahun,
        required this.kategori,
        required this.harga,
        required this.deskripsi,
        required this.penerbit,
        required this.halaman});

  // Users getById(String id) => Users(
  //     id: id,
  //     title: title,
  //     writer: writer,
  //     penerbit: penerbit,
  //     tahun: tahun,
  //     desc: desc,
  //     price: price,
  //     image: image,
  //     rating: rating,
  //     pages: pages
  // );
  //
  // Users getByPosition(String position) {
  //   return getById(position);
  // }


  factory Bookstores.fromJson(Map<String, dynamic> json) => Bookstores(
      id: json['id'],
      gambar: json['gambar'],
      judul: json['judul'],
      penulis: json['penulis'],
      tahun: json['tahun'],
      kategori: json['kategori'],
      harga: json['harga'],
      deskripsi: json['deskripsi'],
      penerbit: json['penerbit'],
      halaman: json['halaman']
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'gambar': gambar,
    'judul': judul,
    'penulis': penulis,
    'tahun': tahun,
    'kategori': kategori,
    'harga': harga,
    'deskripsi': deskripsi,
    'penerbit': penerbit,
    'halaman': halaman,
  };

}







