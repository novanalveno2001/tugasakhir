import 'dart:js';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugasakhir/login/loginpage.dart';
import 'package:tugasakhir/mock%20api/data_screen.dart';
import 'package:tugasakhir/routes/routes.dart';
import 'package:tugasakhir/favorit/favorite_list.dart';
import 'package:tugasakhir/tab_bar/buku_rekomendasi.dart';
import 'package:tugasakhir/tab_bar/buku_terbaru.dart';
import 'package:tugasakhir/tab_bar/buku_terlaris.dart';
import 'package:tugasakhir/users/akunpage.dart';
import 'package:tugasakhir/users/beranda.dart';
import 'package:tugasakhir/users/favoritepage.dart';
import 'package:tugasakhir/users/kategoripage.dart';
import 'package:tugasakhir/users/keranjangpage.dart';
import 'package:tugasakhir/register/registerpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuDrawer extends StatelessWidget {
  String namalengkap ='';
  String email = '';
  late RegisterPage _registerPage;

  TextEditingController _namalengkap = TextEditingController();
  TextEditingController _email = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(context),
          _drawerItem(
              icon: Icons.home_filled,
              text: 'Beranda',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DataScreen();
              }))
          ),
          _drawerItem(
              icon: Icons.category_outlined,
              text: 'Kategori',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                return KategoriPage();
              }))
          ),
          _drawerItem(
              icon: Icons.favorite_rounded,
              text: 'Favorit',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FavoriteList() ;
              }))
          ),
          _drawerItem(
              icon: Icons.person_outline,
              text: 'Akun',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AkunPage();
              }))
          ),
          Divider(height: 25, thickness: 2),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text("Kategori Buku",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                )),
          ),
          _drawerItem(
              icon: Icons.book_outlined,
              text: 'Buku Terbaru',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BukuTerbaru();
              }))
          ),
          _drawerItem(
              icon: Icons.book_online,
              text: 'Buku Terlaris',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BukuTerlaris();
              }))
          ),
          _drawerItem(
              icon: Icons.book,
              text: 'Buku Rekomendasi (Best Seller)',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BukuRekomendasi();
              }))
          ),

          Divider(height: 25, thickness: 3),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text("Logout",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                )),
          ),
      _drawerItem(
          icon: Icons.login_outlined,
          text: 'Logout',
          onTap: () async {
            final pref = await SharedPreferences.getInstance();
            // pref.remove();
            pref.clear(); // <- remove sharedpreferences;

            CoolAlert.show(
              context: context,
              type: CoolAlertType.confirm,
              confirmBtnText: 'OK',
              confirmBtnColor: Colors.green.shade900,
              onConfirmBtnTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return LoginPage();
                }));
              },
              cancelBtnText: 'CANCEL',
              onCancelBtnTap: () => Navigator.pop(context),
              title: 'Apakah anda yakin untuk logout?',
              text: "jika tidak , klik cancel untuk membatalkan",
            );

            // AlertDialog alert = AlertDialog(
            //   title: Text("Apakah anda yakin untuk logout?"),
            //   content: Container(
            //     child: Text("Jika tidak , klik cancel untuk membatalkannya!"),
            //   ),
            //   actions: [
            //     ElevatedButton(
            //       child: Text('OK'),
            //       onPressed: () => Navigator.of(context).pushAndRemoveUntil(
            //           MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (
            //           Route route) => route == null)
            //     ),
            //     MaterialButton(
            //         color: Colors.red.shade900,
            //         onPressed: () => Navigator.of(context).pop(),
            //         child: Text('Cancel',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
            //     ),
            //   ],
            // );
            //
            // showDialog(context: context, builder: (context) => alert);

              final snackBar = SnackBar(
                duration: const Duration(seconds: 5),
                content: Text("Berhasil Logout dari akun !", style: TextStyle(fontWeight: FontWeight.w900, color: Colors.red[900])),
                backgroundColor: Colors.amber,
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              return;
            }
          ),
        ],
      ),
    );
  }
}

Widget _drawerHeader(BuildContext context) {
  return UserAccountsDrawerHeader(
    decoration: BoxDecoration(color: Colors.red.shade900),
    currentAccountPicture: GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AkunPage()));
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        //   return AkunPage();
        // }));
      },
      child: Image(
          image: AssetImage('assets/user/novan.jpeg'),
          fit: BoxFit.cover),
    ),
    otherAccountsPictures: [
      ClipOval(
        child: Image(
            image: AssetImage('assets/user/novan.jpeg'),
            fit: BoxFit.cover),
      ),
    ],
    accountName: Text('Novan Alveno X Rahman'),
    accountEmail: Text('novanalveno@gmail.com'),
  );


}
//
// void getDataPreferences() async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//
//   await prefs.setString('namalengkap', _namalengkap.text);
// }



Widget _drawerItem(
    {required IconData icon, required String text, required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}

