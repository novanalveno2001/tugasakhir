import 'package:flutter/material.dart';
import 'package:tugasakhir/admin/db_helper.dart';
import 'package:tugasakhir/admin/data_buku.dart';

class FormBuku extends StatefulWidget {
  final Buku? buku;

  FormBuku({this.buku});

  @override
  _FormBukuState createState() => _FormBukuState();
}

class _FormBukuState extends State<FormBuku> {
  DbHelper db = DbHelper();

  TextEditingController? gambar;
  TextEditingController? judul;
  TextEditingController? penerbit;
  TextEditingController? penulis;
  TextEditingController? tahun;
  TextEditingController? harga;
  TextEditingController? desc;

  @override
  void initState() {
    gambar = TextEditingController(
        text: widget.buku == null ? '' : widget.buku!.gambar);

    judul = TextEditingController(
        text: widget.buku == null ? '' : widget.buku!.judul);

    penerbit = TextEditingController(
        text: widget.buku == null ? '' : widget.buku!.penerbit);

    penulis = TextEditingController(
        text: widget.buku == null ? '' : widget.buku!.penulis);

    tahun = TextEditingController(
        text: widget.buku == null ? '' : widget.buku!.tahun);

    harga = TextEditingController(
        text: widget.buku == null ? '' : widget.buku!.harga);

    desc = TextEditingController(
        text: widget.buku == null ? '' : widget.buku!.desc);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Tambah Buku'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: gambar,
              decoration: InputDecoration(
                  labelText: 'Gambar',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: judul,
              decoration: InputDecoration(
                  labelText: 'Judul Buku',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: penerbit,
              decoration: InputDecoration(
                  labelText: 'Penerbit',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: penulis,
              decoration: InputDecoration(
                  labelText: 'Penulis',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              controller: tahun,
              decoration: InputDecoration(
                  labelText: 'Tahun Terbit',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              controller: harga,
              decoration: InputDecoration(
                  labelText: 'Harga',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              controller: desc,
              decoration: InputDecoration(
                  labelText: 'Deskripsi',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              child: (widget.buku == null)
                  ? Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    )
                  : Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
              onPressed: () {
                upsertBuku();
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> upsertBuku() async {
    if (widget.buku != null) {
      //update
      await db.updateBuku(Buku(
        id: widget.buku!.id,
        gambar: gambar!.text,
        judul: judul!.text,
        penerbit: penerbit!.text,
        penulis: penulis!.text,
        tahun: tahun!.text,
        harga: harga!.text,
        desc: desc!.text,
      ));

      Navigator.pop(context, 'update');
    } else {
      //insert
      await db.saveBuku(Buku(
        gambar: gambar!.text,
        judul: judul!.text,
        penerbit: penerbit!.text,
        penulis: penulis!.text,
        tahun: tahun!.text,
        harga: harga!.text,
        desc: desc!.text,
      ));
      Navigator.pop(context, 'save');
    }
  }
}
