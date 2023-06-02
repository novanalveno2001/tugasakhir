import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tugasakhir/Keranjang/models/catalog_model.dart';
import 'package:tugasakhir/Keranjang/models/cart.dart';

class MyCatalog extends StatelessWidget {
  const MyCatalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          const SliverToBoxAdapter(
            child: SizedBox(height: 12),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => _MyListItem(index)),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item});

  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<CartModel, bool>(
          (cart) => cart.items.contains(item),
    );

    return IconButton(
      icon: isInCart
          ? Icon(Icons.check_box_outlined, color: Colors.red.shade900)
          : Icon(Icons.add_shopping_cart),
      onPressed: isInCart
          ? () {
        var cart = context.read<CartModel>();
        cart.remove(item);
      }
          :  () {
        var cart = context.read<CartModel>();
        cart.add(item);
      },
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.red.shade900,
      title:
      Text('Catalog', style: GoogleFonts.acme()),
      floating: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => Navigator.pushNamed(context, '/cart'),
        ),
      ],
    );
  }
}



class _MyListItem extends StatelessWidget {
  final int index;
  _MyListItem(this.index);
  int counter = 0;

  void minus() {
    counter--;
  }

  void tambah() {
    counter++;
  }


  @override
  Widget build(BuildContext context) {
    var item = context.select<CatalogModel, Item>(
          (catalog) => catalog.getByPosition(index),
    );


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(item.image),
            ),
            const SizedBox(width: 24),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Text(item.name, style: GoogleFonts.actor(fontSize: 12, fontWeight: FontWeight.bold)),
                    Text(item.subtitle,style: GoogleFonts.dosis(fontSize: 10)),
                    Text('Rp. ${item.price}', style: GoogleFonts.aclonica(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.red.shade900)),
                  ],
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlineButton(
                  onPressed: minus,
                  child: Icon(Icons.remove_circle_outline_rounded),
                ),
                Text('$counter'),
                OutlineButton(
                  onPressed: tambah,
                  child: Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            const SizedBox(width: 24),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}

