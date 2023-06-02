import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugasakhir/database/data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mysql1/mysql1.dart';

Future<MySqlConnection> connectToMySQL() async {
  final settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    db: 'online_bookstore',
  );

  final conn = await MySqlConnection.connect(settings);
  return conn;
}

Future<List<ResultRow>> executeQuery(String query) async {
  final conn = await connectToMySQL();
  final results = await conn.query(query);
  await conn.close();
  final result = await executeQuery('SELECT * FROM online_bookstore');
  return results.toList();
}




// class TestBeranda extends StatefulWidget {
//   const TestBeranda({Key? key}) : super(key: key);
//
//   @override
//   _TestBerandaState createState() => _TestBerandaState();
// }
//
// class _TestBerandaState extends State<TestBeranda> {
//   List<Bookstores> listBuku = [];
//   List listdata = [];
//
//   Future _getdata() async {
//     try {
//       final response = await http.get(Uri.parse(
//           'http://10.0.0.36/adminpagelaravel/connectflutter/read.php'));
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           listdata = data;
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   void initState() {
//     _getdata();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Beranda'),
//       ),
//       body: ListView.builder(
//           itemCount: listdata.length,
//           itemBuilder: (context, index){
//         return Card(
//           child: ListTile(
//             title: Text(listdata[index]['judul'].toString()),
//             subtitle: Text(listdata[index]['penulis'].toString()),
//           ),
//
//         );
//       }),
//     );
//   }
// }
