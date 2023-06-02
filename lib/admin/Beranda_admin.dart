import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir/admin/CRUD/add_data.dart';
import 'package:tugasakhir/admin/CRUD/edit_data.dart';
import 'package:tugasakhir/admin/api_service.dart';
import 'package:tugasakhir/admin/drawer%20menu_admin.dart';
import 'package:tugasakhir/detail.dart';
import 'package:tugasakhir/menu_drawer.dart';
import 'package:tugasakhir/mock%20api/akses%20API.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';
import 'package:tugasakhir/search_bar/searchbar.dart';

class AdminScreen extends StatefulWidget {

  // @override
  // State<StatefulWidget> createState() => new _AdminScreenState(_users);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<Users> listUsers = [];
  Repository repository = Repository();
  Widget? searchTextField = Text("List Books");
  bool isDark = false;



  ApiService api_service = ApiService();






  void changeTheme(){
    setState(() {
      isDark = !isDark;
    });
  }

  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.red.shade900,
    accentColor: Colors.red.shade900,
  );

  ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red.shade900,
    accentColor: Colors.red.shade900,
  );

  getData() async {
    listUsers = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final appBar = AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu_open_rounded),
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
                return MenuDrawerAdmin();
              }));
        },
      ),
      backgroundColor: Colors.red[900],
      title: Image.asset('assets/sosmed/diva_press.png',
          width: 200.0, height: 100.0, alignment: Alignment.centerRight),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search_outlined),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Search();
            }));
          },
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
        ),
        IconButton(
            onPressed: changeTheme,
            icon: Icon(Icons.color_lens_outlined)
        ),
      ],
      // bottom: TabBar(
      //   controller: controller,
      //   tabs: <Widget>[
      //     Tab(icon: Icon(Icons.home_outlined)),
      //     Tab(text: 'Buku Terlaris'),
      //     Tab(text: 'Buku Terlaris'),
      //   ],
      //   unselectedLabelColor: Colors.white,
      //   labelColor: Colors.orange,
      //   indicatorColor: Colors.orange,
      // ),
    );

    createTile(Users users) => Hero(
      tag: users.title,
      child: Material(
        elevation: 15.0,
        shadowColor: Colors.purple.shade900,
        child: InkWell(
          onTap: () {
            // Navigator.pushNamed(context, 'detail/${users.title}');
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Detail(users);
            }));

          },
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image(
                      image: NetworkImage(users.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text(
                      users.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11.0,
                          color: Colors.indigo),
                    ),
                  ),
                  Container(
                    child: Text(
                      users.writer,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                          fontSize: 10.0),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text(
                      users.price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade900,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return EditPlaceScreen(users: users);
                            }));
                          },
                          icon: Icon(Icons.edit, color: Colors.green.shade900, size: 12),
                          splashColor: Colors.red.shade900,
                        ),
                        IconButton(
                          onPressed: () async {
                            bool response = await repository.deleteDataAdmin(users.id);

                            if (response) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                return AdminScreen();
                              }));
                            } else {
                              throw Exception('Gagal Menghapus Data Buku !');
                            }


                          },
                          icon: Icon(Icons.delete_forever_rounded, color: Colors.red, size: 12),
                          splashColor: Colors.red.shade900,

                        ),
                      ],
                    )
                  ),

                  // Container(
                  //   child: Row(
                  //     children: <Widget>[
                  //       Text(
                  //           users.price,
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.red.shade900,
                  //         ),
                  //       ),
                  //       Container(
                  //         width: 50,
                  //         height: 50,
                  //         child: IconButton(
                  //           onPressed: (){
                  //
                  //             Navigator.push(context, MaterialPageRoute(builder: (context){
                  //               return EditPlaceScreen(users: users);
                  //             }));
                  //           },
                  //           icon: Icon(Icons.edit, color: Colors.green.shade900, size: 12),
                  //           splashColor: Colors.red.shade900,
                  //         ),
                  //       ),
                  //       Container(
                  //         width: 50,
                  //         height: 50,
                  //         child: IconButton(
                  //           onPressed: () async {
                  //             bool response = await repository.deleteDataAdmin(users.id);
                  //
                  //             if (response) {
                  //               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  //                 return AdminScreen();
                  //               }));
                  //             } else {
                  //               throw Exception('Gagal Menghapus Data Buku !');
                  //             }
                  //             // AlertDialog(
                  //             //   title: Text('Delete Data'),
                  //             //   content: Text('Apakah kamu yakin untuk menghapusnya ? '),
                  //             //   actions: [
                  //             //     TextButton(
                  //             //         onPressed: () async {
                  //             //           bool response = (await repository.deleteAdmin(users.id)) as bool;
                  //             //
                  //             //           if (response) {
                  //             //             Navigator.pop(context, true);
                  //             //           } else {
                  //             //             Navigator.pop(context, false);
                  //             //           }
                  //             //         },
                  //             //         child: Text('Ya')),
                  //             //     TextButton(onPressed: (){
                  //             //       Navigator.pop(context, false);
                  //             //     }, child: Text('Cancel')),
                  //             //   ],
                  //             // );
                  //
                  //
                  //             // api_service.deleteBook(users.id.toString()).then((value) {
                  //             //   Navigator.push(context, MaterialPageRoute(builder: (context){
                  //             //     return AdminScreen();
                  //             //   }));
                  //             //
                  //             // });
                  //
                  //
                  //           },
                  //           icon: Icon(Icons.delete_forever_rounded, color: Colors.red, size: 12),
                  //           splashColor: Colors.red.shade900,
                  //
                  //         ),
                  //       ),
                  //
                  //
                  //     ],
                  //   ),
                  // ),

                ],
              ),
            ],
          ),
        ),
      ),
    );

    final grid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverGrid.count(
            childAspectRatio: 2 / 3,
            crossAxisCount: 3,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            children: listUsers.map((users) => createTile(users)).toList(),
          ),
        ),
      ],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? dark : light,
      home: Scaffold(
        appBar: appBar,
        body: grid,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return AddPlaceScreen();
                  }));
                },
              tooltip: 'Create',
              child: Icon(Icons.add),
              splashColor: Colors.amber,
            ),
            // SizedBox(width: 5),
            // FloatingActionButton(
            //   onPressed: (){
            //     Navigator.push(context, MaterialPageRoute(builder: (context){
            //       return EditPlaceScreen(users: users);
            //     }));
            //   },
            //   tooltip: 'Edit',
            //   child: Icon(Icons.edit_attributes_rounded),
            //   splashColor: Colors.amber,
            // ),



          ],
        )  // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

// class BerandaAdmin extends StatelessWidget {
//   BerandaAdmin({Key? key, required this.users}) : super(key: key);
//
//   List<Users> listUsers = [];
//   Repository repository = Repository();
//   Widget? searchTextField = Text("List Books");
//   bool isDark = false;
//
//   final Users users;
//   ApiService api_service = ApiService();
//
//
//
//
//   void changeTheme(){
//       isDark = !isDark;
//
//   }
//
//   ThemeData dark = ThemeData(
//     brightness: Brightness.dark,
//     primaryColor: Colors.red.shade900,
//     accentColor: Colors.red.shade900,
//   );
//
//   ThemeData light = ThemeData(
//     brightness: Brightness.light,
//     primaryColor: Colors.red.shade900,
//     accentColor: Colors.red.shade900,
//   );
//
//   getData() async {
//     listUsers = await repository.getData();
//
//   }
//
//   @override
//   void initState() {
//     getData();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final appBar = AppBar(
//       leading: IconButton(
//         icon: Icon(Icons.menu_open_rounded),
//         onPressed: () {
//           Navigator.pushReplacement(context,
//               MaterialPageRoute(builder: (context) {
//                 return MenuDrawer();
//               }));
//         },
//       ),
//       backgroundColor: Colors.red[900],
//       title: Image.asset('assets/sosmed/diva_press.png',
//           width: 200.0, height: 100.0, alignment: Alignment.centerRight),
//       actions: <Widget>[
//         IconButton(
//           icon: Icon(Icons.search_outlined),
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return Search();
//             }));
//           },
//         ),
//         IconButton(
//           icon: Icon(Icons.shopping_cart),
//           onPressed: () {
//             Navigator.pushNamed(context, '/cart');
//           },
//         ),
//         IconButton(
//             onPressed: changeTheme,
//             icon: Icon(Icons.color_lens_outlined)
//         ),
//       ],
//       // bottom: TabBar(
//       //   controller: controller,
//       //   tabs: <Widget>[
//       //     Tab(icon: Icon(Icons.home_outlined)),
//       //     Tab(text: 'Buku Terlaris'),
//       //     Tab(text: 'Buku Terlaris'),
//       //   ],
//       //   unselectedLabelColor: Colors.white,
//       //   labelColor: Colors.orange,
//       //   indicatorColor: Colors.orange,
//       // ),
//     );
//
//     createTile(Users users) => Hero(
//       tag: users.title,
//       child: Material(
//         elevation: 15.0,
//         shadowColor: Colors.purple.shade900,
//         child: InkWell(
//           onTap: () {
//             // Navigator.pushNamed(context, 'detail/${users.title}');
//             Navigator.push(context, MaterialPageRoute(builder: (context){
//               return Detail(users);
//             }));
//
//           },
//           child: Stack(
//             children: <Widget>[
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Expanded(
//                     child: Image(
//                       image: NetworkImage(users.image),
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Container(
//                     child: Text(
//                       users.title,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 11.0,
//                           color: Colors.indigo),
//                     ),
//                   ),
//                   Container(
//                     child: Text(
//                       users.writer,
//                       style: TextStyle(
//                           fontWeight: FontWeight.normal,
//                           fontStyle: FontStyle.italic,
//                           fontSize: 10.0),
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   Row(
//                     children: [
//                       Container(
//                         child: Text(
//                           users.price,
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.red[900]),
//                         ),
//                       ),
//                       SizedBox(width: 12),
//                       IconButton(
//                         onPressed: (){
//                           api_service.deleteBook(users.id.toString()).then((value) {
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => AdminScreen()));
//                           });
//                         },
//                         icon: Icon(Icons.delete_forever_rounded, color: Colors.red),
//
//                       )],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//
//     final grid = CustomScrollView(
//       primary: false,
//       slivers: <Widget>[
//         SliverPadding(
//           padding: EdgeInsets.all(16.0),
//           sliver: SliverGrid.count(
//             childAspectRatio: 2 / 3,
//             crossAxisCount: 3,
//             mainAxisSpacing: 20.0,
//             crossAxisSpacing: 20.0,
//             children: listUsers.map((users) => createTile(users)).toList(),
//           ),
//         ),
//       ],
//     );
//
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: isDark ? dark : light,
//       home: Scaffold(
//           appBar: appBar,
//           body: grid,
//           floatingActionButton: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               FloatingActionButton(
//                 onPressed: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context){
//                     return AddPlaceScreen();
//                   }));
//                 },
//                 tooltip: 'Create',
//                 child: Icon(Icons.add),
//                 splashColor: Colors.amber,
//               ),
//               SizedBox(width: 5),
//               FloatingActionButton(
//                 onPressed: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context){
//                     return EditPlaceScreen(users: users);
//                   }));
//                 },
//                 tooltip: 'Edit',
//                 child: Icon(Icons.edit_attributes_rounded),
//                 splashColor: Colors.amber,
//               ),
//
//
//
//             ],
//           )  // This trailing comma makes auto-formatting nicer for build methods.
//       ),
//     );
//   }
// }
