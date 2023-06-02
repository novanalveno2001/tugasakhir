import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir/menu_drawer.dart';
import 'package:tugasakhir/data.dart';
import 'package:tugasakhir/favorit/favorite_list_models.dart';
import 'package:tugasakhir/search_bar/searchbar.dart';

class Beranda extends StatefulWidget {
  static const String routeName = '/beranda';

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> with SingleTickerProviderStateMixin {
  late Book book;
  TextEditingController textController = TextEditingController();
  Widget? searchTextField = Text("List Books");
  late TabController controller;
  int currentIndex = 0;
  List list = [];
  Item? item;
  bool isDark = false;

  void changeTheme(){
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


  @override
  void initState() {
    controller = TabController(
      vsync: this,
      length: 3,
    );
    list.addAll(books);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


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
              return Search();
            }));
          },
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
        ),
        IconButton(
            onPressed: changeTheme,
            icon: Icon(Icons.color_lens_outlined)
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
                      SizedBox(height: 10),
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
                      SizedBox(height: 12),
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


