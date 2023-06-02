import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugasakhir/admin/drawer%20menu_admin.dart';
import 'package:tugasakhir/menu_drawer.dart';
import 'package:tugasakhir/mock%20api/akses%20API.dart';
import 'package:tugasakhir/mock%20api/data_kategori.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';

class DetailKategori extends StatefulWidget {
  DetailKategori({Key? key}) : super(key: key);

  @override
  _DetailKategoriState createState() => _DetailKategoriState();
}

class _DetailKategoriState extends State<DetailKategori> {
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

    createTile(Users kategori) => Hero(
        tag: kategori.title,
        child: Material(
          elevation: 16.0,
          child: InkWell(
            onTap: (){},
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: Image(
                            image: NetworkImage(kategori.image)
                        ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text(kategori.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.indigo),),
                    ),
                    Container(
                      child: Text(kategori.writer, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10, color: Colors.indigo),),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          child: Text(kategori.price, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red.shade900)),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
    );


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
            children: listUsers.map((kategori) => createTile(kategori)).toList(),
          ),
        )
      ],
    );

    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text('Halaman Kategori', style: GoogleFonts.allerta()),
      ),
      drawer: MenuDrawer(),
      body: grid,
    );
  }
}


// class DetailKategori extends StatelessWidget {
//
//   DetailKategori({Key? key}) : super(key: key);
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red.shade900,
//         title: Text('Halaman Kategori', style: GoogleFonts.allerta()),
//       ),
//       drawer: MenuDrawer(),
//       body: Container(
//         child: ListView.builder(
//             itemCount: 2,
//             itemBuilder: (context, index) {
//
//
//             }
//         ),
//       ),
//       // body: Padding(
//       //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       //   child: LimitedBox(
//       //     maxHeight: 60,
//       //     child: Row(
//       //       children: [
//       //         AspectRatio(
//       //             aspectRatio: 1,
//       //           child: Image.network(categories.image),
//       //         ),
//       //         SizedBox(width: 24),
//       //         Expanded(
//       //             child: Column(
//       //               mainAxisAlignment: MainAxisAlignment.start,
//       //               crossAxisAlignment: CrossAxisAlignment.start,
//       //               children: [
//       //                 Text(categories.title, style: GoogleFonts.abel()),
//       //               ],
//       //             ),
//       //         ),
//       //       ],
//       //     ),
//       //   ),
//       //
//       // ),
//     );
//   }
// }
