class ItemModel {
  List<Item>? data;
  String? status;

  ItemModel({this.data, this.status});

  ItemModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Item>[];
      json['data'].forEach((v) {
        data!.add(new Item.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Item {
  String? steamMarketHashName;
  String? price;
  String? volume;

  Item({this.steamMarketHashName, this.price, this.volume});

  Item.fromJson(Map<String, dynamic> json) {
    steamMarketHashName = json['steam_market_hash_name'];
    price = json['price'];
    volume = json['volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['steam_market_hash_name'] = this.steamMarketHashName;
    data['price'] = this.price;
    data['volume'] = this.volume;
    return data;
  }
}
