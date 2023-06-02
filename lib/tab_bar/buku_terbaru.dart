import 'package:flutter/material.dart';
import 'package:tugasakhir/databuku/terbaru.dart';
import 'package:tugasakhir/detail.dart';
import 'package:tugasakhir/menu_drawer.dart';
import 'package:tugasakhir/mock%20api/akses%20API.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';



class BukuTerbaru extends StatefulWidget {
  static const String routeName = '/buku_terbaru';

  @override
  _BukuTerbaruState createState() => _BukuTerbaruState();
}

class _BukuTerbaruState extends State<BukuTerbaru> {
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

    // createTile(Users users) => Hero
    //   (
    //   tag: users.title,
    //   child: Material(
    //     elevation: 10.0,
    //     shadowColor: Colors.purple.shade900,
    //     child: InkWell(
    //       onTap: () {
    //         Navigator.pushNamed(context, 'detail/${users.title}');
    //       },
    //       child: Image(
    //         image: AssetImage(users.image),
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //   )
    //   ,
    // );
    //
    // ///create book grid tiles
    // final grid = CustomScrollView(
    //   primary: false,
    //   slivers: <Widget>[
    //     SliverPadding(
    //       padding: EdgeInsets.all(16.0),
    //       sliver: SliverGrid.count(
    //         childAspectRatio: 2 / 3,
    //         crossAxisCount: 3,
    //         mainAxisSpacing: 20.0,
    //         crossAxisSpacing: 20.0,
    //         children: listUsers.map((users) => createTile(users)).toList(),
    //       ),
    //     )
    //   ],
    // );

    createTile(Users users) => Hero(
      tag: users.title,
      child: Material(
        elevation: 15.0,
        shadowColor: Colors.purple.shade900,
        child: InkWell(
          onTap: () {
            // Navigator.pushNamed(context, 'detail/${users.title}');
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Detail(users);
            }));

          },
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image(
                      image: NetworkImage(users.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text(
                      users.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11.0,
                          color: Colors.indigo),
                    ),
                  ),
                  Container(
                    child: Text(
                      users.writer,
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
                          users.price,
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
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            children: listUsers.map((users) => createTile(users)).toList(),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text('Kategori Daftar Buku Terbaru'),
      ),
      drawer: MenuDrawer(),
      body: grid,
    );
  }
}

