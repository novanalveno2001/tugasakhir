import 'package:tugasakhir/favorit/favorite_list_models.dart';
import 'package:flutter/foundation.dart';

class FavoritePageModel extends ChangeNotifier {
  late FavoriteListModel _favoritelist;

  final List<int> _itemIds = [];

  FavoriteListModel get favoriteList => _favoritelist;

  set favoritelist(FavoriteListModel newList) {
    _favoritelist = newList;
    notifyListeners();
  }

  List<Item> get items =>
      _itemIds.map((id) => _favoritelist.getById(id)).toList();

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}


class TambahFavoritModel extends ChangeNotifier {
  late ListFavoriteModel _favoriteModel;

  final List<int> _itemIds = [];

  ListFavoriteModel get favoriteModel => _favoriteModel;


  set favoriteModel(ListFavoriteModel newList) {
    _favoriteModel = newList;
    notifyListeners();
  }

  List<ItemFavorite> get items => _itemIds.map((id) => _favoriteModel.getById(id)).toList();

  void add(ItemFavorite item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(ItemFavorite item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }

}