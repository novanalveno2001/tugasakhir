import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugasakhir/login/loginpage.dart';
import 'package:tugasakhir/mock%20api/data_screen.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';
import 'package:tugasakhir/favorit/favorite_list.dart';
import 'package:tugasakhir/users/akunpage.dart';
import 'package:tugasakhir/users/beranda.dart';
import 'package:tugasakhir/users/favoritepage.dart';
import 'package:tugasakhir/users/kategoripage.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir/favorit/favorite_page.dart';
import 'package:tugasakhir/register/registerpage.dart';

class Home extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {


  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      // Beranda(),
      DataScreen(),
      KategoriPage(),
      // FavoriteList(),
      FavoritePages(),
      AkunPage()

    ];


    return Scaffold(
      body: widgets[currentIndex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.red.shade900,
        items: [
          TabItem(
            icon: Icons.home,
            title: 'Beranda',
          ),
          TabItem(icon: Icons.category_outlined, title: 'Kategori'),
          TabItem(icon: Icons.favorite, title: 'Favorit'),
          TabItem(icon: Icons.person, title: 'Akun')
        ],
        color: Colors.white60,
        initialActiveIndex: 0,
        onTap: (int i) {
          setState(() {
            currentIndex = i;
          });
    }
    ),
      );

  }
}
