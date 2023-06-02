import 'package:flutter/material.dart';
import 'package:tugasakhir/mock%20api/akses%20API.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Users> list = [];
  Repository repository = Repository();
  List<Users> get wishlists => list;

  getData() async {
    list = await repository.getData();
  }




  void toggleFavorite(Users wishlist) {
    final isExist = list.contains(wishlist);

    if(isExist) {
      list.remove(wishlist);
    } else {
      list.add(wishlist);
    }
    notifyListeners();
  }

  bool isExist(Users wishlist) {
    final isExist = list.contains(wishlist);
    return isExist;
  }

  void clearFavorite() {
    list = [];
    notifyListeners();
  }
}