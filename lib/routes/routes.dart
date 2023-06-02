import 'package:tugasakhir/database/berandapage.dart';
import 'package:tugasakhir/tab_bar/buku_rekomendasi.dart';
import 'package:tugasakhir/users/akunpage.dart';
import 'package:tugasakhir/users/beranda.dart';
import 'package:tugasakhir/users/favoritepage.dart';
import 'package:tugasakhir/users/kategoripage.dart';
import 'package:tugasakhir/users/keranjangpage.dart';
import 'package:tugasakhir/tab_bar/buku_terbaru.dart';
import 'package:tugasakhir/tab_bar/buku_terlaris.dart';
import 'package:tugasakhir/favorit/favorite_page.dart';
import 'package:tugasakhir/mock api/data_screen.dart';



class Routes {
  static const String beranda = Beranda.routeName;
  static const String kategori = KategoriPage.routeName;
  static const String favorit = FavoritPage.routeName;
  static const String keranjang = KeranjangPage.routeName;
  static const String akun = AkunPage.routeName;
  static const String buku_terbaru = BukuTerbaru.routeName;
  static const String buku_terlaris = BukuTerlaris.routeName;
  static const String buku_rekomendasi = BukuRekomendasi.routeName;
  static const String favoritpage = FavoritePage.routeName;
  static const String datascreen = DataScreen.routeName;
  static const String berandapage = BerandaPage.routeName;

}