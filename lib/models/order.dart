import 'goods_detail.dart';

OrderGoodsModel OrderGoodsModelFromJson(json) => OrderGoodsModel.fromJson(json);
OrderBuyModel OrderBuyModelFromJson(json) => OrderBuyModel.fromJson(json);

class OrderGoodsModel {
  int id;
  String image;
  String name;
  int itemId;
  int num;
  String price;

  OrderGoodsModel(
      {this.id, this.image, this.name, this.num, this.price, this.itemId});

  OrderGoodsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    itemId = json['item_id'];
    num = json['num'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['item_id'] = this.itemId;
    data['num'] = this.num;
    data['price'] = this.price;
    return data;
  }
}

class OrderBuyModel {
  String orderId;
  String type;

  OrderBuyModel({this.orderId, this.type});

  OrderBuyModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['type'] = this.type;
    return data;
  }
}

class OrderItemModel {
  String img;
  String name;
  String specValueStr;
  String price;

  OrderItemModel({this.img, this.name, this.specValueStr, this.price});

  OrderItemModel.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    name = json['name'];
    specValueStr = json['specValueStr'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['name'] = this.name;
    data['specValueStr'] = this.specValueStr;
    data['price'] = this.price;
    return data;
  }
}