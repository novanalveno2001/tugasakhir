import 'package:google_fonts/google_fonts.dart';
import 'package:tugasakhir/mock%20api/akses%20API.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';
import 'package:tugasakhir/favorit/favorite_list_models.dart';
import 'package:tugasakhir/favorit/favorite_page_models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugasakhir/data.dart';


class FavoriteList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.red.shade900,
            title:
            Text('Favorite', style: GoogleFonts.acme()),
            floating: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border_rounded),
                onPressed: () => Navigator.pushNamed(context, '/favoritepage'),
              ),
            ],
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return _MyListItem(index);
            },
                childCount: FavoriteListModel.itemNames.length),
          ),
        ],
      ),
    );
  }
}


class ListFavoriteBook extends StatefulWidget {
  ListFavoriteBook({Key? key}) : super(key: key);


  @override
  _ListFavoriteBookState createState() => _ListFavoriteBookState();
}

class _ListFavoriteBookState extends State<ListFavoriteBook> {

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text('Halaman Favorit'),
      ),
      body: ListView.builder(
        itemCount: listUsers.length,
          itemBuilder: (context, index) {
          final users = listUsers[index];
          return InkWell(
            onTap: () {},
            child: ListTile(
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: NetworkImage(users.image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              title: Text(users.title, style: GoogleFonts.abel(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text(users.writer, style: GoogleFonts.dosis()),
            ),
          );

      })
    );
  }
}


class _MyListItem extends StatelessWidget {
  final int index;

  _MyListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<FavoriteListModel, Item>(
          (favoritelist) => favoritelist.getByPosition(index),
    );


    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 60,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(item.image),
            ),
            const SizedBox(width: 24),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name, style: GoogleFonts.abel(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(item.subtitle,style: GoogleFonts.dosis()),
                  ],
                )
            ),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }

}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInFavoritePage = context.select<FavoritePageModel, bool>(
          (favoritepage) => favoritepage.items.contains(item),
    );

    return IconButton(
      icon: isInFavoritePage
          ? Icon(Icons.favorite, color: Colors.red)
          : Icon(Icons.favorite_border_rounded),
      onPressed: isInFavoritePage
          ? () {
        var favoritepage = context.read<FavoritePageModel>();
        favoritepage.remove(item);
      }
          :  () {
        var favoritepage = context.read<FavoritePageModel>();
        favoritepage.add(item);
      },
    );
  }
}


