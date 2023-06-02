import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:tugasakhir/Keranjang/checkout/billing_details.dart';
import 'package:tugasakhir/Keranjang/models/cart.dart';
import 'package:tugasakhir/Keranjang/models/catalog_model.dart';
import 'package:tugasakhir/Keranjang/screen/cart.dart';
import 'package:tugasakhir/Keranjang/screen/catalog.dart';
import 'package:tugasakhir/admin/Beranda_admin.dart';
import 'package:tugasakhir/admin/admin_kategori.dart';
import 'package:tugasakhir/admin/tourism_place.dart';
import 'package:tugasakhir/database/berandapage.dart';
import 'package:tugasakhir/database/testberanda.dart';
import 'package:tugasakhir/favorit/favorite_provider.dart';
import 'package:tugasakhir/home.dart';
import 'package:tugasakhir/launcher.dart';
import 'package:tugasakhir/login/loginpage.dart';
import 'package:tugasakhir/mock%20api/data_screen.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';
import 'package:tugasakhir/favorit/favorite_list_models.dart';
import 'package:tugasakhir/favorit/favorite_page_models.dart';
import 'package:tugasakhir/favorit/favorite_list.dart';
import 'package:tugasakhir/search_bar/search_api.dart';
import 'package:tugasakhir/search_bar/searchbar.dart';
import 'package:tugasakhir/testapi.dart';
import 'package:tugasakhir/users/akunpage.dart';
import 'package:tugasakhir/users/kategoripage.dart';
import 'package:tugasakhir/users/keranjangpage.dart';
import 'package:tugasakhir/users/lihatdetailkeranjang.dart';
import 'data.dart';
import 'detail.dart';
import 'package:tugasakhir/favorit/favorite_page.dart';
import 'package:tugasakhir/tema/theme.dart';
import 'package:tugasakhir/tema/theme_cubit.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // HydratedBloc.storage = await HydratedStorage.build(
  //   storageDirectory: await getTemporaryDirectory(),
  // );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => FavoriteProvider(),
          ),
          // Provider(create: (context) => FavoriteListModel()),
          // // Provider(create: (context) => ListFavoriteModel()),
          // ChangeNotifierProxyProvider<FavoriteListModel, FavoritePageModel>(
          //   create: (context) => FavoritePageModel(),
          //   update: (context, favoritelist, favoritepage) {
          //     if (favoritepage == null)
          //       throw ArgumentError.notNull('favoritepage');
          //     favoritepage.favoritelist = favoritelist;
          //     return favoritepage;
          //   },
          // ),
          Provider(create: (context) => CatalogModel()),
          // CartModel is implemented as a ChangeNotifier, which calls for the use
          // of ChangeNotifierProvider. Moreover, CartModel depends
          // on CatalogModel, so a ProxyProvider is needed.
          ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            create: (context) => CartModel(),
            update: (context, catalog, cart) {
              if (cart == null) throw ArgumentError.notNull('cart');
              cart.catalog = catalog;
              return cart;
            },
          ),
        ],
        child: MaterialApp(
                title: 'Diva Press',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primaryColor: Colors.red[900],
                  platform: TargetPlatform.iOS,
                ),
                home: LauncherPage(),
                routes: <String, WidgetBuilder>{
                  '/keranjang': (BuildContext context) => KeranjangPage(),
                  '/favoritepage': (context) => FavoritePage(),
                  '/lihatdetail': (BuildContext context) =>
                      LihatDetailKeranjang(),
                  '/catalog': (context) => MyCatalog(),
                  '/cart': (context) => MyCart(),
                  '/homeadmin': (context) => AdminScreen(),
                },
                onGenerateRoute: (settings) => generateRoute(settings),
              ),
    );
  }
}

generateRoute(RouteSettings settings) {
  List<Users> listUsers = [];

  final path = settings.name!.split('/');
  final title = path[1];

  Users book = listUsers.firstWhere((it) => it.title == title);
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => Detail(book),
  );
}
