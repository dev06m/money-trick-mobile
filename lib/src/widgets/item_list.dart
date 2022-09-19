import 'package:flutter/widgets.dart';
import 'package:money_trick/src/models/item_model.dart';

class ItemList extends StatelessWidget {
  late final ItemModel items;

  ItemList(this.items);

  Widget build(context) {
    return ListView.builder(
      itemCount: items.data?.length,
      itemBuilder: (context, int index) {
        return buildItems(items.data?[index], index);
      },
    );
  }

  buildItems(Item? item, int index) {
    return Container(
      // decoration: BoxDecoration(

      // )
      child: Column(
        children: <Widget>[
          Padding(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              // child: Image.network(image.url),
              child: Center(
                child: Text(item == null ? 'price' : item.price.toString()),
              ),
            ),
            padding: EdgeInsets.only(bottom: 8.0),
          ),
          Text(index.toString())
        ],
      ),
    );
  }
}
