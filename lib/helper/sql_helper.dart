import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""
    CREATE TABLE dataadmin (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    mainImage TEXT,
    judul TEXT,
    penerbit TEXT,
    penulis TEXT,
    tahun TEXT,
    harga TEXT,
    desc TEXT
    )
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('dataadmin.db', version: 1,
    onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> tambahDataAdmin(String judul, String penerbit, String penulis, String tahun, String harga, String desc) async {
    final db = await SQLHelper.db();
    final data = {
      // 'mainImage': mainImage,
      'judul': judul,
      'penerbit': penerbit,
      'penulis': penulis,
      'tahun': tahun,
      'harga': harga,
      'desc': desc
    };
    return await db.insert('dataadmin', data);
  }

  //DELETE
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> getDataAdmin() async {
    final db = await SQLHelper.db();
    return db.query('dataadmin');
  }

  //UPDATE
  static Future<int> updateItem(
      int id, String title, String? descrption) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'description': descrption,
      'createdAt': DateTime.now().toString()
    };

    final result =
    await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

}


