import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Testapi extends StatefulWidget {
  const Testapi({Key? key}) : super(key: key);

  @override
  _TestapiState createState() => _TestapiState();
}

class _TestapiState extends State<Testapi> {
  List _listdata = [];

  Future<List> getData() async {
    final response = await http.get(Uri.parse(
        'http://localhost/adminpagelaravel/connectflutter/getdata.php'));
    return json.decode(response.body);
  }

  Future _getdata() async {
    try {
      final response = await http.get(Uri.parse(
          'http://localhost/adminpagelaravel/connectflutter/getdata.php'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _listdata = data;
        });
      }
    } catch (e) {
      print(e);
    }
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
          title: Text('Test API'),
        ),
        body: new FutureBuilder<List>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? ItemList(list: [snapshot.data],)
                  : new Center(
                      child: new CircularProgressIndicator(),
                    );
            }));
    // body: ListView.builder(
    //     itemCount: _listdata.length,
    //     itemBuilder: ((context, index) {
    //       return Card(
    //         child: ListTile(
    //           title: Text(_listdata[index]['judul']),
    //           subtitle: Text(_listdata[index]['penulis']),
    //         ),
    //       );
    //     })));
  }
}

class ItemList extends StatelessWidget {

  final List list;
  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:list==null ? 0 : list.length ,
        itemBuilder: (context, index){
        return Text(list[index]['judul']);
        }
    );
  }
}

