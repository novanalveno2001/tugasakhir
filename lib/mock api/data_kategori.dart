import 'dart:convert';


class DataKategori {
  DataKategori({
    required this.data,
    required this.totalResult,
  });

  List<Kategori> data;
  int totalResult;

  factory DataKategori.fromJson(Map<String, dynamic> json) => DataKategori(
    data: List<Kategori>.from(json["data"].map((x) => Kategori.fromJson(x))),
    totalResult: json["totalResult"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "totalResult": totalResult,
  };

}

class Kategori {
  final String id;
  final String gambar;
  final String kategori;
  final String subkategori;

  Kategori({
    required this.id,
    required this.gambar,
    required this.kategori,
    required this.subkategori,

  });


  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
    gambar: json['gambar'],
    kategori: json['kategori'],
    subkategori: json ['subkategori'],
    id: json ['id'],
  );

  Map<String, dynamic> toJson() => {
    'gambar': gambar,
    'kategori': kategori,
    'subkategori': subkategori,
    'id': id,
  };

}