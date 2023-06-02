import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = 'localhost';
  static String user = 'root';
  static String password = '';
  static String db = 'phpmyadmin';
  static int port = 3306;

  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
    host: host,
    port: port,
    user: user,
    password: password,
    db: db,
    );
    return await MySqlConnection.connect(settings);
  }
}