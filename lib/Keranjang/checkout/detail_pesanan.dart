import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugasakhir/mock%20api/datadata.dart';

class DetailPesanan extends StatelessWidget {
  final Users users;

  DetailPesanan({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text('Detail Pesanan',
            style: GoogleFonts.acme(fontWeight: FontWeight.bold)),
      ),
      body: Card(
        elevation: 5,
        shadowColor: Colors.red.shade900,
        child: Column(children: <Widget>[
          Text('DETAIL PESANAN',
              textAlign: TextAlign.justify,
              style: GoogleFonts.acme(fontWeight: FontWeight.bold)),
          Divider(thickness: 4, color: Colors.red.shade900),
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.white12,
          //     borderRadius: BorderRadius.circular(16.0),
          //     boxShadow: [BoxShadow(
          //       color: Colors.black.withOpacity(0.5),
          //       blurRadius: 10,
          //       offset: Offset(1, 1),
          //
          //     )]
          //   ),
          DataTable(
            columns: <DataColumn>[
              DataColumn(label: Expanded(child: Text('PRODUCTS'))),
              DataColumn(label: Expanded(child: Text('TOTAL'))),
              // DataColumn(label: Text('PRODUCTS')),
              // DataColumn(label: Text('TOTAL')),
            ],
            rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Stack(
                      children: <Widget>[
                        Expanded(
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${users.title}',
                                      style: GoogleFonts.content(
                                          fontWeight: FontWeight.bold)),
                                  Divider(thickness: 1),
                                  Text('Subtotal'),
                                  Divider(thickness: 1),
                                  Text('TOTAL'),
                                  Divider(thickness: 1),
                                  Text(
                                    '*Total biaya belum termasuk ongkir.',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.red.shade900),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget> [
                                  TextButton(
                                    onPressed: () {
                                      // ScaffoldMessenger.of(context)
                                      //     .showSnackBar(SnackBar(
                                      //     content: Text(
                                      //         'Pesanan Berhasil di checkout')));

                                      final snackBar =SnackBar(
                                        duration: Duration(seconds: 5),
                                          content: Text('Pesanan Berhasil di Checkout', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red.shade900),
                                          ),
                                        backgroundColor: Colors.amber,
                                      );

                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      return;

                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                        Colors.amber.shade700),
                                    child: Text('CHECKOUT',
                                        style: GoogleFonts.acme(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ),
                                  // MaterialButton(
                                  //     splashColor: Colors.amber,
                                  //     hoverColor: Colors.white12,
                                  //     elevation: 4,
                                  //     color: Colors.red.shade900,
                                  //     onPressed: () {
                                  //
                                  //     }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  DataCell(
                    Stack(
                      children: <Widget>[
                        Wrap(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${users.price}'),
                                Divider(thickness: 1),
                                Text('${users.price}'),
                                Divider(thickness: 1),
                                Text('${users.price}'),
                                Divider(thickness: 1),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]),
        // DataTable(
        //   columns: <DataColumn>[
        //     DataColumn(label: Expanded(child: Text('PRODUCTS'))),
        //     DataColumn(label: Expanded(child: Text('TOTAL'))),
        //     // DataColumn(label: Text('PRODUCTS')),
        //     // DataColumn(label: Text('TOTAL')),
        //   ],
        //   rows: <DataRow>[
        //     DataRow(
        //       cells: <DataCell>[
        //         DataCell(
        //           Row(
        //             children: [
        //               Column(
        //                 children: <Widget>[
        //                   Text('${users.title}'),
        //                   Text('Subtotal'),
        //                   Text('TOTAL'),
        //                   // Text(
        //                   //   '*Total biaya belum termasuk ongkir.',
        //                   //   style: TextStyle(
        //                   //       fontSize: 10,
        //                   //       fontStyle: FontStyle.italic,
        //                   //       color: Colors.red.shade900),
        //                   // ),
        //                   MaterialButton(
        //                     onPressed: () {},
        //                     child: Text(
        //                       'Checkout',
        //                       style: GoogleFonts.acme(
        //                           fontWeight: FontWeight.bold,
        //                           color: Colors.white,
        //                           backgroundColor: Colors.red.shade900),
        //                     ),
        //                     color: Colors.red.shade900,
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //           // Column(
        //           //   children: <Widget>[
        //           //     Text('${users.title}'),
        //           //     Text('Subtotal'),
        //           //     Text('TOTAL',
        //           //         style:
        //           //         TextStyle(fontWeight: FontWeight.bold)),
        //           //     // Container(
        //           //     //   padding: EdgeInsets.all(16.0),
        //           //     //   child: MaterialButton(
        //           //     //     onPressed: () {},
        //           //     //     child: Text(
        //           //     //       'Checkout',
        //           //     //       style: GoogleFonts.acme(
        //           //     //           fontWeight: FontWeight.bold,
        //           //     //           color: Colors.white,
        //           //     //           backgroundColor: Colors.red.shade900),
        //           //     //     ),
        //           //     //     color: Colors.red.shade900,
        //           //     //   ),
        //           //     // ),
        //           //
        //           //     // Expanded(
        //           //     //     child: Container(
        //           //     //       child: MaterialButton(
        //           //     //           onPressed: (){},
        //           //     //         child: Text('Checkout', style: GoogleFonts.acme(fontWeight: FontWeight.bold, color: Colors.white)),
        //           //     //       ),
        //           //     //       color: Colors.red.shade900,
        //           //     //     ),
        //           //     // ),
        //           //   ],
        //           // ),
        //         ),
        //         DataCell(
        //           Column(
        //             children: [
        //               Text('${users.price}'),
        //               Text('${users.price}'),
        //               Text('${users.price}'),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
