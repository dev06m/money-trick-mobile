// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:http/http.dart' show get;
import 'package:flutter/material.dart';
import 'package:money_trick/src/widgets/item_list.dart';

import 'models/item_model.dart';

class App extends StatefulWidget {
  @override
  // ignore: no_logic_in_create_state
  createState() {
    // TODO: implement createState
    return AppState();
  }
}

class AppState extends State<App> {
  int count = 0;
  late ItemModel items = ItemModel();

  fetchImages() async {
    final response = await get(Uri.parse(
        'https://api.shadowpay.com/api/v2/user/items/prices?token=5694e257ec0dc1ca476024eb5f15ded7'));
    var itemModel = ItemModel.fromJson(json.decode(response.body));
    itemModel.data = itemModel.data?.sublist(0, 100);
    setState(() {
      items = itemModel;
      count++;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: fetchImages,
          ),
          body: ItemList(items)
          // Container(
          //   color: Color.fromARGB(31, 4, 0, 190),
          //   child: Center(
          //     child: Text(count.toString()),
          //   ),
          // ),
          ),
    );
  }
}
