import 'package:flutter/material.dart';
import 'package:tugasakhir/models/item.dart';

class LihatDetailKeranjang extends StatefulWidget {
  const LihatDetailKeranjang({Key? key}) : super(key: key);

  @override
  _LihatDetailKeranjangState createState() => _LihatDetailKeranjangState();
}

class _LihatDetailKeranjangState extends State<LihatDetailKeranjang> {
  Items? _item;
  int _counter = 0;


  void plusState() {
    setState(() {
      _counter++;
    });
  }

  void minState() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    if (args.containsKey(_item)) {
      var item = args[_item];
      if (item is Items) {
        _item = item;
        if (_counter < 0) {
          _counter = _item?.jumlah ?? 0;
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text('Detail Barang'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              child: Image.asset(
                '${_item?.image}',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(_item?.nama ?? 'ERROR',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Text('Rp.${_item?.harga ?? 'XXXXX'}',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
                Text(_item?.deks ?? 'ERROR DESC!',
                    style: TextStyle(color: Colors.black87, fontSize: 16)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: minState,
                  icon: Icon(Icons.remove_circle_outline_rounded)),
              Text('$_counter',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              IconButton(
                  onPressed: plusState, icon: Icon(Icons.add_circle_outlined)),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red.shade900,
              fixedSize: Size(100, 30),
            ),
            child: Text('Checkout'),
            onPressed: () {
              Navigator.of(context).pop({
                '_jumlah': _counter,
              });
            },
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
