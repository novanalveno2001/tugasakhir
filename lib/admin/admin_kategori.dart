import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugasakhir/admin/Beranda_admin.dart';
import 'package:tugasakhir/admin/CRUD/edit_kategori.dart';
import 'package:tugasakhir/admin/CRUD/tambah_kategori.dart';
import 'package:tugasakhir/admin/detail_kategoriadmin.dart';
import 'package:tugasakhir/admin/drawer%20menu_admin.dart';
import 'package:tugasakhir/categories/agama.dart';
import 'package:tugasakhir/categories/bahasa.dart';
import 'package:tugasakhir/categories/biografi.dart';
import 'package:tugasakhir/categories/hiburan.dart';
import 'package:tugasakhir/categories/keluarga.dart';
import 'package:tugasakhir/categories/motivasi.dart';
import 'package:tugasakhir/categories/pendidikan.dart';
import 'package:tugasakhir/detail.dart';
import 'package:tugasakhir/menu_drawer.dart';
import 'package:tugasakhir/categories/sosial.dart';
import 'package:tugasakhir/mock%20api/akses%20API.dart';
import 'package:tugasakhir/mock%20api/data_kategori.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';
import 'package:http/http.dart' as http;

class KategoriPageAdmin extends StatefulWidget {
  const KategoriPageAdmin({Key? key}) : super(key: key);

  @override
  _KategoriPageAdminState createState() => _KategoriPageAdminState();
}

class _KategoriPageAdminState extends State<KategoriPageAdmin> {
  List<Kategori> listKategori = [];
  Repository repository = Repository();
  List<Kategori> listcategories = [];
  List<String> listTitleCategories = [
    'Social Sciences',
    'Motivation',
    'Parenting & Family',
    'Religion & Sprituality',
    'Education & Teaching',
    'Entertainment',
    'Biography',
    'Language',
    'Law',
    'Java Histories',
  ];

  String nKategori = 'Pilih Kategori';
  int? nilaiKategori;

  void pilihKategori(String value){
    setState(() {
      nKategori = value;
    });
  }

  getData() async {
    listKategori = await repository.getDataKategori();
    setState(() {});
  }

  Future<List<Kategori>> fetchBooks() async {
    var url = 'https://6369fddbc07d8f936d9001fc.mockapi.io';
    var response = await http.get(Uri.parse(url));

    // var books = List<Users>[];
    List<Kategori> categories = [];

    if (response.statusCode == 200) {
      var booksJson = json.decode(response.body);
      for (var bookJson in booksJson) {
        categories.add(Kategori.fromJson(bookJson));
      }
    }
    return categories;
  }

  @override
  void initState() {
    fetchBooks().then((value) {
      setState(() {
        listKategori.addAll(value);
        listcategories = listKategori;
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
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
              )),
          backgroundColor: Colors.red[900],
          title: Text(
            'Kategori Admin',
            style: GoogleFonts.allerta(),
          ),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: listKategori.length,
              itemBuilder: (context, index) {
                final category = listKategori[index];
                return ListTile(
                  leading: TextButton(
                      onPressed: (){
                        DropdownButton(
                          value: nKategori,
                            items: listTitleCategories.map((String value) {
                              return DropdownMenuItem(
                                  child: Text(value),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (String? value) {
                            pilihKategori(value??'');
                            nilaiKategori = listTitleCategories.indexOf(value??"");
                            }
                        );
                      }, 
                      child: Text('Detail', style: TextStyle(fontSize: 8, color: Colors.indigo, fontStyle: FontStyle.italic),)
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return DetailKategori();
                    }));
                  },
                  title: ListKategori(
                      gambar: category.gambar, kategori: category.kategori),
                  subtitle: Text(
                    category.subkategori,
                    style: GoogleFonts.cambo(),
                  ),
                  trailing: Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return EditKategori(categories: category);
                              }));
                            },
                            child:
                                Icon(Icons.edit, color: Colors.green.shade900),
                          ),
                          FlatButton(
                            onPressed: () async {
                              bool response =
                                  await repository.deleteKategori(category.id);

                              if (response) {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return KategoriPageAdmin();
                                }));
                              } else {
                                throw Exception('Gagal menghapus kategori');
                              }
                            },
                            child: Icon(Icons.delete_outline_outlined,
                                color: Colors.red.shade900),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TambahKategori();
                }));
              },
              tooltip: 'Tambah Kategori',
              child: Icon(Icons.add),
              backgroundColor: Colors.red.shade900,
              splashColor: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}

// class KategoriPageAdmin extends StatelessWidget {
//   static const String routeName = '/kategori';
//
//   List<Kategori> listKategori = [];
//   Repository repository = Repository();
//
//
//
//   getData() async {
//     listKategori = await repository.getDataAdmin();
//   }
//
//   @override
//   void initState() {
//     getData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red[900],
//         title: Image.asset('assets/sosmed/diva_press.png', width: 200.0, height: 100.0, alignment: Alignment.centerRight),
//       ),
//       drawer: MenuDrawer(),
//       body: ListView(
//         children: <Widget>[
//           ListTile(
//             title: ListKategori(
//                 gambar: 'assets/buku1.jpg',
//                 kategori: ' Social Sciences'),
//             subtitle:Text('Ilmu Sosial', style: GoogleFonts.chakraPetch()) ,
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context){
//                 return Sosial();
//               }));
//             },
//             trailing: Expanded(
//               flex: 3,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget> [
//                     FlatButton(
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context){
//                           return EditKategori();
//                         }));
//
//                       },
//                       child: Icon(Icons.edit, color: Colors.green.shade900),
//                     ),
//                     FlatButton(
//                       onPressed: () {
//
//                       },
//                       child: Icon(Icons.delete_outline_outlined, color: Colors.red.shade900),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           ListTile(
//             title: ListKategori(
//                 gambar: 'assets/buku2.jpg',
//                 kategori: ' Motivation'),
//             subtitle:Text('Motivasi', style: GoogleFonts.chakraPetch()) ,
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context){
//                 return Motivasi();
//               }));
//             },
//             trailing: Expanded(
//               flex: 3,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget> [
//                     FlatButton(
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context){
//                           return EditKategori();
//                         }));
//                       },
//                       child: Icon(Icons.edit, color: Colors.green.shade900),
//                     ),
//                     FlatButton(
//                       onPressed: () {
//
//                       },
//                       child: Icon(Icons.delete_outline_outlined, color: Colors.red.shade900),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//
//           ),
//           ListTile(
//             title: ListKategori(
//                 gambar: 'assets/buku3.jpg',
//                 kategori: ' Parenting Family'),
//             subtitle:Text('Kekeluargaan', style: GoogleFonts.chakraPetch()) ,
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context){
//                 return Keluarga();
//               }));
//
//             },
//             trailing: Expanded(
//               flex: 3,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget> [
//                     FlatButton(
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context){
//                           return EditKategori();
//                         }));
//                       },
//                       child: Icon(Icons.edit, color: Colors.green.shade900),
//                     ),
//                     FlatButton(
//                       onPressed: () {
//
//                       },
//                       child: Icon(Icons.delete_outline_outlined, color: Colors.red.shade900),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//
//           ),
//           ListTile(
//             title: ListKategori(
//                 gambar: 'assets/buku4.jpg',
//                 kategori: ' Religion & Sprituality'),
//             subtitle:Text('Keagamaan', style: GoogleFonts.chakraPetch()) ,
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context){
//                 return Agama();
//               }));
//             },
//             trailing: Expanded(
//               flex: 3,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget> [
//                     FlatButton(
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context){
//                           return EditKategori();
//                         }));
//
//                       },
//                       child: Icon(Icons.edit, color: Colors.green.shade900),
//                     ),
//                     FlatButton(
//                       onPressed: () {
//
//                       },
//                       child: Icon(Icons.delete_outline_outlined, color: Colors.red.shade900),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//
//           ),
//           ListTile(
//             title: ListKategori(
//                 gambar: 'assets/buku5.jpg',
//                 kategori: ' Education & Teaching'),
//             subtitle:Text('Pendidikan', style: GoogleFonts.chakraPetch()) ,
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context){
//                 return Pendidikan();
//               }));
//             },
//             trailing: Expanded(
//               flex: 3,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget> [
//                     FlatButton(
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context){
//                           return EditKategori();
//                         }));
//
//                       },
//                       child: Icon(Icons.edit, color: Colors.green.shade900),
//                     ),
//                     FlatButton(
//                       onPressed: () {
//
//                       },
//                       child: Icon(Icons.delete_outline_outlined, color: Colors.red.shade900),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//
//           ),
//           ListTile(
//             title: ListKategori(
//                 gambar: 'assets/buku3.jpg',
//                 kategori: ' Entertainment'
//             ),
//             subtitle:Text('Hiburan', style: GoogleFonts.chakraPetch()) ,
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context){
//                 return Hiburan();
//               }));
//
//             },
//             trailing: Expanded(
//               flex: 3,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget> [
//                     FlatButton(
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context){
//                           return EditKategori();
//                         }));
//
//                       },
//                       child: Icon(Icons.edit, color: Colors.green.shade900),
//                     ),
//                     FlatButton(
//                       onPressed: () {
//
//                       },
//                       child: Icon(Icons.delete_outline_outlined, color: Colors.red.shade900),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//
//           ),
//           ListTile(
//             title: ListKategori(
//                 gambar: 'assets/buku5.jpg',
//                 kategori: 'Biografi'
//             ),
//             subtitle: Text('Biografi Tokoh', style: GoogleFonts.chakraPetch()),
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context){
//                 return Biografi();
//               }));
//             },
//             trailing: Expanded(
//               flex: 3,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget> [
//                     FlatButton(
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context){
//                           return EditKategori();
//                         }));
//
//                       },
//                       child: Icon(Icons.edit, color: Colors.green.shade900),
//                     ),
//                     FlatButton(
//                       onPressed: () {
//
//                       },
//                       child: Icon(Icons.delete_outline_outlined, color: Colors.red.shade900),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//
//           ),
//           ListTile(
//             title: ListKategori(
//                 gambar: 'assets/buku2.jpg',
//                 kategori: 'Bahasa'
//             ),
//             subtitle: Text('Bahasa', style: GoogleFonts.chakraPetch()),
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context){
//                 return Bahasa();
//               }));
//             },
//             trailing: Expanded(
//               flex: 3,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget> [
//                     FlatButton(
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context){
//                           return EditKategori();
//                         }));
//
//                       },
//                       child: Icon(Icons.edit, color: Colors.green.shade900),
//                     ),
//                     FlatButton(
//                       onPressed: () {
//
//                       },
//                       child: Icon(Icons.delete_outline_outlined, color: Colors.red.shade900),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//
//           ),
//           ListTile(
//             title: ListKategori(
//                 gambar: 'https://divapress-online.com/Files/cover_buku/978-602-407-288-9.jpg',
//                 kategori: 'Law'
//             ),
//             subtitle: Text('Hukum', style: GoogleFonts.chakraPetch()),
//             onTap: (){
//
//             },
//             trailing: Expanded(
//               flex: 3,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget> [
//                     FlatButton(
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context){
//                           return EditKategori();
//                         }));
//
//                       },
//                       child: Icon(Icons.edit, color: Colors.green.shade900),
//                     ),
//                     FlatButton(
//                       onPressed: () {
//
//                       },
//                       child: Icon(Icons.delete_outline_outlined, color: Colors.red.shade900),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//
//           ),
//         ],
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context){
//                 return TambahKategori();
//               }));
//             },
//             tooltip: 'Tambah Kategori',
//             child: Icon(Icons.add),
//             backgroundColor: Colors.red.shade900,
//             splashColor: Colors.amber,
//           ),
//         ],
//       ),
//     );
//   }
// }

class ListKategori extends StatelessWidget {
  ListKategori({required this.gambar, required this.kategori});

  final String gambar;
  final String kategori;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Center(
        child: new Row(
          children: <Widget>[
            new Image(image: new NetworkImage(gambar), width: 85.0),
            SizedBox(width: 5),
            new Text(kategori,
                style: GoogleFonts.akshar(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    fontSize: 14))
          ],
        ),
      ),
    );
  }
}
