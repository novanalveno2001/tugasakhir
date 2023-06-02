// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
// import 'package:tugasakhir/mock api/datadata.dart';
//
// class TambahKeranjang extends ChangeNotifier {
//   late Users users;
//
//
//   final List<String> _itemIds = [];
//
//   Users get catalog => users;
//
//   set catalog(Users newCatalog) {
//     users = newCatalog;
//     notifyListeners();
//   }
//
//
//   // List<Users> get items => _itemIds.map((id) => _catalog.getById(id)).toList();
//   //
//   // int get totalPrice =>
//   //     items.fold(0, (total, current) => total + current.price);
//
//   void add(Users users) {
//     _itemIds.add(users.id.toString());
//     notifyListeners();
//   }
//
//   void remove(Users users) {
//     _itemIds.remove(users.id);
//     notifyListeners();
//   }
//
// }


import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tugasakhir/detail.dart';
import 'package:tugasakhir/favorit/favorite_provider.dart';

class TambahKeranjang extends StatelessWidget {
  const TambahKeranjang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final wishlist = provider.wishlists;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text('Tambah Keranjang', style: GoogleFonts.allerta()),
      ),
      body: ListView.builder(
          itemCount: wishlist.length,
          itemBuilder: (context, index) {
            final fav = wishlist[index];
            return ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Detail(fav);
                }));
              },
              title: Row(
                children:<Widget> [
                  Container(
                    height: 60,
                    width: 60,
                    child: Center(
                      child: Image.network(fav.image),
                    ),
                  ),
                  SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(fav.title, style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.indigo)),
                      ),
                      SizedBox(height: 5),
                      Container(
                        child: Text(fav.price, style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold, fontSize: 12, color: Colors.red.shade900)),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: IconButton(
                onPressed: (){
                  provider.toggleFavorite(fav);
                },
                icon: provider.isExist(fav)
                    ? const Icon(Icons.remove_shopping_cart, color: Colors.red)
                    : const Icon(Icons.shopping_cart_outlined),
              ),
            );
          }),
    );
  }
}
