import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tugasakhir/admin/Beranda_admin.dart';
import 'package:tugasakhir/admin/tourism_place.dart';
import 'package:tugasakhir/admin/api_service.dart';
import 'package:tugasakhir/mock%20api/akses%20API.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';

class EditPlaceScreen extends StatelessWidget {
  EditPlaceScreen({required this.users});

  final Users users;
  ApiService api_service =ApiService();
  List<Users> listUsers = [];
  Repository repository = Repository();


  getData() async {
    listUsers = await repository.getData();
  }

  @override
  void initState() {
    getData();
  }


  editWisata() async {
    await api_service.editBook(users.id.toString());

  }


  final _formKey = GlobalKey<FormState>();
  TextEditingController _id = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _penerbit = TextEditingController();
  TextEditingController _writer = TextEditingController();
  TextEditingController _image = TextEditingController();
  TextEditingController _tahun = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _desc = TextEditingController();
  TextEditingController _rating = TextEditingController();
  TextEditingController _pages = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text('Edit Data Buku'),
        backgroundColor: Colors.red.shade900,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Column(
            children: [
              TextFormField(
                controller: _id..text = users.id.toString(),
                decoration: const InputDecoration(
                  hintText: 'Id',
                  labelText: 'Id',
                  icon: const Icon(Icons.perm_identity_outlined),
                ),
              ),
              TextFormField(
                controller: _title..text = users.title,
                decoration: const InputDecoration(
                  hintText: 'Judul',
                  labelText: 'Judul',
                  icon: const Icon(Icons.title),
                ),
              ),
              TextFormField(
                controller: _writer..text = users.writer,
                decoration: const InputDecoration(
                  hintText: 'Nama Penulis',
                  labelText: 'Penulis',
                  icon: const Icon(Icons.widgets),
                ),
              ),
              TextFormField(
                controller: _penerbit..text = users.penerbit,
                decoration: const InputDecoration(
                  hintText: 'Nama Penerbit',
                  labelText: 'Penerbit',
                  icon: const Icon(Icons.store),
                ),
              ),
              TextFormField(
                controller: _tahun..text = users.tahun,
                decoration: const InputDecoration(
                  hintText: 'Tahun',
                  labelText: 'Tahun',
                  icon: const Icon(Icons.timeline),
                ),
              ),
              TextFormField(
                controller: _desc..text = users.desc,
                decoration: const InputDecoration(
                  hintText: 'Deskripsi',
                  labelText: 'Masukkan Deskripsi',
                  icon: const Icon(Icons.description),
                ),
              ),
              TextFormField(
                controller: _price..text = users.price,
                decoration: const InputDecoration(
                  hintText: 'Harga',
                  labelText: 'Harga',
                  icon: const Icon(Icons.price_change_outlined),
                ),
              ),
              TextFormField(
                controller: _image..text = users.image,
                decoration: const InputDecoration(
                  hintText: 'Gambar',
                  labelText: 'Gambar',
                  icon: const Icon(Icons.image_rounded),
                ),
              ),
              TextFormField(
                controller: _rating..text = users.rating,
                decoration: const InputDecoration(
                  hintText: 'Rating',
                  labelText: 'Rating',
                  icon: const Icon(Icons.star_half_outlined),
                ),
              ),
              TextFormField(
                controller: _pages..text = users.pages,
                decoration: const InputDecoration(
                  hintText: 'Halaman',
                  labelText: 'Halaman',
                  icon: const Icon(Icons.pages_rounded),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  bool response = await repository.putData(
                      _id.text,
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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      return AdminScreen();
                    }));
                    // Navigator.popAndPushNamed(context, '/homeadmin');
                  } else {
                    throw Exception('Gagal untuk meng-update data!');

                  }

                  // store();
                },
                child: const Text('Update'),
                style: ElevatedButton.styleFrom(primary: Colors.red.shade900),

              ),

            ],
          ),
        ),
      ),
    );
  }

  store() {
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

    // ApiService().storeBook(users);
    Repository().putData(_id.text, _title.text, _writer.text, _penerbit.text, _tahun.text, _desc.text, _price.text, _image.text, _rating.text, _pages.text);



  }


}
