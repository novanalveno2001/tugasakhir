import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugasakhir/admin/Beranda_admin.dart';
import 'package:tugasakhir/home.dart';
import 'package:tugasakhir/register/registerpage.dart';
import 'package:tugasakhir/screen/loading_screen.dart';
import 'package:tugasakhir/users/akunpage.dart';
import 'package:tugasakhir/login/loginpage.dart';

class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white
      ),
      home: LoginPage(),
    );
  }
}



class LoginAdminPage extends StatefulWidget {
  @override
  _LoginAdminPageState createState() => _LoginAdminPageState();
}

class _LoginAdminPageState extends State<LoginAdminPage> {

  final _username = new TextEditingController();
  final _password = new TextEditingController();


  saveData() async {
    final localStorage = await SharedPreferences.getInstance();
    localStorage.setString('username', _username.text.toString());
    localStorage.setString('password', _password.text.toString());

    String? username = localStorage.getString('username');
    String? password = localStorage.getString('password');

    if(_username.text == "" && _password.text == ""){
      final snackBar = SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(
            "Email dan password diisi terlebih dahulu !!!",
            style: TextStyle(
                fontWeight: FontWeight.w900, color: Colors.red[900])),
        backgroundColor: Colors.amber,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else if (_username.text == ""){
      final snackBar = SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(
            "Username harus diisi!",
            style: TextStyle(
                fontWeight: FontWeight.w900, color: Colors.red[900])),
        backgroundColor: Colors.amber,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;


    }
    else if (_password.text == ""){
      final snackBar = SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(
            "Password harus diisi!",
            style: TextStyle(
                fontWeight: FontWeight.w900, color: Colors.red[900])),
        backgroundColor: Colors.amber,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    final snackBar = SnackBar(
      duration: const Duration(seconds: 5),
        content: Text(
            'Login admin berhasil !',
          style: GoogleFonts.allison(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      backgroundColor: Colors.green.shade900,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return;

    // else if (_username.text == "admin" || _password.text == "admin") {
    //   AlertDialog alertDialog = AlertDialog(
    //     title: Text('Login Sebagai Admin Sukses !'),
    //     content: Container(
    //       child: Text('Selamat telah login sebagai Admin'),
    //     ),
    //     actions: [
    //       TextButton(
    //         onPressed: () {
    //           Navigator.push(context, MaterialPageRoute(builder: (context){
    //             return AdminPage();
    //           }));
    //         } ,
    //         child: Text('OK'),
    //       ),
    //       MaterialButton(
    //           color: Colors.red,
    //           onPressed: () => Navigator.of(context).pop(),
    //           child: Text('Cancel',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
    //       ),
    //     ],
    //   );
    //
    //   showDialog(context: context, builder: (context) => alertDialog);
    //   return;
    // }
    // else {
    //
    //   AlertDialog alertDialog = AlertDialog(
    //     title: Text('Login Sebagai Admin Sukses !'),
    //     content: Container(
    //       child: Text('Selamat telah login sebagai Admin'),
    //     ),
    //     actions: [
    //       TextButton(
    //         onPressed: () {
    //           Navigator.push(context, MaterialPageRoute(builder: (context){
    //             return AdminPage();
    //           }));
    //         } ,
    //         child: Text('OK'),
    //       )
    //     ],
    //   );
    //
    //   showDialog(context: context, builder: (context) => alertDialog);
    //   return;
    //
    //
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
          children: <Widget> [
            Container(
              child: Center(
                child: Text('HALAMAN ADMIN', style: GoogleFonts.allerta(fontWeight: FontWeight.bold,color: Colors.white)),
              ),
            ),
            SizedBox(height: 12),
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

            Text('Selamat datang di Penerbit DIVA PRESS', style: GoogleFonts.righteous(fontSize: 22, color: Colors.white)
            ),

            SizedBox(height: 10),

            Text('Silahkan Login!', style: GoogleFonts.aclonica(fontSize: 12, color: Colors.white)
            ),

            SizedBox(height: 20),

            TextFormField(
              style: TextStyle(color: Colors.white),
              controller: _username,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                prefixIcon: Icon(Icons.person_outline, size: 40, color: Colors.white),
                hintText: 'Masukkan Username',
                hintStyle: TextStyle(color: Colors.white),
                fillColor: Colors.white60,
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),

            SizedBox(height: 20),

            TextFormField(
              style: TextStyle(color: Colors.white),
              controller: _password,
              obscureText: true,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                prefixIcon: Icon(Icons.lock_outline_rounded, size: 40, color: Colors.white),
                hintText: 'Masukkan Password',
                hintStyle: TextStyle(color: Colors.white),
                fillColor: Colors.amber,
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),

            SizedBox(height: 10),
            TextButton(
              child:
              Text("Login sebagai User", style: GoogleFonts.aclonica(color: Colors.white, fontSize: 10)
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return LoginPage();
                }));

              },
            ),
            SizedBox(height: 20),

            OutlineButton.icon(
              highlightedBorderColor: Colors.orange,
              textColor: Colors.white,
              splashColor: Colors.red[900],
              borderSide: BorderSide(color: Colors.red.shade900),
              onPressed: () {
                saveData();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return AdminScreen();
                }));
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.loading,
                  text: "Loading",
                );
              },
              icon: Icon(Icons.login_outlined),
              label: Text('Login', style: GoogleFonts.aladin(color: Colors.white)),
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
              child:
              Text("Belum punya akun? Silahkan register!", style: GoogleFonts.aclonica(color: Colors.white)
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
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

// void submit(BuildContext context, String email, String password) {
//   if (email.isEmpty || password.isEmpty) {
//     final snackBar = SnackBar(
//       duration: const Duration(seconds: 5),
//       content: Text("Email dan password harus diisi", style: TextStyle(fontWeight: FontWeight.w900, color: Colors.red[900]),),
//       backgroundColor: Colors.amber,
//     );
//
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     return;
//   }  else {
//     AlertDialog alert = AlertDialog(
//       title: Text("Login Berhasil"),
//       content: Container(
//         child: Text("Selamat Anda Berhasil login"),
//       ),
//       actions: [
//         TextButton(
//           child: Text('Ok'),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ],
//     );
//
//     showDialog(context: context, builder: (context) => alert);
//     return;
//   }
//
//
// }
