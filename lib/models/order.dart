import 'goods_detail.dart';

OrderGoodsModel OrderGoodsModelFromJson(json) => OrderGoodsModel.fromJson(json);
OrderBuyModel OrderBuyModelFromJson(json) => OrderBuyModel.fromJson(json);

class OrderGoodsModel {
  int id;
  String image;
  String name;
  List<GoodsSpec> goodsSpec;
  String specValueStr;
  String itemId;
  int num;
  String price;

  OrderGoodsModel(
      {this.id, this.image, this.name, this.goodsSpec, this.num, this.price, this.specValueStr, this.itemId});

  OrderGoodsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    if (json['goods_spec'] != null) {
      goodsSpec = new List<GoodsSpec>();
      json['goods_spec'].forEach((v) {
        goodsSpec.add(new GoodsSpec.fromJson(v));
      });
    }
    itemId = json['item_id'];
    specValueStr = json['spec_value_str'];
    num = json['num'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    if (this.goodsSpec != null) {
      data['goods_spec'] = this.goodsSpec.map((v) => v.toJson()).toList();
    }
    data['item_id'] = this.itemId;
    data['spec_value_str'] = this.specValueStr;
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