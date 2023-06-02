import 'dart:convert';

Datadata _dataDataFromJson(String str) => Datadata.fromJson(json.decode(str));

String _dataDataToJson(Datadata data) => json.encode(data.toJson());

class Datadata {
  Datadata({
   required this.data,
   required this.totalResult,
  });

  List<Users> data;
  int totalResult;

  factory Datadata.fromJson(Map<String, dynamic> json) => Datadata(
    data: List<Users>.from(json["data"].map((x) => Users.fromJson(x))),
    totalResult: json["totalResult"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "totalResult": totalResult,
  };

}

class  Users {
  final String id;
  final String title;
  final String writer;
  final String penerbit;
  final String tahun;
  final String desc;
  final String price;
  final String image;
  final String rating;
  final String pages;

  Users(
      {required this.id,
      required this.title,
      required this.writer,
      required this.penerbit,
      required this.tahun,
      required this.desc,
      required this.price,
      required this.image,
      required this.rating,
      required this.pages});

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


  factory Users.fromJson(Map<String, dynamic> json) => Users(
      id: json['id'],
      title: json['title'],
      writer: json['writer'],
      penerbit: json['penerbit'],
      tahun: json['tahun'],
      desc: json['desc'],
      price: json['price'],
      image: json['image'],
      rating: json['rating'],
      pages: json['pages'],
    );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'writer': writer,
    'penerbit': penerbit,
    'tahun': tahun,
    'desc': desc,
    'price': price,
    'image': image,
    'rating': rating,
    'pages': pages,
  };

}




