import 'goods_detail.dart';

OrderGoodsModel OrderGoodsModelFromJson(json) => OrderGoodsModel.fromJson(json);
OrderBuyModel OrderBuyModelFromJson(json) => OrderBuyModel.fromJson(json);

class OrderGoodsModel {
  int id;
  String image;
  String name;
  GoodsSpec goodsSpec;
  int num;
  String price;

  OrderGoodsModel(
      {this.image, this.name, this.goodsSpec, this.num, this.price, this.id});

  OrderGoodsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    goodsSpec = json['goods_spec'] != null
        ? new GoodsSpec.fromJson(json['goods_spec'])
        : null;
    num = json['num'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    if (this.goodsSpec != null) {
      data['goods_spec'] = this.goodsSpec.toJson();
    }
    data['num'] = this.num;
    data['price'] = this.price;
    data['id'] = this.id;
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
