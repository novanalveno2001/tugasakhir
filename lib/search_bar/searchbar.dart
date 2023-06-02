import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugasakhir/data.dart';
import 'package:tugasakhir/mock%20api/akses%20API.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';
import 'package:tugasakhir/search_bar/datasearch.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late final Book book;
  late DataSearch cari;
  late Users users;

  final String _baseUrl = 'https://62eb2c95ad2954632599c1bf.mockapi.io/users';


  List<Users> listUsers = [];
  List<Users> listSearch =[];
  Repository repository = Repository();
  var loading = false;

  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    listUsers.clear();
    final response = await http.get(Uri.parse(_baseUrl));
    if (response == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map<String, dynamic> i in data) {
          listUsers.add(Users.fromJson(i));
          loading = false;
        }
      });
    }
  }

  TextEditingController _controller = new TextEditingController();

  onSearch(String text) async {
    if(text.isEmpty) {
      setState(() {
        listSearch.clear();
        listUsers.forEach((f) {
          if (f.title.contains(text) || f.id.toString().contains(text)) listSearch.add(f);
        });
      });

    } else {
      setState(() {
        listUsers.clear();
      });
    }
  }

  getData() async {
    listUsers = await repository.getData();
    setState(() {});
  }

  TextEditingController _controllerSearch = TextEditingController();

  Widget? searchTextField = Text("List Buku");

  bool search = false;
  Color _bgColor = Colors.red.shade900;
  List list = [];



  
  @override
  void initState() {
    fetchData();
    super.initState();
    // list.addAll(items);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _bgColor,
        title: searchTextField,
        actions: <Widget> [
          (search == false)
          ? IconButton(
              icon: Icon(Icons.search),
            onPressed: () {
                setState(() {
                  searchTextField =appSearch(context);
                  _bgColor = Colors.red.shade900;
                  search = true;
                });
            })
              : IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white60,
              ),
              onPressed: () {
                setState(() {
                  list.clear();
                  list.addAll(items);
                  _controllerSearch.clear();
                });
              })

        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.red.shade900,
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.search_rounded),
                  title: TextField(
                    controller: _controller,
                    onChanged: onSearch,
                    decoration: InputDecoration(
                        hintText: 'Cari Buku', border: InputBorder.none
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: (){
                        _controller.clear();
                        onSearch('');
                      },
                      icon: Icon(Icons.cancel_outlined),
                  ),
                ),
              ),
            ),
            loading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : Expanded(
              child: listSearch.length != 0 || _controller.text.isNotEmpty
                  ? ListView.builder(
                itemCount: listSearch.length,
                  itemBuilder: (context, i){
                  final pencarian = listSearch[i];
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(pencarian.title, style: GoogleFonts.allerta(fontWeight: FontWeight.bold, fontSize: 18),),
                        SizedBox(height: 5),
                        Text(pencarian.writer),
                      ],
                    ),
                  );

                  },
              )
                  : ListView.builder(
                  itemCount: listUsers.length,
                  itemBuilder: (context, i) {
                    final cari = listUsers[i];
                    return Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(cari.title, style: GoogleFonts.allerta(fontWeight: FontWeight.bold, fontSize: 18),),
                          SizedBox(height: 5),
                          Text(cari.writer),
                        ],
                      ),
                    );
                  }
              )
            )


          ],
        ),

      ),
      // body: ListView.builder(
      //   itemCount: list.length,
      //     itemBuilder: (context, int index) {
      //     final cari = list[index];
      //     return ListTile(
      //       minLeadingWidth: 5,
      //       contentPadding: EdgeInsets.all(10.0),
      //       title: ListSearch(
      //           gambar: cari.gambar,
      //           judul: cari.judul,
      //       ),
      //       // Text(
      //       //   list[index],
      //       //   style: TextStyle(fontSize: 18),
      //       // ),
      //       onTap: (){
      //         Navigator.pushNamed(context, 'detail/${book.title}');
      //       },
      //     );
      //     },
      // ),

    );
  }

  Widget appSearch(BuildContext context) {
    return TextField(
      controller: _controllerSearch,
      style: TextStyle(color: Colors.white, fontSize: 18),
      decoration: InputDecoration(
          icon: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  searchTextField = Text("List Buku");
                  search = false;
                  _bgColor = Colors.red.shade900;
                  _controllerSearch.clear();
                  list.clear();
                  list.addAll(items);
                });
              }),
          hintText: "Cari Buku...",
          hintStyle: TextStyle(color: Colors.white60)),
      // setiap ada perubahan, jalankan fungsi _searchName
      onChanged: (name) {
        _searchName(name);
      },
    );
  }

  _searchName(String name) {
    if (name.isNotEmpty) {
      setState(() {
        list.clear();
        items.forEach((item) {
          if (item.toLowerCase().contains(name.toLowerCase())) {
            list.add(item);
          }
        });
      });
    } else {
      setState(() {
        list.clear();
        list.addAll(items);
      });
    }
  }
  }


class ListSearch extends StatelessWidget {

  ListSearch({required this.gambar, required this.judul});

  final String gambar;
  final String judul;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Center(
        child: new Row(
          children: <Widget>[
            new Image(
                image: new NetworkImage(gambar),
                width: 60.0,
              height: 40.0,
            ),
            new Text(
              judul,
              style: new TextStyle(fontSize: 13.0),
            )
          ],
        ),
      ),
    );
  }
}



