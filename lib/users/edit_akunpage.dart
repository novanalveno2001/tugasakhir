import 'dart:html';

import 'package:flutter/material.dart';

class EditAkunPage extends StatelessWidget {
  EditAkunPage({Key? key}) : super(key: key);

  TextEditingController _namaLengkap = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Akun Page'),
        backgroundColor: Colors.red.shade900,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Column(
            children: [
              TextFormField(
                controller: _namaLengkap,
                decoration: const InputDecoration(
                  hintText: 'Masukkan Nama Lengkap',
                  labelText: 'Nama Lengkap',
                  icon: const Icon(Icons.drive_file_rename_outline),
                ),
              ),
              TextFormField(
                controller: _username,
                decoration: InputDecoration(
                  hintText: 'Masukkan Username',
                  labelText: 'Username',
                  icon: Icon(Icons.supervised_user_circle_outlined),
                ),
              ),
              TextFormField(
                controller: _phone,
                decoration: InputDecoration(
                  hintText: 'Masukkan Phone',
                  labelText: 'Phone',
                  icon: Icon(Icons.phone_android_outlined),
                ),
              ),
              TextFormField(
                controller: _email,
                decoration: InputDecoration(
                  hintText: 'Masukkan Email',
                  labelText: 'Email',
                  icon: Icon(Icons.email_rounded),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Update'),
                style: ElevatedButton.styleFrom(primary: Colors.red.shade900),
                onPressed: (){},
              )
            ],
          ),
        ),
      ),
    );
  }
}
