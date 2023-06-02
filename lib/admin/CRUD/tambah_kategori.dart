import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugasakhir/admin/admin_kategori.dart';
import 'package:tugasakhir/admin/api_service.dart';
import 'package:tugasakhir/mock%20api/akses%20API.dart';
import 'package:tugasakhir/mock%20api/data_kategori.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';

class TambahKategori extends StatefulWidget {
  const TambahKategori({Key? key}) : super(key: key);

  @override
  _TambahKategoriState createState() => _TambahKategoriState();
}

class _TambahKategoriState extends State<TambahKategori> {

  Repository repository = Repository();

  final _gambar = TextEditingController();
  final _kategori = TextEditingController();
  final _subkategori = TextEditingController();
  final _id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text('Tambah Kategori', style: GoogleFonts.allerta()),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Column(
            children: <Widget> [
              TextFormField(
                controller: _gambar,
                decoration: InputDecoration(
                  hintText: 'gambar',
                  labelText: 'Masukkan gambar',
                  icon: Icon(Icons.image_rounded),
                  iconColor: Colors.red.shade900,
                ),
              ),
              TextFormField(
                controller: _kategori,
                decoration: InputDecoration(
                  hintText: 'Kategori',
                  labelText: 'Masukkan Kategori',
                  icon: Icon(Icons.category_rounded),
                  iconColor: Colors.red.shade900,
                ),
              ),
              TextFormField(
                controller: _subkategori,
                decoration: InputDecoration(
                  hintText: 'Subkategori',
                  labelText: 'Masukkan Subkategori',
                  icon: Icon(Icons.control_point_duplicate_rounded),
                  iconColor: Colors.red.shade900
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                  onPressed: () async {
                    bool response = await repository.addDataKategori(
                        _gambar.text,
                        _kategori.text,
                        _subkategori.text,
                    );

                    if (response) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return KategoriPageAdmin();
                      }));
                    } else {
                      throw Exception('Gagal untuk Menambahkan data !');
                    }
                    // storeKategori();
                  },
                  icon: Icon(Icons.add_circle),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red.shade900
                  ),
                  label: Text('Tambah Kategori', style: GoogleFonts.acme()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  storeKategori() {
    var categories = Kategori(
        id: _id.text,
        gambar: _gambar.text,
        kategori: _kategori.text,
        subkategori: _subkategori.text,

    );

    ApiService().storeKategori(categories);
    Navigator.pop(context);

  }

}


