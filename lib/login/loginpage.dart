import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugasakhir/admin/Beranda_admin.dart';
import 'package:tugasakhir/home.dart';
import 'package:tugasakhir/login/login_adminpage.dart';
import 'package:tugasakhir/register/registerpage.dart';
import 'package:tugasakhir/screen/loading_screen.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isVisible = false;

  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])");

  bool validatePassword(String pass) {
    String _pw = pass.trim();

    if (pass_valid.hasMatch(_pw)) {
      return true;
    } else {
      return false;
    }
  }

  final _username = new TextEditingController();
  final _password = new TextEditingController();

  saveData() async {
    final localStorage = await SharedPreferences.getInstance();
    localStorage.setString('username', _username.text.toString());
    localStorage.setString('password', _password.text.toString());

    String? username = localStorage.getString('username');
    String? password = localStorage.getString('password');

    if (_username.text == "" && _password.text == "") {
      final snackBar = SnackBar(
        duration: const Duration(seconds: 5),
        content: Text("Email dan password diisi terlebih dahulu !!!",
            style:
                TextStyle(fontWeight: FontWeight.w900, color: Colors.red[900])),
        backgroundColor: Colors.amber,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else if (_username.text == "") {
      final snackBar = SnackBar(
        duration: const Duration(seconds: 5),
        content: Text("Username harus diisi!",
            style:
                TextStyle(fontWeight: FontWeight.w900, color: Colors.red[900])),
        backgroundColor: Colors.amber,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else if (_password.text == "") {
      final snackBar = SnackBar(
        duration: const Duration(seconds: 5),
        content: Text("Password harus diisi!",
            style:
                TextStyle(fontWeight: FontWeight.w900, color: Colors.red[900])),
        backgroundColor: Colors.amber,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else if (_username.text == "admin" || _password.text == "admin") {
      AlertDialog alertDialog = AlertDialog(
        title: Text('Login Sebagai Admin Sukses !'),
        content: Container(
          child: Text('Selamat telah login sebagai Admin'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AdminScreen();
              }));
            },
            child: Text('OK'),
          ),
          MaterialButton(
              color: Colors.red,
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
        ],
      );

      showDialog(context: context, builder: (context) => alertDialog);
      return;
    } else {
      AlertDialog alert = AlertDialog(
        title: Text("Login Berhasil"),
        content: Container(
          child: Text("Selamat Anda Berhasil login"),
        ),
        actions: [
          ElevatedButton(
            child: Text('OK'),
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return LoadingScreen();
            })),
          ),
          MaterialButton(
              color: Colors.red,
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
        ],
      );

      showDialog(context: context, builder: (context) => alert);


    }
  }

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  login() async {
    var url = 'http://10.0.0.36/adminpagelaravel/connectflutter/register.php';
    var response = await http.post(Uri.parse(url), body: {
      "username" : username.text,
      "password" : password.text
    });

    var data = json.decode(response.body);

    if (data == "success") {
      Fluttertoast.showToast(
          msg: "Berhasil Login!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      AlertDialog alert = AlertDialog(
        title: Text("Login Berhasil"),
        content: Container(
          child: Text("Selamat Anda Berhasil login"),
        ),
        actions: [
          ElevatedButton(
            child: Text('OK'),
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
                  return LoadingScreen();
                })),
          ),
          MaterialButton(
              color: Colors.red,
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
        ],
      );

      showDialog(context: context, builder: (context) => alert);


    } else {
      final snackBar = SnackBar(
        duration: const Duration(seconds: 5),
        content: Text("Email atau password salah!",
            style:
            TextStyle(fontWeight: FontWeight.w900, color: Colors.red[900])),
        backgroundColor: Colors.amber,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
  }

  Future<List> _login() async {
    final response = await http.post(
      Uri.parse('http://10.0.0.36/adminpagelaravel/connectflutter/register.php'), // Ganti dengan URL login di backend Anda
      body: {
        'username': username.text,
        'password': password.text,
      },
    );

    var datauser = json.decode(response.body);


    if (datauser == 'success') {
      AlertDialog alert = AlertDialog(
        title: Text("Login Berhasil"),
        content: Container(
          child: Text("Selamat Anda Berhasil login"),
        ),
        actions: [
          ElevatedButton(
            child: Text('OK'),
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
                  return LoadingScreen();
                })),
          ),
          MaterialButton(
              color: Colors.red,
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
        ],
      );

      showDialog(context: context, builder: (context) => alert);
    }

    if (datauser.length==0) {
      setState(() {

        final snackBar = SnackBar(
          duration: const Duration(seconds: 5),
          content: Text("Email atau password salah!",
              style:
              TextStyle(fontWeight: FontWeight.w900, color: Colors.red[900])),
          backgroundColor: Colors.amber,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      });
    } else {
      Fluttertoast.showToast(
          msg: "Login gagal",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


    return datauser;

    // if (response.statusCode == 200) {
    //   AlertDialog alert = AlertDialog(
    //     title: Text("Login Berhasil"),
    //     content: Container(
    //       child: Text("Selamat Anda Berhasil login"),
    //     ),
    //     actions: [
    //       ElevatedButton(
    //         child: Text('OK'),
    //         onPressed: () => Navigator.pushReplacement(context,
    //             MaterialPageRoute(builder: (context) {
    //               return LoadingScreen();
    //             })),
    //       ),
    //       MaterialButton(
    //           color: Colors.red,
    //           onPressed: () => Navigator.of(context).pop(),
    //           child: Text('Cancel',
    //               style: TextStyle(
    //                   color: Colors.white, fontWeight: FontWeight.bold))),
    //     ],
    //   );
    //
    //   showDialog(context: context, builder: (context) => alert);
    // } else {
    //   // Login gagal
    //   // Tampilkan pesan kesalahan kepada pengguna
    //   final responseData = json.decode(response.body);
    //   final errorMessage = responseData['Login gagal , Masukkan email atau password yang valid!'];
    //
    //   showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //       title: Text('Error'),
    //       content: Text(errorMessage),
    //       actions: [
    //         TextButton(
    //           child: Text('OK'),
    //           onPressed: () => Navigator.pop(context),
    //         ),
    //       ],
    //     ),
    //   );
    // }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(8.0),
        color: Colors.red[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset('assets/sosmed/diva_press.png'),
              ),
            ),
            SizedBox(height: 20),

            Text('Selamat datang di Penerbit DIVA PRESS',
                style:
                    GoogleFonts.righteous(fontSize: 22, color: Colors.white)),

            SizedBox(height: 10),

            Text('Silahkan Login!',
                style: GoogleFonts.aclonica(fontSize: 12, color: Colors.white)),

            SizedBox(height: 20),

            TextFormField(
              style: TextStyle(color: Colors.white),
              controller: username,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                prefixIcon:
                    Icon(Icons.person_outline, size: 40, color: Colors.white),
                hintText: 'Masukkan Username',
                hintStyle: TextStyle(color: Colors.white),
                fillColor: Colors.white60,
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),

            SizedBox(height: 20),

            TextFormField(
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return "Masukkan Password!";
              //   }
              //   if (RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])")
              //       .hasMatch(value)) {
              //     return "Please enter a valid passwod!";
              //   }
              //   return null;
              // },
              style: TextStyle(color: Colors.white),
              controller: password,
              obscureText: !_isVisible,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  icon: _isVisible
                      ? Icon(
                          Icons.visibility,
                          color: Colors.white,
                        )
                      : Icon(Icons.visibility_off_rounded,
                          color: Colors.grey),
                ),
                prefixIcon: Icon(Icons.lock_outline_rounded,
                    size: 40, color: Colors.white),
                hintText: 'Masukkan Password',
                hintStyle: TextStyle(color: Colors.white),
                fillColor: Colors.amber,
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),

            SizedBox(height: 10),
            TextButton(
              child: Text("Login sebagai Admin",
                  style:
                      GoogleFonts.aclonica(color: Colors.white, fontSize: 10)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginAdminPage();
                }));
              },
            ),
            SizedBox(height: 10),

            OutlineButton.icon(
              highlightedBorderColor: Colors.orange,
              textColor: Colors.white,
              splashColor: Colors.red[900],
              borderSide: BorderSide(color: Colors.red.shade900),
              onPressed: () {
                login();




                // CoolAlert.show(
                //   context: context,
                //   type: CoolAlertType.success,
                //   title: 'Login Berhasil!',
                //   confirmBtnText: 'OK',
                //   onConfirmBtnTap: () {
                //     CoolAlert.show(
                //       context: context,
                //       type: CoolAlertType.loading,
                //       text: "Loading",
                //     );
                //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                //       return LoadingScreen();
                //     }));
                //   },
                //   cancelBtnText: 'Cancel',
                //   onCancelBtnTap: () => Navigator.pop(context),
                //   text: "Selamat anda berhasil login",
                // );
              },
              icon: Icon(Icons.login),
              label:
                  Text('Login', style: GoogleFonts.aladin(color: Colors.white)),
            ),

            // Card(
            //   color: Colors.white,
            //   elevation: 5,
            //   child: Container(
            //     height: 50,
            //     child: InkWell(
            //       splashColor: Colors.red[900],
            //       onTap: () => saveData(),
            //       child: Center(
            //         child: Text('Login', style: TextStyle(fontSize: 20,color: Colors.red[900]),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            TextButton(
              child: Text("Belum punya akun? Silahkan register!",
                  style: GoogleFonts.aclonica(color: Colors.white)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RegisterPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}

void submit(BuildContext context, String email, String password) {
  if (email.isEmpty || password.isEmpty) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 5),
      content: Text(
        "Email dan password harus diisi",
        style: TextStyle(fontWeight: FontWeight.w900, color: Colors.red[900]),
      ),
      backgroundColor: Colors.amber,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return;
  } else {
    AlertDialog alert = AlertDialog(
      title: Text("Login Berhasil"),
      content: Container(
        child: Text("Selamat Anda Berhasil login"),
      ),
      actions: [
        TextButton(
          child: Text('Ok'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }
}
