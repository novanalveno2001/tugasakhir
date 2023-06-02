import 'package:flutter/material.dart';
import 'package:tugasakhir/detail.dart';
import 'package:tugasakhir/menu_drawer.dart';
import 'package:tugasakhir/data_categories/datamotivasi.dart';
import 'package:tugasakhir/mock%20api/akses%20API.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';

class Motivasi extends StatefulWidget {
  const Motivasi({Key? key}) : super(key: key);

  @override
  _MotivasiState createState() => _MotivasiState();
}

class _MotivasiState extends State<Motivasi> {
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

    createTile(Users motivasi) => Hero(
          tag: motivasi.title,
          child: Material(
            elevation: 15.0,
            shadowColor: Colors.purple.shade900,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Detail(motivasi);
                }));
              },
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: Image(image: NetworkImage(motivasi.image))),
                      SizedBox(height: 10),
                      Container(
                        child: Text(
                          motivasi.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11.0,
                              color: Colors.indigo),
                        ),
                      ),
                      Container(
                        child: Text(
                          motivasi.writer,
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
                              motivasi.price,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[900]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ),
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
            children:
                listUsers.map((motivasi) => createTile(motivasi)).toList(),
          ),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text('Kategori Motivasi'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white,)
          ),
        ],
      ),
      drawer: MenuDrawer(),
      body: grid,
    );
  }
}
