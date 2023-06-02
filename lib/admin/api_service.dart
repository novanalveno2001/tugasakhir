import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:tugasakhir/admin/tourism_place.dart';
import 'package:tugasakhir/mock%20api/data_kategori.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';

class ApiService {
  // final String _baseUrl = 'https://625a05cb43fda1299a14aa37.mockapi.io';
  final String _APIUrl = 'https://62eb2c95ad2954632599c1bf.mockapi.io';

  final String _KategoriAPI = 'https://6369fddbc07d8f936d9001fc.mockapi.io';

  // Future<TourismPlace> getTourismPlace() async {
  //   var response = await http.get(Uri.parse('$_baseUrl/api/v1/tourism-places'));
  //   var tourismPlace = TourismPlace.fromJson(json.decode(response.body));
  //   return tourismPlace;
  // }

  Future<Datadata> getDataBuku() async {
    var response = await http.get(Uri.parse('$_APIUrl/users'));
    var _datadata = Datadata.fromJson(json.decode(response.body));
    return _datadata;
  }

  Future<DataKategori> getDataKategori() async {
    var response = await http.get(Uri.parse('$_KategoriAPI/categories'));
    var categories = DataKategori.fromJson(json.decode(response.body));
    return categories;
  }



  // storePlace(Place place) async {
  //   await http.post(Uri.parse('$_baseUrl/api/v1/tourism-places'),
  //     body: json.encode(place.toJson()),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //     },
  //   );
  // }

  storeBook(Users users) async {
    await http.post(Uri.parse('$_APIUrl/users'),
        body: json.encode(users.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json',
        });
  }

  storeKategori(Kategori _kategori) async {
    await http.post(Uri.parse('$_KategoriAPI/categories'),
      body: json.encode(_kategori.toJson()),
      headers: <String, String> {
      'Content-Type': 'application/json',
      });
  }

  // Future deletePlace(String id) async {
  //   try {
  //     final response = await http.delete(
  //         Uri.parse('$_baseUrl/api/v1/tourism-places/' + id));
  //     // return json.decode(response.body);
  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future deleteBook(String id) async {
    try {
      final response = await http.delete(Uri.parse('$_APIUrl/users' + id.toString()));

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteKategori(String id) async {
    try {
      final response = await http.delete(Uri.parse('$_KategoriAPI/categories' + id.toString()));

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }


  TextEditingController _titleController = TextEditingController();
  TextEditingController _penerbitController = TextEditingController();
  TextEditingController _writerController = TextEditingController();
  TextEditingController _tahunController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _ratingController = TextEditingController();
  TextEditingController _pagesController = TextEditingController();

  // Future editWisata(String id) async {
  //   final response = await http.put(Uri.parse('$_baseUrl/api/v1/tourism-places/' + id), body: {
  //     "judul": _judulController.text,
  //     "penerbit": _penerbitController.text,
  //     "penulis": _penulisController.text,
  //     "tahun": _tahunController.text,
  //     "harga": _hargaController.text,
  //     "description": _deskripsiController.text,
  //     "main-image": _imageController.text,
  //   });
  //
  //   return json.decode(response.body);
  // }

  Future editBook(String id) async {
    final response = await http.put(Uri.parse('$_APIUrl/users' + id), body: {
      'title': _titleController.text,
      'writer': _writerController.text,
      'penerbit': _penerbitController.text,
      'tahun': _tahunController.text,
      'desc': _descController.text,
      'price': _priceController.text,
      'image': _imageController.text,
      'rating': _ratingController.text,
      'pages': _pagesController.text
    });

    return json.decode(response.body);
  }





  TextEditingController _gambarController = TextEditingController();
  TextEditingController _kategoriController = TextEditingController();
  TextEditingController _subkategoriController = TextEditingController();

  Future editKategori(String id) async {
    final response = await http.put(Uri.parse('$_KategoriAPI/categories' + id),
      body: {
        'gambar': _gambarController.text,
        'kategori': _kategoriController.text,
        'subkategori': _subkategoriController.text,

      });

    return json.decode(response.body);
  }

}
