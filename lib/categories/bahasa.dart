import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tugasakhir/data_categories/databahasa.dart';
import 'package:tugasakhir/detail.dart';
import 'package:tugasakhir/menu_drawer.dart';
import 'package:tugasakhir/mock%20api/akses%20API.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';

class Bahasa extends StatefulWidget {
  const Bahasa({Key? key}) : super(key: key);

  @override
  _BahasaState createState() => _BahasaState();
}

class _BahasaState extends State<Bahasa> {
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
    createTile(Users bahasa) => Hero(
          tag: bahasa.title,
          child: Material(
            elevation: 16.0,
            shadowColor: Colors.purple.shade900,
            child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Detail(bahasa);
                  }));
                },
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image(
                            image: NetworkImage(bahasa.image),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Text(
                            bahasa.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11.0,
                                color: Colors.indigo),
                          ),
                        ),
                        Container(
                          child: Text(
                            bahasa.writer,
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
                              child: Text(bahasa.price,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red.shade900)),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )),
          ),
        );

    ///create book grid tiles
    final grid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(30.0),
          sliver: SliverGrid.count(
            childAspectRatio: 2 / 3,
            crossAxisCount: 2,
            mainAxisSpacing: 30.0,
            crossAxisSpacing: 30.0,
            children: listUsers.map((bahasa) => createTile(bahasa)).toList(),
          ),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text('Kategori Bahasa'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
              )),
        ],
      ),
      drawer: MenuDrawer(),
      body: grid,
    );
  }
}
