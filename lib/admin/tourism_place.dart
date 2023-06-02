import 'dart:convert';

TourismPlace tourismPlaceFromJson(String str) => TourismPlace.fromJson(json.decode(str));

String tourismPlaceToJson(TourismPlace data) => json.encode(data.toJson());

class TourismPlace {
  TourismPlace({
    required this.data,
    required this.totalResult,

  });

  List<Place> data;
  int totalResult;

  factory TourismPlace.fromJson(Map<String, dynamic> json) => TourismPlace(
    data: List<Place>.from(json["data"].map((x) => Place.fromJson(x))),
    totalResult: json["totalResult"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "totalResult": totalResult,
  };
}

class Place {
  Place({
    required this.mainImage,
    required this.judul,
    required this.penerbit,
    required this.penulis,
    required this.tahun,
    required this.harga,
    required this.description,
    this.id
  });

  String mainImage;
  String judul;
  String penerbit;
  String penulis;
  String tahun;
  String harga;
  String description;
  String? id;


  factory Place.fromJson(Map<String, dynamic> json) => Place(
    mainImage: json["main-image"],
    judul: json["judul"],
    penerbit: json["penerbit"],
    penulis: json["penulius"],
    tahun: json["tahun"],
    harga: json["harga"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "main-image": mainImage,
    "judul": judul,
    "penerbit": penerbit,
    "penulis": penulis,
    "tahun": tahun,
    "harga": harga,
    "description": description,
  };
}

class Gallery {
  Gallery({
    required this.src,
  });

  String src;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
    src: json["src"],
  );

  Map<String, dynamic> toJson() => {
    "src": src,
  };
}