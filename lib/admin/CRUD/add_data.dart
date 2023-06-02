import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:tugasakhir/admin/tourism_place.dart';
import 'package:tugasakhir/admin/api_service.dart';
import 'package:tugasakhir/helper/sql_helper.dart';
import 'package:tugasakhir/mock%20api/akses%20API.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {

  Repository repository = Repository();

  final _id = TextEditingController();
  final _title = TextEditingController();
  final _writer = TextEditingController();
  final _penerbit = TextEditingController();
  final _tahun = TextEditingController();
  final _desc = TextEditingController();
  final _price = TextEditingController();
  final _image = TextEditingController();
  final _rating = TextEditingController();
  final _pages = TextEditingController();

  // List<Map<String, dynamic>> dataadmin = [];
  //
  // void refreshData() async {
  //   final data = await SQLHelper.getDataAdmin();
  //   setState(() {
  //     dataadmin = data;
  //   });
  // }

  // Future<void> tambahData() async {
  //   await SQLHelper.tambahDataAdmin(
  //       // _mainImage.text,
  //       _judul.text,
  //       _penerbit.text,
  //       _penulis.text,
  //       _tahun.text,
  //       _harga.text,
  //       _description.text);
  //   refreshData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red.shade900,
          title: Text('Tambah Data Buku', style: GoogleFonts.allerta())),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Column(
            children: [
              // TextFormField(
              //   controller: _id,
              //   decoration: const InputDecoration(
              //     hintText: 'Id',
              //     labelText: 'Id',
              //     icon: const Icon(Icons.account_circle),
              //   ),
              // ),
              TextFormField(
                controller: _title,
                decoration: const InputDecoration(
                  hintText: 'Judul',
                  labelText: 'Judul',
                  icon: const Icon(Icons.title),
                ),
              ),
              TextFormField(
                controller: _writer,
                decoration: const InputDecoration(
                  hintText: 'Nama Penulis',
                  labelText: 'Penulis',
                  icon: const Icon(Icons.person_outline),
                ),
              ),
              TextFormField(
                controller: _penerbit,
                decoration: const InputDecoration(
                  hintText: 'Nama Penerbit',
                  labelText: 'Penerbit',
                  icon: const Icon(Icons.store),
                ),
              ),
              TextFormField(
                controller: _tahun,
                decoration: const InputDecoration(
                  hintText: 'Tahun',
                  labelText: 'Tahun',
                  icon: const Icon(Icons.timeline),
                ),
              ),
              TextFormField(
                controller: _desc,
                decoration: const InputDecoration(
                  hintText: 'Deskripsi',
                  labelText: 'Masukkan Deskripsi',
                  icon: const Icon(Icons.description),
                ),
              ),
              TextFormField(
                controller: _price,
                decoration: const InputDecoration(
                  hintText: 'Harga',
                  labelText: 'Harga',
                  icon: const Icon(Icons.price_change),
                ),
              ),
              TextFormField(
                controller: _image,
                decoration: const InputDecoration(
                  hintText: 'Gambar',
                  labelText: 'Gambar',
                  icon: const Icon(Icons.image_rounded),
                ),
              ),
              TextFormField(
                controller: _rating,
                decoration: const InputDecoration(
                  hintText: 'Rating',
                  labelText: 'Rating',
                  icon: const Icon(Icons.star_half_outlined),
                ),
              ),
              TextFormField(
                controller: _pages,
                decoration: const InputDecoration(
                  hintText: 'Halaman',
                  labelText: 'Halaman',
                  icon: const Icon(Icons.pages_rounded),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                  onPressed: () async {
                    bool response = await repository.postData(
                        _title.text,
                        _writer.text,
                        _penerbit.text,
                        _tahun.text,
                        _desc.text,
                        _price.text,
                        _image.text,
                        _rating.text,
                        _pages.text
                    );

                    if (response) {
                      Navigator.popAndPushNamed(context, '/homeadmin');
                    } else {
                      throw Exception('Gagal untuk menambahkan data!');
                    }

                    // store();
                  },
                  icon: Icon(Icons.add_circle_outline),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red.shade900,
                ),
                  label: Text('Tambah', style: GoogleFonts.acme()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // store() {
  //   var place = Place(
  //     mainImage: _mainImage.text,
  //     judul: _judul.text,
  //     penerbit: _penerbit.text,
  //     penulis: _penulis.text,
  //     tahun: _tahun.text,
  //     harga: _harga.text,
  //     description: _description.text,
  //   );
  //
  //   ApiService().storePlace(place);
  //
  //   Navigator.pop(context);
  // }

  store(){
    var users = Users (
        id: _id.text,
        title: _title.text,
        writer: _writer.text,
        penerbit: _penerbit.text,
        tahun: _tahun.text,
        desc: _desc.text,
        price: _price.text,
        image: _image.text,
        rating: _rating.text,
        pages: _pages.text
    );

    ApiService().storeBook(users);
    Navigator.pop(context);
  }
}
