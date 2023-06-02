import 'package:flutter/material.dart';
import 'package:tugasakhir/models/item.dart';

class CardItem extends StatelessWidget {
  final Items itemm;

  CardItem(this.itemm);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      color: Colors.red.shade700,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child:Image.asset(
              '${itemm.image}',
              width: 150,
              height: 170,
              fit: BoxFit.cover,
            ) ,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(itemm.nama, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Rp. ${itemm.harga}', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                Text('${itemm.jumlah}', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 30,
                  color: Colors.amber,
                  child: Text(
                    'Lihat Detail',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
