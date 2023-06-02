import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugasakhir/Keranjang/checkout/detail_pesanan.dart';
import 'package:tugasakhir/database/aksesapi.dart';
import 'package:tugasakhir/database/data.dart';
import 'package:tugasakhir/mock%20api/akses%20API.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_field/intl_phone_field.dart';
class DataPesanan extends StatefulWidget {
  DataPesanan({Key? key,}) : super(key: key);


  List<Bookstores> listBooks = [];
  Repositories repositories = Repositories();

  getData() async {
    listBooks = await repositories.getData();
  }

  @override
  void initState() {
    getData();
  }

  @override
  _DataPesananState createState() => _DataPesananState();
}

class _DataPesananState extends State<DataPesanan> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nama_pembeli = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController wa_pembeli = TextEditingController();
  TextEditingController tanggal = TextEditingController();
  TextEditingController buku = TextEditingController();
  TextEditingController harga = TextEditingController();


 Future _simpan() async {
    final response = await http.post(
        Uri.parse('http://10.0.0.36/adminpagelaravel/connectflutter/data_pembelian.php'),
        body: {
          "nama_pembeli": nama_pembeli.text,
          "alamat": alamat.text,
          "wa": wa_pembeli.text,
          "buku": buku.text,
          "harga": harga.text,
          "tanggal": tanggal.text,
        }
        );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text('Data Pesanan',
            style: GoogleFonts.acme(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
            child: Container(
              child: Column(
                children: [
                TextFormField(
                      controller: nama_pembeli,
                      cursorColor: Colors.red.shade900,
                      decoration: new InputDecoration(
                        hintText: 'Masukkan Nama Lengkap',
                        labelText: 'Nama Lengkap',
                        icon: Icon(Icons.people_alt_outlined),
                        iconColor: Colors.red.shade900,
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama harus diisi !';
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: alamat,
                      autofocus: true,
                      decoration: new InputDecoration(
                        hintText: 'Masukkan Alamat',
                        labelText: 'Alamat',
                        icon: Icon(Icons.home_filled),
                        iconColor: Colors.red.shade900,
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Alamat harus diisi !';
                        }
                      },
                    ),
                    SizedBox(height: 20),
                      TextFormField(
                        controller: wa_pembeli,
                        autofocus: true,
                        decoration: new InputDecoration(
                          hintText: 'Masukkan Nomor Telepon(WA)',
                          labelText: 'Nomor HP/WA',
                          icon: Icon(Icons.phone_android_outlined),
                          iconColor: Colors.red.shade900,
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                      ),
                      ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: buku,
                      autofocus: true,
                      decoration: new InputDecoration(
                        hintText: 'Judul Buku yang dibeli',
                        labelText: 'Judul Buku',
                        icon: Icon(Icons.book),
                        iconColor: Colors.red.shade900,
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Judul buku harus diisi !';
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: harga,
                      autofocus: true,
                      decoration: new InputDecoration(
                        hintText: 'Harga Buku',
                        labelText: 'Harga',
                        icon: Icon(Icons.monetization_on),
                        iconColor: Colors.red.shade900,
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Harga buku harus diisi !';
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: tanggal,
                      autofocus: true,
                      decoration: new InputDecoration(
                        hintText: 'Tanggal Pembelian',
                        labelText: 'Tanggal',
                        icon: Icon(Icons.date_range),
                        iconColor: Colors.red.shade900,
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Tanggal harus diisi !';
                        }
                      },
                    ),
                    SizedBox(height: 30),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            _simpan().then((value){
                              if (value) {
                                SnackBar(
                                  content: const Text('Pesanan Berhasil'),
                                );
                              } else {
                                SnackBar(
                                  content: const Text('Pesanan Gagal'),
                                );
                              }
                            });
                          }
                          // Navigator.push(context, MaterialPageRoute(builder: (context){
                          //   return DetailPesanan(users: users);
                          // }));
                        },
                        child: Text('Checkout Pesanan',
                            style: GoogleFonts.acme(
                                fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                      color: Colors.red.shade900,
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.topCenter,
                    ),
                ],
              ),
            )
        ),
        // child: Column(
        //   children: <Widget>[
        //     TextFormField(
        //       key: formKey,
        //       controller: nama_pembeli,
        //       cursorColor: Colors.red.shade900,
        //       decoration: new InputDecoration(
        //         hintText: 'Masukkan Nama Lengkap',
        //         labelText: 'Nama Lengkap',
        //         icon: Icon(Icons.people_alt_outlined),
        //         iconColor: Colors.red.shade900,
        //         border: OutlineInputBorder(
        //           borderRadius: new BorderRadius.circular(5.0),
        //         ),
        //       ),
        //       validator: (value) {
        //         if (value!.isEmpty) {
        //           return 'Nama harus diisi !';
        //         }
        //       },
        //     ),
        //     SizedBox(height: 20),
        //     TextFormField(
        //       key: formKey,
        //       controller: alamat,
        //       autofocus: true,
        //       decoration: new InputDecoration(
        //         hintText: 'Masukkan Alamat',
        //         labelText: 'Alamat',
        //         icon: Icon(Icons.home_filled),
        //         iconColor: Colors.red.shade900,
        //         border: OutlineInputBorder(
        //           borderRadius: new BorderRadius.circular(5.0),
        //         ),
        //       ),
        //       validator: (value) {
        //         if (value!.isEmpty) {
        //           return 'Alamat harus diisi !';
        //         }
        //       },
        //     ),
        //     SizedBox(height: 20),
        //     TextFormField(
        //       key: formKey,
        //       controller: wa_pembeli,
        //       autofocus: true,
        //       decoration: new InputDecoration(
        //         hintText: 'Masukkan Nomor Telepon(WA)',
        //         labelText: 'Nomor HP/WA',
        //         icon: Icon(Icons.phone_android_outlined),
        //         iconColor: Colors.red.shade900,
        //         border: OutlineInputBorder(
        //           borderRadius: new BorderRadius.circular(5.0),
        //         ),
        //       ),
        //       validator: (value) {
        //         if (value!.isEmpty) {
        //           return 'WA harus diisi !';
        //         }
        //       },
        //     ),
        //     SizedBox(height: 20),
        //     TextFormField(
        //       key: formKey,
        //       controller: buku,
        //       autofocus: true,
        //       decoration: new InputDecoration(
        //         hintText: 'Judul Buku yang dibeli',
        //         labelText: 'Judul Buku',
        //         icon: Icon(Icons.book),
        //         iconColor: Colors.red.shade900,
        //         border: OutlineInputBorder(
        //           borderRadius: new BorderRadius.circular(5.0),
        //         ),
        //       ),
        //       validator: (value) {
        //         if (value!.isEmpty) {
        //           return 'Judul buku harus diisi !';
        //         }
        //       },
        //     ),
        //     SizedBox(height: 20),
        //     TextFormField(
        //       key: formKey,
        //       controller: harga,
        //       autofocus: true,
        //       decoration: new InputDecoration(
        //         hintText: 'Harga Buku',
        //         labelText: 'Harga',
        //         icon: Icon(Icons.monetization_on),
        //         iconColor: Colors.red.shade900,
        //         border: OutlineInputBorder(
        //           borderRadius: new BorderRadius.circular(5.0),
        //         ),
        //       ),
        //       validator: (value) {
        //         if (value!.isEmpty) {
        //           return 'Harga buku harus diisi !';
        //         }
        //       },
        //     ),
        //     SizedBox(height: 20),
        //     TextFormField(
        //       key: formKey,
        //       controller: tanggal,
        //       autofocus: true,
        //       decoration: new InputDecoration(
        //         hintText: 'Tanggal Pembelian',
        //         labelText: 'Tanggal',
        //         icon: Icon(Icons.date_range),
        //         iconColor: Colors.red.shade900,
        //         border: OutlineInputBorder(
        //           borderRadius: new BorderRadius.circular(5.0),
        //         ),
        //       ),
        //       validator: (value) {
        //         if (value!.isEmpty) {
        //           return 'Tanggal harus diisi !';
        //         }
        //       },
        //     ),
        //     SizedBox(height: 30),
        //     Container(
        //       child: TextButton(
        //         onPressed: () {
        //           if (formKey.currentState!.validate()) {
        //             _simpan().then((value){
        //               if (value) {
        //                 final snackBar = SnackBar(
        //                   content: const Text('Pesanan Berhasil'),
        //                 );
        //               } else {
        //                 final snackBar = SnackBar(
        //                   content: const Text('Pesanan Gagal'),
        //                 );
        //               }
        //             });
        //           }
        //           // Navigator.push(context, MaterialPageRoute(builder: (context){
        //           //   return DetailPesanan(users: users);
        //           // }));
        //         },
        //         child: Text('Checkout Pesanan',
        //             style: GoogleFonts.acme(
        //                 fontWeight: FontWeight.bold, color: Colors.white)),
        //       ),
        //       color: Colors.red.shade900,
        //       padding: EdgeInsets.all(8),
        //       alignment: Alignment.topCenter,
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

// class BillingDetails extends StatelessWidget {
//   final Bookstore bookstore;
//   List<Bookstore> listBooks = [];
//   Repositories repositories = Repositories();
//
//   BillingDetails({Key? key, required this.bookstore}) : super(key: key);
//
//   getData() async {
//     listBooks = await repositories.getData();
//   }
//
//
//   @override
//   void initState() {
//     getData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red.shade900,
//         title: Text('Billing Details',
//             style: GoogleFonts.acme(fontWeight: FontWeight.bold)),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             TextFormField(
//               cursorColor: Colors.red.shade900,
//               decoration: new InputDecoration(
//                 hintText: 'Masukkan Nama Lengkap',
//                 labelText: 'Nama Lengkap',
//                 icon: Icon(Icons.people_alt_outlined),
//                 iconColor: Colors.red.shade900,
//                 border: OutlineInputBorder(
//                   borderRadius: new BorderRadius.circular(5.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               autofocus: true,
//               decoration: new InputDecoration(
//                 hintText: 'Masukkan Email',
//                 labelText: 'Email',
//                 icon: Icon(Icons.attach_email_outlined),
//                 iconColor: Colors.red.shade900,
//                 border: OutlineInputBorder(
//                   borderRadius: new BorderRadius.circular(5.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               autofocus: true,
//               decoration: new InputDecoration(
//                 hintText: 'Masukkan Nomor Telepon',
//                 labelText: 'No. HP',
//                 icon: Icon(Icons.phone_android_outlined),
//                 iconColor: Colors.red.shade900,
//                 border: OutlineInputBorder(
//                   borderRadius: new BorderRadius.circular(5.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               autofocus: true,
//               decoration: new InputDecoration(
//                 hintText: 'Masukkan Alamat Lengkap...',
//                 labelText: 'Alamat',
//                 icon: Icon(Icons.place),
//                 iconColor: Colors.red.shade900,
//                 border: OutlineInputBorder(
//                   borderRadius: new BorderRadius.circular(5.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               autofocus: true,
//               decoration: new InputDecoration(
//                 hintText: 'Buku yang dipilih',
//                 labelText: 'Buku yang dipilih',
//                 icon: Icon(Icons.book),
//                 iconColor: Colors.red.shade900,
//                 border: OutlineInputBorder(
//                   borderRadius: new BorderRadius.circular(5.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//             Container(
//               child: TextButton(
//                 onPressed: (){
//                   // Navigator.push(context, MaterialPageRoute(builder: (context){
//                   //   return DetailPesanan(users: users);
//                   // }));
//                 },
//                 child: Text('Save Order', style: GoogleFonts.acme(fontWeight: FontWeight.bold, color: Colors.white)),
//               ),
//               color: Colors.red.shade900,
//               padding: EdgeInsets.all(8),
//               alignment: Alignment.topCenter,
//
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
