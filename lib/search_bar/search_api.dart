import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugasakhir/detail.dart';
import 'package:tugasakhir/mock%20api/akses%20API.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';
import 'package:http/http.dart' as http;


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Users> listUsers = [];
  Repository repository = Repository();
  List<Users> listSearch = [];
  List<Users> booksForDisplay = [];
  TextEditingController _controllerSearch = TextEditingController();
  Widget? searchTextField = Text("Pencarian Buku", style: GoogleFonts.allerta(),);
  bool search = false;


  Future<List<Users>> fetchBooks() async {
    var url = 'https://62eb2c95ad2954632599c1bf.mockapi.io';
    var response = await http.get(Uri.parse(url));
    
    // var books = List<Users>[];
    List<Users> books = [];
    
    if (response.statusCode == 200) {
      var booksJson = json.decode(response.body);
      for (var bookJson in booksJson) {
        books.add(Users.fromJson(bookJson));
      }
    }
    return books;
  }

  TextEditingController _controller = new TextEditingController();


  getData() async {
    listUsers = await repository.getData();
    setState(() {});
  }

  // getUsers() async {
  //   _allUsers = await repository.getData();
  //   setState(() {});
  // }
  //
  // List<Map<Users, dynamic>> _allUsers = [];
  //
  // List<Map<Users, dynamic>> _foundUsers = [];



  @override
  void initState() {
    fetchBooks().then((value) {
      setState(() {
        listUsers.addAll(value);
        booksForDisplay = listUsers;
      });
    });
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade900,
          title: searchTextField,
          // actions: <Widget> [
          //   (search == false)
          //       ? IconButton(
          //       icon: Icon(Icons.search),
          //       onPressed: () {
          //         setState(() {
          //           searchTextField =_searchBar();
          //           search = true;
          //         });
          //       })
          //       : IconButton(
          //       icon: Icon(
          //         Icons.close,
          //         color: Colors.white60,
          //       ),
          //       onPressed: () {
          //         setState(() {
          //           listUsers.clear();
          //           listUsers.addAll(listUsers);
          //           _controllerSearch.clear();
          //         });
          //       })
          //
          // ],
        ),
        body: Container(
          child: ListView.builder(
            itemCount: booksForDisplay.length+1,
              itemBuilder: (context, index) {
              return index == 0 ? _searchBar() : _listItem(index-1);
            final cari = listUsers[index];
            return Card(
              key: ValueKey(listUsers[index]),
              child: ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Detail(cari);
                  }));
                },
                title: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: Center(
                        child: Image.network(cari.image),
                      ),
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(cari.title,
                              style: GoogleFonts.allerta(
                                  fontWeight: FontWeight.bold, fontSize: 12)),
                        ),
                        Container(
                          child: Text(cari.writer,
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 10)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  _listItem(index) {
    final cari = booksForDisplay[index];
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return Detail(cari);
          }));
        },
        title: Row(
          children: <Widget>[
            Container(
              height: 60,
              width: 60,
              child: Center(
                child: Image.network(cari.image),
              ),
            ),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(cari.title,
                      style: GoogleFonts.allerta(
                          fontWeight: FontWeight.bold, fontSize: 12)),
                ),
                Container(
                  child: Text(cari.writer,
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 10)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _searchBar() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: Colors.red.shade900,
        child: ListTile(
          leading: Icon(Icons.search_rounded),
          title: TextField(
            controller: _controller,
            decoration: InputDecoration(
                hintText: 'Cari Buku...',
                border: InputBorder.none,
            ),
            onChanged: (text){
        text = text.toLowerCase();
        setState(() {
          booksForDisplay = listUsers.where((search){
            var cariBuku = search.title.toLowerCase();
            return cariBuku.contains(text);
          }).toList();
        });
      },
          ),
          trailing: IconButton(
            onPressed: (){
              _controller.clear();
              // onSearch('');
            },
            icon: Icon(Icons.cancel_outlined),
          ),
        ),
      ),
      // child: TextField(
      //   decoration: InputDecoration(
      //     hintText: 'Cari buku...',
      //   ),
      //   onChanged: (text){
      //     text = text.toLowerCase();
      //     setState(() {
      //       booksForDisplay = listUsers.where((search){
      //         var cariBuku = search.title.toLowerCase();
      //         return cariBuku.contains(text);
      //       }).toList();
      //     });
      //   },
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
                  _controllerSearch.clear();
                  listUsers.clear();
                });
              }),
          hintText: "Cari Buku...",
          hintStyle: TextStyle(color: Colors.white60)),
      // setiap ada perubahan, jalankan fungsi _searchName
      onChanged: (text) {
        text = text.toLowerCase();
        setState(() {

        });
        // _searchName(name);
        // onSearch(text);
      },
    );
  }

  _searchName(String name) {
    if (name.isNotEmpty) {
      setState(() {
        listUsers.clear();
        listUsers.forEach((item) {
          // if (item.title.contains(name.toLowerCase())) {
          //   listUsers.add(item);
          // }
          if (item.title.contains(name)){
            listSearch.add(item);
          } else {
            setState(() {
              listUsers.clear();
            });

          }
        });
      });
    } else {
      setState(() {
        listUsers.clear();
        listUsers.addAll(listUsers);
      });
    }
  }

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

}
