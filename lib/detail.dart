import 'dart:html';

import 'package:google_fonts/google_fonts.dart';
import 'package:tugasakhir/Keranjang/checkout/billing_details.dart';
import 'package:tugasakhir/Keranjang/checkout/pembelian.dart';
import 'package:tugasakhir/Keranjang/checkout/tambah_keranjang.dart';
import 'package:tugasakhir/Keranjang/models/cart.dart';
import 'package:tugasakhir/Keranjang/screen/catalog.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir/favorit/add_favorite.dart';
import 'package:tugasakhir/favorit/favorite_provider.dart';
import 'package:tugasakhir/models/item.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tugasakhir/mock api/datadata.dart';
import 'package:provider/provider.dart';
import 'package:tugasakhir/Keranjang/models/catalog_model.dart';

class Detail extends StatelessWidget {
  final Users book;

  Detail(this.book);

  // final Book book;
  //
  // Detail(this.book);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);

    final appBar = AppBar(
      elevation: .5,
      title: Text('Diva Press', style: GoogleFonts.allerta()),
      backgroundColor: Colors.red[900],
      actions: <Widget>[
        IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return TambahKeranjang();
              }));
            },
            icon: Icon(Icons.shopping_cart_rounded, color: Colors.white),
        ),
      ],
    );

    final topLeft = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Hero(
            tag: book.title,
            child: Material(
              elevation: 15.0,
              color: Colors.red[900],
              child: Image(
                image: NetworkImage(book.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text('${book.pages} halaman',
            style: GoogleFonts.alata(
              color: Colors.white38,
              fontSize: 12,
            )),
      ],
    );

    ///detail top right
    final topRight = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(height: 20),
        Text(book.title,
            style: GoogleFonts.arbutus(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        SizedBox(height: 12),
        Row(
          children: <Widget>[
            Text('${book.price}',
                style: GoogleFonts.alatsi(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                )),
            SizedBox(width: 5),
            // RatingBar(rating: book.rating, color: Colors.amber),
            Text(
              '${book.rating}',
              style: TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(width: 3),
            Icon(Icons.star_outlined, color: Colors.amber, size: 12),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  // return Beli(users: book);
                  return DataPesanan();
                }));
              },
              icon: Icon(Icons.shopping_cart,
                  color: Colors.white, size: 30),
              style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              label: Text(
                'Beli Sekarang',
                style: GoogleFonts.acme(fontWeight: FontWeight.bold),
              ),
              autofocus: true,
            ),
            IconButton(
                onPressed: (){
                  provider.toggleFavorite(book);
                },
                icon: provider.isExist(book)
                    ? Icon(Icons.done_outline_outlined, color: Colors.white)
                    : Icon(Icons.add_shopping_cart_outlined, color: Colors.white)
            ),
          ],
        ),
        SizedBox(height: 25),
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.red.shade900),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white60),
              child: MaterialButton(
                onPressed: () {
                  _launchURL('https://divapress-online.com/');
                },
                child: Image.asset(
                  'assets/sosmed/divapress.jpg',
                  width: 30.0,
                  height: 30.0,
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red.shade900),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white60),
                child: MaterialButton(
                  onPressed: () {
                    _launchURL('https://shopee.co.id/fiksidivapress');
                  },
                  child: Image.asset(
                    'assets/sosmed/shopee.jpg',
                    width: 30.0,
                    height: 30.0,
                  ),
                )),
            Container(
                decoration: BoxDecoration(
                    border: Border.symmetric(),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white60),
                child: MaterialButton(
                  onPressed: () {
                    _launchURL('https://www.tokopedia.com/divapressgroup');
                  },
                  child: Image.asset(
                    'assets/sosmed/tokped.png',
                    width: 40.0,
                    height: 40.0,
                  ),
                )),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white60),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white60),
                child: MaterialButton(
                  onPressed: () {
                    _launchURL('https://basabasi.co/');
                  },
                  child: Image.asset(
                    'assets/sosmed/basabasi.jpg',
                    width: 30.0,
                    height: 30.0,
                  ),
                )),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.red.shade900),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white60),
                child: MaterialButton(
                    onPressed: () {
                      _launchURL(
                          'https://shopee.co.id/divapressgroup?c=s_SS_ID_IG04_organic&pid=instagram&smtt=9&utm_campaign=s_SS_ID_IG04_organic&utm_content=all&utm_medium=seller&utm_source=instagram');
                    },
                    child: Image.asset(
                      'assets/sosmed/shopee_mall.jpg',
                      width: 30.0,
                      height: 30.0,
                    ))),
          ],
        ),
      ],
    );

    final topContent = Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 2, child: topLeft),
          Flexible(flex: 3, child: topRight),
        ],
      ),
    );

    ///scrolling text description
    final bottomContent = Container(
      height: 220.0,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('DESKRIPSI BUKU', style: GoogleFonts.allerta(fontWeight: FontWeight.bold)),
            Divider(thickness: 2,color: Colors.black),
            SizedBox(height: 5),
            Text(book.desc, style: GoogleFonts.content(fontSize: 13, height: 1.5)),
            Divider(thickness: 2,color: Colors.black),
            SizedBox(height: 10),
            Text('Rincian Buku : ', style: GoogleFonts.acme(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text('Penulis : ${book.writer}',
                style: GoogleFonts.alata()),
            SizedBox(height: 2),
            Text('Penerbit : ${book.penerbit}',
                style: GoogleFonts.alata()),
            SizedBox(height: 2),
            Text('Tahun Terbit : ${book.tahun}',
                style: GoogleFonts.alata()),
            SizedBox(height: 2),
            Text('Halaman : ${book.pages}', style: GoogleFonts.alata()),
          ],
        ),
        // child: Text(
        //   book.desc,
        //   style: GoogleFonts.content(fontSize: 13.0, height: 1.5),
        // ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }

  ///create text widget
  text(String data,
          {Color color = Colors.black87,
          num size = 14,
          EdgeInsetsGeometry padding = EdgeInsets.zero,
          bool isBold = false}) =>
      Padding(
        padding: padding,
        child: Text(
          data,
          style: TextStyle(
              color: color,
              fontSize: size.toDouble(),
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
      );
}

// class _AddButton extends StatelessWidget {
//   final Users users;
//
//   const _AddButton({required this.users});
//
//   @override
//   Widget build(BuildContext context) {
//     var isInCart = context.select<tambahKeranjang, bool>(
//           (cart) => cart.listUsers.contains(users),
//     );
//
//     return IconButton(
//       icon: isInCart
//           ? Icon(Icons.check_box_outlined, color: Colors.red.shade900)
//           : Icon(Icons.add_shopping_cart),
//       onPressed: isInCart
//           ? () {
//         var cart = context.read<tambahKeranjang>();
//         cart.remove(users);
//       }
//           :  () {
//         var cart = context.read<CartModel>();
//       },
//     );
//   }
// }

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
