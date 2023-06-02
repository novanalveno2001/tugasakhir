import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tugasakhir/mock api/datadata.dart';
import 'package:tugasakhir/mock%20api/data_kategori.dart';

class Repository {
    final  String _baseUrl = 'https://62eb2c95ad2954632599c1bf.mockapi.io';

  final String _KategoriAPI = 'https://6369fddbc07d8f936d9001fc.mockapi.io';




  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/users'));
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Users> users = it.map((e) => Users.fromJson(e)).toList();
        return users;
      }
    } catch (e) {
      print(e.toString());
    }
  }


  Future postData(String title, String writer, String penerbit, String tahun,
      String desc, String price, String image,
      String rating, String pages) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl + '/users'), body: {
        "title": title,
        "writer": writer,
        "penerbit": penerbit,
        "tahun": tahun,
        "desc": desc,
        "price": price,
        "image": image,
        "rating": rating,
        "pages": pages,
      });

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future putData(String id, String title, String writer, String penerbit,
      String tahun, String desc, String price, String image,
      String rating, String pages) async {
    try {
      final response = await http.put(Uri.parse('$_baseUrl/users/$id'),
          body: {
            "title": title,
            "writer": writer,
            "penerbit": penerbit,
            "tahun": tahun,
            "desc": desc,
            "price": price,
            "image": image,
            "rating": rating,
            "pages": pages,
          });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteDataAdmin(String id) async {
    try {
      final response = await http.delete(Uri.parse('$_baseUrl/users/$id'));

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
      final response = await http.delete(Uri.parse('$_KategoriAPI/categories/$id'));

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }

    } catch (e) {
      print(e.toString());
    }
  }



  Future getDataKategori() async {
    try {
      final response = await http.get(Uri.parse(_KategoriAPI + '/categories'));
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Kategori> kategori = it.map((e) => Kategori.fromJson(e)).toList();
        return kategori;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future addDataKategori(String gambar, String kategori, String subkategori) async {
    try {
      final response = await http.post(Uri.parse(_KategoriAPI + '/categories'),
        body:{
          'gambar': gambar,
          'kategori': kategori,
          'subkategori': subkategori,
        }
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }

    } catch (e) {
      return e.toString();
    }

  }

  Future updateDataKategori(String id, String gambar, String kategori, String subkategori) async {
    try {
      final response = await http.put(Uri.parse('$_KategoriAPI/categories/$id'),
          body: {
            'gambar': gambar,
            'kategori': kategori,
            'subkategori': subkategori
          });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return e.toString();
    }
  }
}