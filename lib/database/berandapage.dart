import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugasakhir/Keranjang/checkout/tambah_keranjang.dart';
import 'package:tugasakhir/admin/CRUD/tambah_kategori.dart';
import 'package:tugasakhir/database/aksesapi.dart';
import 'package:tugasakhir/database/data.dart';
import 'package:tugasakhir/detail.dart';
import 'package:tugasakhir/favorit/add_favorite.dart';
import 'package:tugasakhir/favorit/favorite_provider.dart';
import 'package:tugasakhir/menu_drawer.dart';
import 'package:tugasakhir/mock api/datadata.dart';
import 'package:tugasakhir/mock api/akses API.dart';
import 'package:tugasakhir/favorit/favorite_list_models.dart';
import 'package:tugasakhir/favorit/favorite_page_models.dart';
import 'package:tugasakhir/models/mysql.dart';
import 'package:tugasakhir/search_bar/search_api.dart';
import 'package:tugasakhir/search_bar/searchbar.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class BerandaPage extends StatefulWidget {
  static const String routeName = '/datascreen';

  BerandaPage({Key? key}) : super(key: key);

  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  List<Users> listUsers = [];
  Repository repository = Repository();
  Widget? searchTextField = Text("List Books");
  bool isDark = false;
  List<Bookstores> listBuku = [];
  Repositories repositories = Repositories();
  var db = new Mysql();



  void changeTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.red.shade900,
    accentColor: Colors.red.shade900,
  );

  ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red.shade900,
    accentColor: Colors.red.shade900,
  );

  getData() async {
    listBuku = await repositories.getData();
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

    final appBar = AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu_open_rounded),
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return MenuDrawer();
          }));
        },
      ),
      backgroundColor: Colors.red[900],
      title: Image.asset('assets/sosmed/diva_press.png',
          width: 200.0, height: 100.0, alignment: Alignment.centerRight),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search_outlined),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SearchPage();
            }));
          },
        ),
        IconButton(
            onPressed: changeTheme, icon: Icon(Icons.color_lens_outlined)),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            // Navigator.pushNamed(context, '/cart');
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TambahKeranjang();
            }));
          },
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TambahFavorit();
            }));
          },
          icon: Icon(Icons.favorite_border_sharp, color: Colors.white),
        ),
      ],
      // bottom: TabBar(
      //   controller: controller,
      //   tabs: <Widget>[
      //     Tab(icon: Icon(Icons.home_outlined)),
      //     Tab(text: 'Buku Terlaris'),
      //     Tab(text: 'Buku Terlaris'),
      //   ],
      //   unselectedLabelColor: Colors.white,
      //   labelColor: Colors.orange,
      //   indicatorColor: Colors.orange,
      // ),
    );

    createTile(Bookstores bookstores) => Hero(
          tag: bookstores.judul,
          child: Material(
            elevation: 15.0,
            shadowColor: Colors.purple.shade900,
            child: InkWell(
              onTap: () {
                // Navigator.pushNamed(context, 'detail/${users.title}');
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return Detail(users);
                // }));
              },
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Image(
                          image: NetworkImage(bookstores.gambar),
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Text(
                          bookstores.judul,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11.0,
                              color: Colors.indigo),
                        ),
                      ),
                      Container(
                        child: Text(
                          bookstores.penulis,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                              fontSize: 10.0),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              bookstores.harga,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[900]),
                            ),
                          ),
                          SizedBox(width: 20),
                          // IconButton(
                          //     onPressed: (){
                          //       provider.toggleFavorite(users);
                          //       // _AddButton(item: item);
                          //     },
                          //     icon: provider.isExist(users)
                          //         ? Icon(Icons.favorite_rounded, color: Colors.red)
                          //         : Icon(Icons.favorite_border_outlined, color: Colors.red,)
                          // ),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Text(users.rating,
                      //         style: TextStyle(
                      //             fontWeight: FontWeight.normal,
                      //             fontStyle: FontStyle.italic)),
                      //     Icon(Icons.star_half_outlined, color: Colors.amber, size: 12),
                      //   ],
                      // )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );

    final grid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverGrid.count(
            childAspectRatio: 2 / 3,
            crossAxisCount: 3,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            children: listBuku.map((bookstores) => createTile(bookstores)).toList(),
          ),
        ),
      ],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? dark : light,
      home: Scaffold(
        appBar: appBar,
        body: grid,
      ),
      // backgroundColor: Colors.white,
      // appBar: appBar,
      // body: grid,
    );
  }
}

class _AddButton extends StatelessWidget {
  final ItemFavorite item;

  const _AddButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInFavoritePage = context.select<TambahFavoritModel, bool>(
      (favoritepage) => favoritepage.items.contains(item),
    );

    return IconButton(
      icon: isInFavoritePage
          ? Icon(Icons.favorite, color: Colors.red)
          : Icon(Icons.favorite_border_rounded),
      onPressed: isInFavoritePage
          ? () {
              var favoritepage = context.read<TambahFavoritModel>();
              favoritepage.remove(item);
            }
          : () {
              var favoritepage = context.read<TambahFavoritModel>();
              favoritepage.add(item);
            },
    );
  }
}
