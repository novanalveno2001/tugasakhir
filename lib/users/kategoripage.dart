import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugasakhir/admin/CRUD/edit_kategori.dart';
import 'package:tugasakhir/admin/CRUD/tambah_kategori.dart';
import 'package:tugasakhir/admin/api_service.dart';
import 'package:tugasakhir/admin/drawer%20menu_admin.dart';
import 'package:tugasakhir/categories/agama.dart';
import 'package:tugasakhir/categories/bahasa.dart';
import 'package:tugasakhir/categories/biografi.dart';
import 'package:tugasakhir/categories/hiburan.dart';
import 'package:tugasakhir/categories/keluarga.dart';
import 'package:tugasakhir/categories/motivasi.dart';
import 'package:tugasakhir/categories/pendidikan.dart';
import 'package:tugasakhir/menu_drawer.dart';
import 'package:tugasakhir/categories/sosial.dart';
import 'package:tugasakhir/mock%20api/akses%20API.dart';
import 'package:tugasakhir/mock%20api/data_kategori.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';

class KategoriPage extends StatelessWidget {
  static const String routeName = '/kategori';

  List<Kategori> listUsers = [];
  Repository repository = Repository();



  getData() async {
    listUsers = await repository.getDataKategori();

  }

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
          title: Image.asset('assets/sosmed/diva_press.png', width: 200.0, height: 100.0, alignment: Alignment.centerRight),
      ),
      drawer: MenuDrawer(),
      // body: Container(
      //   child: ListView.builder(
      //       itemCount: listUsers.length,
      //       itemBuilder: (context, index) {
      //         final category = listUsers[index];
      //         return ListTile(
      //           title: ListKategori(
      //               gambar: category.gambar,
      //               kategori: category.kategori
      //           ),
      //           trailing: Text(category.subkategori, style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),),
      //         );
      //       }
      //   ),
      // ),
      body: ListView(
        children: <Widget>[
          ListTile(
          title: ListKategori(
              gambar: 'assets/buku1.jpg',
              kategori: ' Social Sciences'),
            subtitle:Text('Ilmu Sosial', style: GoogleFonts.chakraPetch()) ,
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Sosial();
              }));
            },
      ),
          ListTile(
            title: ListKategori(
                gambar: 'assets/buku2.jpg',
                kategori: ' Motivation'),
            subtitle:Text('Motivasi', style: GoogleFonts.chakraPetch()) ,
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Motivasi();
              }));
            },

          ),
          ListTile(
            title: ListKategori(
                gambar: 'assets/buku3.jpg',
                kategori: ' Parenting Family'),
            subtitle:Text('Kekeluargaan', style: GoogleFonts.chakraPetch()) ,
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Keluarga();
              }));

            },

          ),
          ListTile(
            title: ListKategori(
                gambar: 'assets/buku4.jpg',
                kategori: ' Religion & Sprituality'),
            subtitle:Text('Keagamaan', style: GoogleFonts.chakraPetch()) ,
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Agama();
              }));
            },

          ),
          ListTile(
            title: ListKategori(
                gambar: 'assets/buku5.jpg',
                kategori: ' Education & Teaching'),
            subtitle:Text('Pendidikan', style: GoogleFonts.chakraPetch()) ,
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Pendidikan();
              }));
            },

          ),
          ListTile(
            title: ListKategori(
                gambar: 'assets/buku3.jpg',
                kategori: ' Entertainment'
            ),
            subtitle:Text('Hiburan', style: GoogleFonts.chakraPetch()) ,
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Hiburan();
              }));

            },

          ),
          ListTile(
            title: ListKategori(
                gambar: 'assets/buku5.jpg',
                kategori: 'Biografi'
            ),
            subtitle: Text('Biografi Tokoh', style: GoogleFonts.chakraPetch()),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Biografi();
              }));
            },

          ),
          ListTile(
            title: ListKategori(
                gambar: 'assets/buku2.jpg',
                kategori: 'Bahasa'
            ),
            subtitle: Text('Bahasa', style: GoogleFonts.chakraPetch()),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Bahasa();
              }));
            },

          ),
          ListTile(
            title: ListKategori(
                gambar: 'https://divapress-online.com/Files/cover_buku/978-602-407-288-9.jpg',
                kategori: 'Law'
            ),
            subtitle: Text('Hukum', style: GoogleFonts.chakraPetch()),
            onTap: (){

            },
          ),
        ],
      ),
    );
  }
}

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
            new Image(
                image: new NetworkImage(gambar),
                width: 100.0),
            new Text(
              kategori,
              style: GoogleFonts.akshar(fontWeight: FontWeight.w700, fontStyle: FontStyle.italic)
            )
          ],
        ),
      ),
    );
  }
}













