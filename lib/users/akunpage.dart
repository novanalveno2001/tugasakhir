
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugasakhir/home.dart';
import 'package:tugasakhir/menu_drawer.dart';
import 'package:tugasakhir/register/registerpage.dart';
import 'package:tugasakhir/users/edit_akunpage.dart';


class AkunProfil extends StatelessWidget {
  static const String routeName = '/akun';

  // final RegisterPage register;
  //
  // final _namaLengkap = new TextEditingController();
  // final _email = new TextEditingController();
  // final _phone =  new TextEditingController();

  String name,email,phone;




  // tampilkanData() async {
  //   final localStorage = await SharedPreferences.getInstance();
  //   localStorage.setString('namalengkap', _namaLengkap.text.toString());
  //   localStorage.setString('email', _email.text.toString());
  //   localStorage.setString('phone', _phone.text.toString());
  //
  //   String? _namalengkap = localStorage.getString('namaLengkap');
  //   String? _emailku = localStorage.getString('email');
  //   String? _phoneku = localStorage.getString('phone');
  // }

  AkunProfil({Key? key, required this.name, required this.email, required this.phone}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red[900],
        appBar: AppBar(
          backgroundColor: Colors.red.shade900,
          title: Center(
            child: Text('Halaman Profil'),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                      return Home();
                    }));
              },
              icon: Icon(Icons.arrow_back_sharp, color: Colors.white),
            ),
          ],
        ),
        drawerScrimColor: Colors.red.shade900,
        drawer: MenuDrawer(),
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/user/novan.jpeg'),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget> [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_a_photo_outlined, color: Colors.white),
                        alignment: Alignment.topRight,
                      ),
                    ],

                  ),
                ),
                // Row(
                //   children: <Widget> [
                //     IconButton(
                //       onPressed: () {},
                //       icon: Icon(Icons.add_a_photo_outlined),
                //     ),
                //   ],
                //
                // ),
                Text(
                  '${name}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
                Text(
                  '${email}',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 20,
                  width: 200,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.red.shade900,
                    ),
                    title: Text('${name}',
                        style: TextStyle(color: Colors.red.shade900, fontSize: 20)),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone_android,
                      color: Colors.red.shade900,
                    ),
                    title: Text('${phone}',
                        style: TextStyle(color: Colors.red.shade900, fontSize: 20)),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.attach_email,
                      color: Colors.red.shade900,
                    ),
                    title: Text('${email}',
                        style: TextStyle(color: Colors.red.shade900, fontSize: 20)),
                  ),
                ),

                SizedBox(width: 20,height: 20),

                MaterialButton(
                  color: Colors.white,
                  child: Text('Edit',
                      style: TextStyle(
                          color: Colors.red.shade900,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {},
                ),
              ],
            )),
      ),
    );
  }
}



class AkunPage extends StatefulWidget {
  static const String routeName = '/akun';


  @override
  _AkunPageState createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red[900],
        appBar: AppBar(
          backgroundColor: Colors.red.shade900,
          title: Center(
            child: Text('Halaman Profil'),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Home();
                }));
              },
              icon: Icon(Icons.arrow_back_sharp, color: Colors.white),
            ),
          ],
        ),
        drawerScrimColor: Colors.red.shade900,
        drawer: MenuDrawer(),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/user/novan.jpeg'),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget> [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_a_photo_outlined, color: Colors.white),
                    alignment: Alignment.topRight,
                  ),
                ],

              ),
            ),
            // Row(
            //   children: <Widget> [
            //     IconButton(
            //       onPressed: () {},
            //       icon: Icon(Icons.add_a_photo_outlined),
            //     ),
            //   ],
            //
            // ),
            Text(
              'Novan Alveno X Rahman',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
            Text(
              '@novanalveno_',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.white,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.red.shade900,
                ),
                title: Text('@novanalveno_',
                    style: TextStyle(color: Colors.red.shade900, fontSize: 20)),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.phone_android,
                  color: Colors.red.shade900,
                ),
                title: Text('+62813 3610 2515',
                    style: TextStyle(color: Colors.red.shade900, fontSize: 20)),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.attach_email,
                  color: Colors.red.shade900,
                ),
                title: Text('novanalveno@gmail.com',
                    style: TextStyle(color: Colors.red.shade900, fontSize: 20)),
              ),
            ),

            SizedBox(width: 20,height: 20),

            MaterialButton(
              color: Colors.white,
              child: Text('Edit',
                  style: TextStyle(
                      color: Colors.red.shade900,
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return EditAkunPage();
                }));
              },
            ),
          ],
        )),
      ),
    );
  }

  void getValidationData() async {
    final SharedPreferences pref = SharedPreferences.getInstance() as SharedPreferences;
    var dataNama = pref.getString('namalengkap');



    setState(() {


    });
  }
}
