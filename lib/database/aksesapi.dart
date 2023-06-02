import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tugasakhir/database/data.dart';
import 'package:tugasakhir/mock api/datadata.dart';
import 'package:tugasakhir/mock%20api/data_kategori.dart';

class Repositories {
  final  String _baseUrl = 'http://10.0.0.36/adminpagelaravel/connectflutter/read.php';




  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Bookstores> bookstores = it.map((e) => Bookstores.fromJson(e)).toList();
        return bookstores;
      }
    } catch (e) {
      print(e.toString());
    }
  }



  Future postData(String title, String writer, String penerbit, String tahun,
      String desc, String price, String image,
      String rating, String pages) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl), body: {
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



}