import 'package:flutter/material.dart';
import 'package:tugasakhir/detail.dart';
import 'package:tugasakhir/models/item.dart';
import 'package:tugasakhir/widgets/card_item.dart';

class DetailKeranjangPage extends StatelessWidget {
  const DetailKeranjangPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int total = 0;
    for(var i = 0; i < item.length; i++){
      total += item[i].harga * item[i].jumlah;

    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keranjang Belanja',
        ),
        backgroundColor: Colors.red.shade900,
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.red.shade900,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'TOTAL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'RP. $total',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
          children: item
              .map((itemm) => InkWell(
                    onTap: () async {
                      var result = await Navigator.of(context).pushNamed(
                        '/lihatdetail', arguments: {
                          'item': itemm
                      }
                      );
                      _handleNavResult(result, itemm);
                    },
                    child: CardItem(Items(
                        id: itemm.id,
                        nama: itemm.nama,
                        harga: itemm.harga,
                        jumlah: itemm.jumlah,
                        deks: itemm.deks,
                        image: itemm.image)),
                  ))
              .toList()),
    );
  }

  void _handleNavResult(Object? result, Items item){
    if(result != null){
      var resultMap = result as Map<String, Object>;
      if (resultMap.containsKey('jumlah')){
        var jumlah = resultMap['jumlah'];
        if (jumlah is int) {
          int _jumlah = jumlah;
            item = Items(
                id: item.id,
                nama: item.nama,
                harga: item.harga,
                jumlah: item.jumlah,
                deks: item.deks,
                image: item.image);
        }
      }
    }
  }
}

