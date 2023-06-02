import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tugasakhir/detail.dart';
import 'package:tugasakhir/favorit/favorite_provider.dart';

class TambahFavorit extends StatelessWidget {
  const TambahFavorit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final wishlist = provider.wishlists;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text('Tambah Favorit', style: GoogleFonts.allerta()),
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
                    ? const Icon(Icons.favorite, color: Colors.red)
                    : const Icon(Icons.favorite_border_sharp),
              ),
            );
          }),
      );
  }
}
