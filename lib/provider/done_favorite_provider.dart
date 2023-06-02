import 'package:flutter/material.dart';
import 'package:tugasakhir/data.dart';
import 'package:tugasakhir/models/favorite_place.dart';


class DoneFavoriteProvider extends ChangeNotifier {
  final List<Book> _doneFavoritePlaceList = [];

  List<Book> get doneFavoritePlaceList => _doneFavoritePlaceList;

  void complete(Book book, bool isDone){
    isDone
        ? _doneFavoritePlaceList.add(book)
        : _doneFavoritePlaceList.remove(book);
    notifyListeners();
  }

}