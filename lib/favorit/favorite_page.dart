import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugasakhir/data.dart';
import 'package:tugasakhir/detail.dart';
import 'package:tugasakhir/favorit/add_favorite.dart';
import 'package:tugasakhir/favorit/favorite_list_models.dart';
import 'package:tugasakhir/favorit/favorite_page_models.dart';
import 'package:provider/provider.dart';
import 'package:tugasakhir/favorit/favorite_provider.dart';
import 'package:tugasakhir/mock%20api/akses%20API.dart';
import 'package:tugasakhir/mock%20api/data_screen.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';



class FavoritePages extends StatefulWidget {
  const FavoritePages({Key? key}) : super(key: key);

  @override
  _FavoritePagesState createState() => _FavoritePagesState();
}

class _FavoritePagesState extends State<FavoritePages> {
  List<Users> listUsers = [];
  Repository repository = Repository();

  getData() async {
    listUsers = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return DataScreen();
              }));
            },
            icon: Icon(Icons.arrow_back_outlined)
        ),
        backgroundColor: Colors.red.shade900,
        title: Text('Favorite Pages', style: GoogleFonts.allerta(),),
        actions: <Widget>[
          IconButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return TambahFavorit();
                }));
              },
              icon: Icon(Icons.favorite_border_outlined,color: Colors.white)
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listUsers.length,
          itemBuilder: (context, index) {
            final wishlist = listUsers[index];
            return ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Detail(wishlist);
                }));
              },
              title: Row(
                children:<Widget> [
                  Container(
                    height: 60,
                    width: 60,
                    child: Center(
                      child: Image.network(wishlist.image),
                    ),
                  ),
                  SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(wishlist.title, style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                      Container(
                        child: Text(wishlist.price, style: TextStyle(fontStyle: FontStyle.normal, fontSize: 10, color: Colors.red.shade900)),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: IconButton(
                  onPressed: (){
                    provider.toggleFavorite(wishlist);
                  },
                  icon: provider.isExist(wishlist)
                      ? const Icon(Icons.favorite, color: Colors.red)
                      : const Icon(Icons.favorite_border_sharp),
              ),
            );
          }),
      );
  }
}



class FavoritePage extends StatelessWidget {
  static const String routeName = '/favoritepage';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text(
          'Favorite Page',
          style: GoogleFonts.acme()
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: _FavoritePageList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoritePageList extends StatelessWidget {
  late Book book;

  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;
    var favoritepage = context.watch<FavoritePageModel>();

    return ListView.builder(
      itemCount: favoritepage.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Image.asset(favoritepage.items[index].image),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            favoritepage.remove(favoritepage.items[index]);
          },
        ),
        onTap: () {
          Navigator.pushNamed(context, 'detail/${book.title}');
        },
        title: Text(
          favoritepage.items[index].name,
          style: GoogleFonts.abel(fontSize: 20,fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          favoritepage.items[index].subtitle,
          style: GoogleFonts.dosis()
        ),
      ),
    );
  }
}
