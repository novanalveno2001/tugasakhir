import 'package:tugasakhir/data.dart';
import 'package:tugasakhir/favorit/favorite_list_models.dart';
import 'package:tugasakhir/favorit/favorite_page_models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugasakhir/favorit/favorite_page.dart';
import 'package:tugasakhir/users/beranda.dart';

class FavoritPage extends StatelessWidget {
  static const String routeName = '/favorit';

  @override
  Widget build(BuildContext context) {
    createTile(Book book) => Hero(
      tag: book.title,
      child: Material(
        elevation: 15.0,
        shadowColor: Colors.purple.shade900,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'detail/${book.title}');
          },
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image(
                      image: AssetImage(book.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    child: Text(
                      book.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0,
                          color: Colors.indigo),
                    ),
                  ),
                  Container(
                    child: Text(
                      book.writer,
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
                          book.price,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[900]),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          onPressed: (){
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (context){
                                      return FavoritePage();
                                    }));
                          },
                          icon: Icon(Icons.favorite_border_outlined),
                        ),
                        alignment: Alignment.bottomRight,
                      ),
                    ],

                  ),

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
            children: books.map((book) => createTile(book)).toList(),
          ),
        )
      ],
    );

    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: <Widget> [
          SliverAppBar(
            floating: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border_rounded),
                onPressed: () => Navigator.pushNamed(context, '/favoritepage'),
              ),
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.all(16.0),
            sliver: SliverGrid.count(
              childAspectRatio: 2 / 3,
              crossAxisCount: 3,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              children: books.map((book) => createTile(book)).toList(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return _MyListItem(index);
            }, childCount: 3),
          ),

        ],
      ),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<FavoriteListModel, Item>(
      (favoritelist) => favoritelist.getByPosition(index),
    );
    var textTheme = Theme.of(context).textTheme.headline6;

    createTile(Book book) => Hero(
      tag: book.title,
      child: Material(
        elevation: 15.0,
        shadowColor: Colors.purple.shade900,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'detail/${book.title}');
          },
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image(
                      image: AssetImage(book.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    child: Text(
                      book.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0,
                          color: Colors.indigo),
                    ),
                  ),
                  Container(
                    child: Text(
                      book.writer,
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
                          book.price,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[900]),
                        ),
                      ),
                      Container(
                        child: Text(" "),
                      ),
                      Container(
                        child: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.favorite_border_outlined),
                        ),
                        color: Colors.red.shade900,
                        alignment: Alignment.bottomRight,
                      ),
                    ],

                  ),

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
            children: books.map((book) => createTile(book)).toList(),
          ),
        ),
        _AddButton(item: item),
      ],
    );

    return Scaffold(
      appBar: AppBar(

      ),
      body: grid,
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInFavoritePage = context.select<FavoritePageModel, bool>(
      (favoritepage) => favoritepage.items.contains(item),
    );

    return IconButton(
      icon: isInFavoritePage
          ? Icon(Icons.favorite, color: Colors.red.shade900)
          : Icon(Icons.favorite_border_rounded),
      onPressed: isInFavoritePage
          ? () {
              var favoritepage = context.read<FavoritePageModel>();
              favoritepage.remove(item);
            }
          : () {
              var favoritepage = context.read<FavoritePageModel>();
              favoritepage.add(item);
            },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:tugasakhir/data.dart';
// import 'package:tugasakhir/models/favorite_place.dart';
// import 'package:tugasakhir/provider/done_favorite_provider.dart';
// import 'package:provider/provider.dart';
//
//
// class FavoritPage extends StatelessWidget{
//   static const String routeName = '/favorit';
//   const FavoritPage({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context){
//     final List<Book> doneFavoritePlaceList =
//         Provider.of<DoneFavoriteProvider>(
//           context,
//           listen: false,
//
//         ).doneFavoritePlaceList;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Daftar Buku Favorit'),
//       ),
//       body: ListView.builder(
//         itemBuilder: (context, index) {
//           final Book book = doneFavoritePlaceList[index];
//           return Card(
//             color: Colors.white60,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Expanded(
//                   flex: 1,
//                   child: Image.asset(book.image),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget> [
//                         Text(
//                           book.title,
//                           style: const TextStyle(fontSize: 16.0),
//
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Text(book.price),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 const Icon(Icons.done_outline),
//               ],
//             ),
//           );
//         },
//         itemCount: doneFavoritePlaceList.length,
//       ),
//     );
//
//   }
// }
//
