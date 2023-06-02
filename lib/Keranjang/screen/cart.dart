import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tugasakhir/Keranjang/models/cart.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
        backgroundColor: Colors.red.shade900,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(32),
                  child: _CartList(),
                ),
            ),
            const Divider(height: 4, color: Colors.black),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}


class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var cart = context.watch<CartModel>();

    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Image.asset(cart.items[index].image),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle),
          onPressed: () {
            cart.remove(cart.items[index]);
          },
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
          Text(
            cart.items[index].name,
            style: GoogleFonts.andika(fontWeight: FontWeight.bold),
          ),
            Text(cart.items[index].subtitle, style: GoogleFonts.dosis()),
            SizedBox(height: 10),
            Text('Rp. ${cart.items[index].price}', style: GoogleFonts.aclonica(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red.shade900)),
          ],
        ),
        // title: Text(
        //   cart.items[index].name,
        //   style: GoogleFonts.andika(fontWeight: FontWeight.bold),
        // ),
        // subtitle: Text(
        //     cart.items[index].subtitle,
        //     style: GoogleFonts.dosis()
        // ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartModel>(
                builder: (context, cart, child) =>
                    Text(
                        'Rp.${cart.totalPrice}',
                        style: GoogleFonts.aclonica(
                            fontSize: 40,
                            color: Colors.red.shade900,
                            fontWeight: FontWeight.bold
                        ))),
            const SizedBox(width: 24),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Buying not supported yet.')));
              },
              style: TextButton.styleFrom(backgroundColor: Colors.green.shade900),
              child: Text('BUY', style: GoogleFonts.acme(fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}