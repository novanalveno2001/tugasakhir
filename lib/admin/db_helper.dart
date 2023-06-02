import 'package:tugasakhir/admin/data_buku.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:tugasakhir/data.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  //inisialisasi beberapa variabel yang dibutuhkan
  final String tableName = 'tableKontak';
  final String id = 'id';
  final String gambar = 'gambar';
  final String judul = 'judul';
  final String penerbit = 'penerbit';
  final String penulis = 'penulis';
  final String tahun = 'tahun';
  final String harga = 'harga';
  final String desc = 'desc';

  DbHelper._internal();
  factory DbHelper() => _instance;

  //cek apakah database ada
  Future<Database?> get _db  async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'buku.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //membuat tabel dan field-fieldnya
  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName($id INTEGER PRIMARY KEY, "
        "$gambar TEXT,"
        "$judul TEXT,"
        "$penerbit TEXT,"
        "$penulis TEXT,"
        "$tahun TEXT,"
        "$harga TEXT,"
        "$desc TEXT,"
    ;
    await db.execute(sql);
  }

  //insert ke database
  Future<int?> saveBuku(Buku buku) async {
    var dbClient = await _db;
    return await dbClient!.insert(tableName, buku.toMap());
  }

  //read database
  Future<List?> getAllBuku() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName, columns: [
      id,
      gambar,
      judul,
      penerbit,
      penulis,
      tahun,
      harga,
      desc
    ]);

    return result.toList();
  }

  //update database
  Future<int?> updateBuku(Buku buku) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, buku.toMap(), where: '$id = ?', whereArgs: [buku.id]);
  }

  //hapus database
  Future<int?> deleteBuku(int id) async {
    var dbClient = await _db;
    return await dbClient!.delete(tableName, where: '$id = ?', whereArgs: [id]);
  }
}