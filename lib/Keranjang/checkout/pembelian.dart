import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugasakhir/Keranjang/checkout/billing_details.dart';
import 'package:tugasakhir/mock%20api/akses%20API.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';


class Beli extends StatelessWidget {
  final Users users;
  List<Users> listUsers = [];
  Repository repository = Repository();

  Beli({Key? key, required this.users}) : super(key: key);

  getData() async {
    listUsers = await repository.getData();
  }

  int counter = 0;

  void minus() {
      counter--;

  }

  void tambah() {
      counter++;
  }

  totalHarga() {
    return int.parse(users.price) * counter;
  }
  

  @override
  void initState() {
    getData();
    totalHarga();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade900,
          title: Text('Beli Sekarang'),
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: <DataColumn>[
                  DataColumn(label: Expanded(child: Text('Id'))),
                  DataColumn(label: Expanded(child: Text('Item'))),
                  DataColumn(label: Expanded(child: Text('Nama Produk'))),
                  DataColumn(label: Expanded(child: Text('Harga'))),
                  DataColumn(label: Expanded(child: Text('QTY'))),
                  DataColumn(label: Expanded(child: Text('Subtotal'))),
                  DataColumn(label: Expanded(child: Text('Opsi'))),
                  // DataColumn(label: (Text('Id'))),
                  // DataColumn(label: (Text('Item'))),
                  // DataColumn(label: (Text('Nama Produk'))),
                  // DataColumn(label: (Text('Harga'))),
                  // DataColumn(label: (Text('QTY'))),
                  // DataColumn(label: Text('Subtotal')),
                  // DataColumn(label: (Text('Opsi'))),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('${users.id}')),
                      DataCell(Image.network('${users.image}',
                          fit: BoxFit.contain, width: 25)),
                      DataCell(Text(
                        '${users.title}',
                        style: GoogleFonts.asap(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo),
                      )),
                      DataCell(Text('${users.price}',
                          style: GoogleFonts.cambo(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 10))),
                      DataCell(QtyBarang()),
                      DataCell(Text('${users.price}')),
                      DataCell(IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete_sharp,
                            color: Colors.red, size: 14),
                      ))
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 4, color: Colors.black),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    _launchURL('https://api.whatsapp.com/send?phone=6281336102515');
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.green.shade700),
                  child: Text('Checkout WA',
                      style: GoogleFonts.acme(color: Colors.white)),
                ),
                SizedBox(width: 20),
                TextButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context){
                    //   return BillingDetails(users: users);
                    // }));
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.amber),
                  child: Text('Checkout',
                      style: GoogleFonts.acme(color: Colors.white)),
                ),
              ],
            ),
          ],
        )
        // SingleChildScrollView(
        //   scrollDirection: Axis.vertical,
        //   child: DataTable(
        //       columns: <DataColumn> [
        //         DataColumn(label: (Text('Id'))),
        //         DataColumn(label: (Text('Item'))),
        //         DataColumn(label: (Text('Nama Produk'))),
        //         DataColumn(label: (Text('Harga'))),
        //         DataColumn(label: (Text('Opsi'))),
        //       ],
        //       rows: <DataRow> [
        //         DataRow(
        //           cells: <DataCell>[
        //             DataCell(Text('${users.id}')),
        //             DataCell(Image.network('${users.image}',fit: BoxFit.contain,width: 25)),
        //             DataCell(Text('${users.title}',style: GoogleFonts.asap(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.indigo),)),
        //             DataCell(Text('${users.price}',style: GoogleFonts.cambo(fontWeight: FontWeight.bold, color: Colors.red,fontSize: 10))),
        //             DataCell(
        //                 IconButton(
        //                   onPressed: () {} ,
        //                   icon: Icon(Icons.delete),
        //                 )
        //             )
        //         ],
        //         ),
        //       ],
        //   ),
        // ),
        );
  }
}

class QtyBarang extends StatefulWidget {
  const QtyBarang({Key? key}) : super(key: key);

  @override
  _QtyBarangState createState() => _QtyBarangState();
}

class _QtyBarangState extends State<QtyBarang> {
  int counter = 0;

  void minus() {
    setState(() {
      counter--;
    });
  }

  void tambah() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: minus,
          icon: Icon(Icons.remove_circle, color: Colors.red.shade900, size: 12),
        ),
        Text('${counter}'),
        IconButton(
          onPressed: tambah,
          icon: Icon(Icons.add_circle, color: Colors.green.shade700, size: 12),
        ),
      ],
    );
  }
}

// class TotalHarga extends StatefulWidget {
//   const TotalHarga({Key? key}) : super(key: key);
//
//   @override
//   _TotalHargaState createState() => _TotalHargaState();
// }
//
// class _TotalHargaState extends State<TotalHarga> {
//   int counter = 0;
//
//   void minus() {
//     setState(() {
//       counter--;
//     });
//   }
//
//   void tambah() {
//     setState(() {
//       counter++;
//     });
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }




class Controller extends GetxController {
  final Users users;
  List<Users> listUsers = [];
  Repository repository = Repository();

  getData() async {
    listUsers = await repository.getData();
  }


  var barang = 0.obs;

  Controller(this.users);

  tambahBarang() {
    return barang.value++;
  }

  removeBarang() {
    if(barang.value > 0){
      return barang.value--;
    }
  }

  sumTotal() {
    return barang.value * int.parse(users.price);

  }

}


_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}