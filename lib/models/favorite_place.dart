import 'dart:convert';
import 'package:tugasakhir/data.dart';
import 'package:tugasakhir/data.dart';

FavoritePlace favoritePlaceFromJson(String str) => FavoritePlace.fromJson(json.decode(str));

String favoritPlaceFromJson(FavoritePlace data) => json.encode(data.toJson());

class FavoritePlace {
  FavoritePlace({
    required this.data,
    required this.totalResult,

  });


  List<Place> data;
  int totalResult;

  factory FavoritePlace.fromJson(Map<String, dynamic> json) => FavoritePlace(
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
    required this.name,
    required this.location,
    required this.mainImage,
    required this.open,
    required this.hours,
    required this.ticket,
    required this.description,
    required this.gallery,
    this.id,
  });

  String name;
  String location;
  String mainImage;
  String open;
  String hours;
  String ticket;
  String description;
  List<Gallery> gallery;
  String? id;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
    name: json["name"],
    location: json["location"],
    mainImage: json["main-image"],
    open: json["open"],
    hours: json["hours"],
    ticket: json["ticket"],
    description: json["description"],
    gallery: List<Gallery>.from(json["gallery"].map((x) => Gallery.fromJson(x))),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "location": location,
    "main-image": mainImage,
    "open": open,
    "hours": hours,
    "ticket": ticket,
    "description": description,
    "gallery": List<dynamic>.from(gallery.map((x) => x.toJson())),
    "id": id,
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