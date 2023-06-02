import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugasakhir/admin/Beranda_admin.dart';
import 'package:tugasakhir/admin/admin_kategori.dart';
import 'package:tugasakhir/admin/api_service.dart';
import 'package:tugasakhir/mock%20api/akses%20API.dart';
import 'package:tugasakhir/mock%20api/data_kategori.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';


class EditKategori extends StatelessWidget {
  EditKategori({Key? key, required this.categories}) : super(key: key);

  final Kategori categories;
  List<Kategori> listKategori = [];
  Repository repository = Repository();

  TextEditingController _gambar = TextEditingController();
  TextEditingController _kategori = TextEditingController();
  TextEditingController _subkategori = TextEditingController();
  TextEditingController _id = TextEditingController();

  getData() async {
    listKategori = await repository.getDataKategori();
  }

  @override
  void initState() {
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade900,
          title: Text('Edit Kategori', style: GoogleFonts.acme()),

        ),
        body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _id..text = categories.id,
                        decoration: InputDecoration(
                          hintText: 'Gambar',
                          labelText: 'Gambar',
                          icon: Icon(Icons.image_rounded),
                          iconColor: Colors.red.shade900,
                        ),
                      ),
                      TextFormField(
                        controller: _gambar..text = categories.gambar,
                        decoration: InputDecoration(
                          hintText: 'Gambar',
                          labelText: 'Gambar',
                          icon: Icon(Icons.image_rounded),
                          iconColor: Colors.red.shade900,
                        ),
                      ),
                      TextFormField(
                        controller: _kategori..text = categories.kategori,
                        decoration: InputDecoration(
                          hintText: 'Kategori',
                          labelText: 'Kategori',
                          icon: Icon(Icons.category_outlined),
                          iconColor: Colors.red.shade900,
                        ),
                      ),
                      TextFormField(
                        controller: _subkategori..text = categories.subkategori,
                        decoration: InputDecoration(
                          hintText: 'Subkategori',
                          labelText: 'Subkategori',
                          icon: Icon(Icons.control_point_duplicate_rounded),
                          iconColor: Colors.red.shade900,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () async {
                          bool response = await repository.updateDataKategori(
                              _id.text,
                              _gambar.text,
                              _kategori.text,
                              _subkategori.text
                          );

                          if (response) {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                              return KategoriPageAdmin();
                            }));
                            // Navigator.popAndPushNamed(context, '/homeadmin');
                          } else {
                            throw Exception('Gagal untuk meng-update data!');

                          }
                        },
                        icon: Icon(Icons.save),
                        label: Text('Simpan'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red.shade900
                        ),
                      ),

                    ],
                  ),
                ),
              )
    );
  }
}


// class EditKategori extends StatefulWidget {
//   const EditKategori({Key? key}) : super(key: key);
//
//   @override
//   _EditKategoriState createState() => _EditKategoriState();
// }
//
// class _EditKategoriState extends State<EditKategori> {
//
//   List<Kategori> listKategori = [];
//   Repository repository = Repository();
//
//   TextEditingController _gambar = TextEditingController();
//   TextEditingController _kategori = TextEditingController();
//   TextEditingController _subkategori = TextEditingController();
//   TextEditingController _id = TextEditingController();
//
//   getData() async {
//     listKategori = await repository.getDataKategori();
//   }
//
//   @override
//   void initState() {
//     getData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.red.shade900,
//           title: Text('Edit Kategori', style: GoogleFonts.acme()),
//
//         ),
//         body: ListView.builder(
//             itemBuilder: (context, index) {
//               final editKategori = listKategori[index];
//               return SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//                   child: Column(
//                     children: <Widget>[
//                       TextFormField(
//                         controller: _id..text = editKategori.id,
//                         decoration: InputDecoration(
//                           hintText: 'Gambar',
//                           labelText: 'Gambar',
//                           icon: Icon(Icons.image_rounded),
//                           iconColor: Colors.red.shade900,
//                         ),
//                       ),
//                       TextFormField(
//                         controller: _gambar..text = editKategori.gambar,
//                         decoration: InputDecoration(
//                           hintText: 'Gambar',
//                           labelText: 'Gambar',
//                           icon: Icon(Icons.image_rounded),
//                           iconColor: Colors.red.shade900,
//                         ),
//                       ),
//                       TextFormField(
//                         controller: _kategori..text = editKategori.kategori,
//                         decoration: InputDecoration(
//                           hintText: 'Kategori',
//                           labelText: 'Kategori',
//                           icon: Icon(Icons.category_outlined),
//                           iconColor: Colors.red.shade900,
//                         ),
//                       ),
//                       TextFormField(
//                         controller: _subkategori..text = editKategori.subkategori,
//                         decoration: InputDecoration(
//                           hintText: 'Subkategori',
//                           labelText: 'Subkategori',
//                           icon: Icon(Icons.control_point_duplicate_rounded),
//                           iconColor: Colors.red.shade900,
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       ElevatedButton.icon(
//                         onPressed: () async {
//                           bool response = await repository.updateDataKategori(
//                               _id.text,
//                               _gambar.text,
//                               _kategori.text,
//                               _subkategori.text
//                           );
//
//                           if (response) {
//                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
//                               return AdminScreen();
//                             }));
//                             // Navigator.popAndPushNamed(context, '/homeadmin');
//                           } else {
//                             throw Exception('Gagal untuk meng-update data!');
//
//                           }
//                         },
//                         icon: Icon(Icons.save),
//                         label: Text('Simpan'),
//                         style: ElevatedButton.styleFrom(
//                             primary: Colors.red.shade900
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//               );
//             })
//     );
//     // body: SingleChildScrollView(
//     //   child: Padding(
//     //       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//     //     child: Column(
//     //       children: <Widget>[
//     //         TextFormField(
//     //           controller: _id,
//     //           decoration: InputDecoration(
//     //             hintText: 'Gambar',
//     //             labelText: 'Gambar',
//     //             icon: Icon(Icons.image_rounded),
//     //             iconColor: Colors.red.shade900,
//     //           ),
//     //         ),
//     //         TextFormField(
//     //           controller: _gambar,
//     //           decoration: InputDecoration(
//     //             hintText: 'Gambar',
//     //             labelText: 'Gambar',
//     //             icon: Icon(Icons.image_rounded),
//     //             iconColor: Colors.red.shade900,
//     //           ),
//     //         ),
//     //         TextFormField(
//     //           controller: _kategori,
//     //           decoration: InputDecoration(
//     //             hintText: 'Kategori',
//     //             labelText: 'Kategori',
//     //             icon: Icon(Icons.category_outlined),
//     //             iconColor: Colors.red.shade900,
//     //           ),
//     //         ),
//     //         TextFormField(
//     //           controller: _subkategori,
//     //           decoration: InputDecoration(
//     //             hintText: 'Subkategori',
//     //             labelText: 'Subkategori',
//     //             icon: Icon(Icons.control_point_duplicate_rounded),
//     //             iconColor: Colors.red.shade900,
//     //           ),
//     //         ),
//     //         SizedBox(height: 20),
//     //         ElevatedButton.icon(
//     //             onPressed: (){
//     //               storeKategori();
//     //             },
//     //             icon: Icon(Icons.save),
//     //             label: Text('Simpan'),
//     //           style: ElevatedButton.styleFrom(
//     //             primary: Colors.red.shade900
//     //           ),
//     //         ),
//     //       ],
//     //     ),
//     //   ),
//     // ),
//
//   }
//
//   storeKategori() {
//     var categories = Kategori(
//       id: _id.text,
//       gambar: _gambar.text,
//       kategori: _kategori.text,
//       subkategori: _subkategori.text,
//
//     );
//
//     // ApiService().storeKategori(categories);
//     Repository().updateDataKategori(
//         _id.text,
//         _gambar.text,
//         _kategori.text,
//         _subkategori.text
//     );
//   }
// }
