import 'package:flutter/material.dart';
import 'package:tugasakhir/helper/sql_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class _DataAdmin extends StatefulWidget {
  const _DataAdmin({Key? key}) : super(key: key);

  @override
  _DataAdminState createState() => _DataAdminState();
}

class _DataAdminState extends State<_DataAdmin> {
  TextEditingController judulController = TextEditingController();
  TextEditingController penerbitController = TextEditingController();
  TextEditingController penulisController = TextEditingController();
  TextEditingController tahunController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController descController = TextEditingController();

  List<Map<String, dynamic>> dataadmin = [];

  void refreshData() async {
    final data = await SQLHelper.getDataAdmin();
    setState(() {
      dataadmin = data;
    });
  }

  Future<void> tambahData() async {
    await SQLHelper.tambahDataAdmin(
        judulController.text,
        penerbitController.text,
        penulisController.text,
        tahunController.text,
        hargaController.text,
        descController.text);
    refreshData();
  }

  //form tambah
  void modalForm(int id) async {
    showModalBottomSheet(
        context: context,
        builder: (_) => Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          height: 800,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  controller: judulController,
                  decoration: InputDecoration(
                    hintText: 'Judul',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: penerbitController,
                  decoration: InputDecoration(
                    hintText: 'Penerbit',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: penulisController,
                  decoration: InputDecoration(
                    hintText: 'Penulis',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: tahunController,
                  decoration: InputDecoration(
                    hintText: 'Tahun',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: hargaController,
                  decoration: InputDecoration(
                    hintText: 'harga',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: descController,
                  decoration: InputDecoration(
                    hintText: 'Deskripsi',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await tambahData();
                  },
                  child: Text('Tambah Data'),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}