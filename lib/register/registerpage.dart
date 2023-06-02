import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugasakhir/login/loginpage.dart';
import 'package:tugasakhir/users/akunpage.dart';
import 'package:tugasakhir/users/register_user.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String finalnama = '';
  String finalnohp = '';
  String finalemail = '';

  final _namalengkap = new TextEditingController();
  final _nameuser = new TextEditingController();
  final _phone = new TextEditingController();
  final _email = new TextEditingController();
  final _pw = new TextEditingController();

  TextEditingController nama = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  Future register() async {
    var url = 'http://10.0.0.36/adminpagelaravel/connectflutter/login.php';
    var response = await http.post(Uri.parse(url), body: {
      "nama" : nama.text,
      "email" : email.text,
      "phone" : phone.text,
      "username" : username.text,
      "password" : password.text
    });

    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: "Username sudah digunakan!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

    } else {
      Fluttertoast.showToast(
          msg: "Registrasi Berhasil!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  static const String keynamalengkap = 'prefkeyNamaLengkap';
  static const String keyusername = 'prefkeyUsername';
  static const String keyphone = 'prefkeyPhone';
  static const String keyemail= 'prefkeyEmail';


  simpanData() async {
    SharedPreferences pref = SharedPreferences.getInstance() as SharedPreferences;
    pref.setString(keynamalengkap, _namalengkap.text);
    pref.setString(keyusername, _nameuser.text);
    pref.setString(keyphone, _phone.text);
    pref.setString(keyemail, _email.text);

    print('Data Berhasil Disimpan');

  }



  Future getValidationData() async {
    SharedPreferences pref = SharedPreferences.getInstance() as SharedPreferences;
    var dataNama = pref.getString('namalengkap');
    var dataEmail = pref.getString('email');


    setState(() {

      finalnama = dataNama!;
      finalemail = dataEmail!;
    });
  }



  void getNama() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    Map<String, dynamic> jsondata = jsonDecode(pref.getString('myname')!);

    NameUser namaku = NameUser.fromJson(jsondata);

    if (jsondata.isNotEmpty) {
      _namalengkap.value = TextEditingValue(text: namaku.nama);
    }

  }
  void getEmail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    Map<String, dynamic> jsondata = jsonDecode(pref.getString('myname')!);

    NameUser emailku = NameUser.fromJson(jsondata);

    if (jsondata.isNotEmpty) {
      _email.value = TextEditingValue(text: emailku.nama);
    }

  }
  void getPhone() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    Map<String, dynamic> jsondata = jsonDecode(pref.getString('myname')!);

    NameUser phoneku = NameUser.fromJson(jsondata);

    if (jsondata.isNotEmpty) {
      _phone.value = TextEditingValue(text: phoneku.nama);
    }

  }


  void aksesNama() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    NameUser namaku = NameUser(_namalengkap.text);

    String myname = jsonEncode(namaku);
    print(myname);

    await preferences.setString('myname', myname);


  }
  void aksesEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    emailUser emailku = emailUser(_email.text);

    String myemail = jsonEncode(emailku);
    print(myemail);

    await preferences.setString('myemail', myemail);

  }
  void aksesPhone() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    phoneUser phoneku = phoneUser(_namalengkap.text);

    String myphone = jsonEncode(phoneku);
    print(myphone);

    await preferences.setString('myphone', myphone);
  }

  saveRegister() async {
    final localStorage = await SharedPreferences.getInstance();
    localStorage.setString('namalengkap', _namalengkap.text.toString());
    localStorage.setString('nameuser', _nameuser.text.toString());
    localStorage.setString('email', _email.text.toString());
    localStorage.setString('password', _pw.text.toString());
    localStorage.setString('phone', _phone.text.toString());

    String? namalengkap = localStorage.getString('namalengkap');
    String? email = localStorage.getString('email');
    String? password = localStorage.getString('password');

    if (_namalengkap.text == "" && _email.text == "" && _nameuser.text == "" && _pw.text == "" && _phone.text == "") {
      final snackBar = SnackBar(
        duration: const Duration(seconds: 5),
        content: Text("Harap setiap field diisi terlebih dahulu !!!", style: TextStyle(fontWeight: FontWeight.w900, color: Colors.red[900])),
        backgroundColor: Colors.amber,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else if (_namalengkap.text == ""){
      final snackBar = SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(
            "Nama lengkap harus diisi!",
            style: TextStyle(
                fontWeight: FontWeight.w900, color: Colors.red[900])),
        backgroundColor: Colors.amber,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    else if (_email.text == ""){
      final snackBar = SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(
            "Email harus diisi!",
            style: TextStyle(
                fontWeight: FontWeight.w900, color: Colors.red[900])),
        backgroundColor: Colors.amber,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else if (_phone.text == ""){
      final snackBar = SnackBar(
          content: Text(
            'Nomor telpon harus diisi!',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.red[900],
            ),
          ),
        backgroundColor: Colors.amber,
      );
    }
    else if (_nameuser.text == ""){
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
    }else if (_pw.text == ""){
      final snackBar = SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(
            "Password harus diisi!",
            style: TextStyle(
                fontWeight: FontWeight.w900, color: Colors.red[900])),
        backgroundColor: Colors.amber,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    else {
      AlertDialog alert = AlertDialog(
        title: Text("Register Berhasil"),
        content: Container(
          child: Text("Selamat Anda Berhasil mendaftar"),
        ),
        actions: [
          RaisedButton.icon(
              onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  })),
              icon: Icon(Icons.login_sharp),
              label: Text('LOGIN')),
          RaisedButton.icon(
            color: Colors.red.shade900,
            icon: Icon(Icons.cancel),
            label: Text('CANCEL'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );

      showDialog(context: context, builder: (context) => alert);
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => AkunPage())
      // );

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Register', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.red[900],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_outlined,)),
      ),
      body: Container(
        color: Colors.red.shade900,
        child: Column(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                    'assets/sosmed/logolauncher.png'),
              ),
            ),
            SizedBox(height: 10),
            Text('Silahkan Login!',
                style: TextStyle(fontSize: 12, color: Colors.white)),
            SizedBox(height: 20),
            Container(
              child: TextFormField(
                controller: nama,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hoverColor: Colors.amber,
                  hintText: 'Masukkan Nama Lengkap',
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white60,
                  labelText: 'Nama Lengkap',
                  labelStyle: TextStyle(color: Colors.white),
                  icon: Icon(Icons.person_outline),
                  iconColor: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: TextFormField(
                controller: email,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade900),
                  ),
                  hintText: 'Masukkan Email',
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white60,
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  icon: Icon(Icons.attach_email_outlined),
                  iconColor: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: TextFormField(
                controller: phone,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hoverColor: Colors.amber,
                  hintText: 'Masukkan No. HP',
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white60,
                  labelText: 'No. HP',
                  labelStyle: TextStyle(color: Colors.white),
                  icon: Icon(Icons.phone),
                  iconColor: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: TextFormField(
                controller: username,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade900),
                  ),
                  hintText: 'Masukkan Username',
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white60,
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white),
                  icon: Icon(Icons.accessibility_new),
                  iconColor: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: TextFormField(
                controller: password,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade900),
                  ),
                  hintText: 'Masukkan Password',
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.amber,
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  icon: Icon(Icons.password),
                  iconColor: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              padding: EdgeInsets.all(20),
              minWidth: 250,
              child: Text(
                "REGISTER",
                style: TextStyle(
                    color: Colors.red.shade900,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              color: Colors.white,
              onPressed: () {
                register();
                AlertDialog alert = AlertDialog(
                  title: Text("Register Berhasil"),
                  content: Container(
                    child: Text("Selamat Anda Berhasil mendaftar"),
                  ),
                  actions: [
                    RaisedButton.icon(
                        onPressed: () => Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                              return LoginPage();
                            })),
                        icon: Icon(Icons.login_sharp),
                        label: Text('LOGIN')),
                    RaisedButton.icon(
                      color: Colors.red.shade900,
                      icon: Icon(Icons.cancel),
                      label: Text('CANCEL'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                );

                showDialog(context: context, builder: (context) => alert);
                // saveRegister();
                // simpanData();
                // Navigator.push(context, MaterialPageRoute(builder: (context){
                //   return AkunProfil(name: _namalengkap.text, email: _email.text, phone: _phone.text);
                // }));

              },
            ),
            TextButton(
              child: Text("Sudah daftar? Login disini",
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}