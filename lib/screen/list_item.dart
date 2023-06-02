import 'package:tugasakhir/favorit/favorite_list_models.dart';
import 'package:tugasakhir/favorit/favorite_page_models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListItem extends StatelessWidget {
  final int index;

  const ListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<FavoriteListModel, Item>(
          (favoritelist) => favoritelist.getByPosition(index),
    );
    var textTheme = Theme.of(context).textTheme.headline6;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 60,
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
                  children: [
                    Text(item.name, style: textTheme),
                    Text(item.subtitle,)
                  ],
                )
            ),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInFavoritePage = context.select<FavoritePageModel, bool>(
          (favoritepage) => favoritepage.items.contains(item),
    );

    return IconButton(
      icon: isInFavoritePage
          ? Icon(Icons.favorite, color: Colors.red.shade900)
          : Icon(Icons.favorite_border_rounded),
      onPressed: isInFavoritePage
          ? () {
        var favoritepage = context.read<FavoritePageModel>();
        favoritepage.remove(item);
      }
          :  () {
        var favoritepage = context.read<FavoritePageModel>();
        favoritepage.add(item);
      },
    );
  }
}