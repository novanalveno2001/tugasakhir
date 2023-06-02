import 'package:flutter/material.dart';
import 'package:tugasakhir/admin/form_buku.dart';
import 'package:tugasakhir/admin/db_helper.dart';
import 'package:tugasakhir/admin/data_buku.dart';

class ListBukuPage extends StatefulWidget {
  const ListBukuPage({ Key? key }) : super(key: key);

  @override
  _ListBukuPageState createState() => _ListBukuPageState();
}

class _ListBukuPageState extends State<ListBukuPage> {
  List<Buku> listbuku = [];
  DbHelper db = DbHelper();

  @override
  void initState() {
    //menjalankan fungsi getallkontak saat pertama kali dimuat
    _getAllBuku();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Center(
          child: Text("Admin Page"),
        ),
      ),
      body: ListView.builder(
          itemCount: listbuku.length,
          itemBuilder: (context, index) {
            Buku buku = listbuku[index];
            return Padding(
              padding: EdgeInsets.only(
                  top: 20
              ),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  size: 10,
                ),
                title: Text(
                    '${buku.judul}'
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 4,
                      ),
                      child: Text("${buku.penerbit}"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("${buku.penulis}"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("${buku.tahun}"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("${buku.harga}"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("${buku.desc}"),
                    ),
                  ],
                ),
                trailing:
                FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: [
                      // button edit
                      IconButton(
                          onPressed: () {
                            _openFormEdit(buku);
                          },
                          icon: Icon(Icons.edit)
                      ),
                      // button hapus
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: (){
                          //membuat dialog konfirmasi hapus
                          AlertDialog hapus = AlertDialog(
                            title: Text("Information"),
                            content: Container(
                              height: 100,
                              child: Column(
                                children: [
                                  Text(
                                      "Yakin ingin Menghapus Data ${buku.judul}"
                                  )
                                ],
                              ),
                            ),
                            //terdapat 2 button.
                            //jika ya maka jalankan _deleteKontak() dan tutup dialog
                            //jika tidak maka tutup dialog
                            actions: [
                              TextButton(
                                  onPressed: (){
                                    _deleteBuku(buku, index);
                                    Navigator.pop(context);
                                  },
                                  child: Text("Ya")
                              ),
                              TextButton(
                                child: Text('Tidak'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                          showDialog(context: context, builder: (context) => hapus);
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
      //membuat button mengapung di bagian bawah kanan layar
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _openFormCreate();
        },
      ),

    );
  }

  //mengambil semua data Kontak
  Future<void> _getAllBuku() async {
    //list menampung data dari database
    var list = await db.getAllBuku();

    //ada perubahanan state
    setState(() {
      //hapus data pada listKontak
      listbuku.clear();

      //lakukan perulangan pada variabel list
      list!.forEach((buku) {

        //masukan data ke listKontak
        listbuku.add(Buku.fromMap(buku));
      });
    });
  }

  //menghapus data Kontak
  Future<void> _deleteBuku(Buku buku, int position) async {
    await db.deleteBuku(buku.id!);
    setState(() {
      listbuku.removeAt(position);
    });
  }

  // membuka halaman tambah Kontak
  Future<void> _openFormCreate() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => FormBuku()));
    if (result == 'save') {
      await _getAllBuku();
    }
  }

  //membuka halaman edit Kontak
  Future<void> _openFormEdit(Buku buku) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => FormBuku(buku: buku)));
    if (result == 'update') {
      await _getAllBuku();
    }
  }
}