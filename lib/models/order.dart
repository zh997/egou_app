import 'goods_detail.dart';

OrderGoodsModel OrderGoodsModelFromJson(json) => OrderGoodsModel.fromJson(json);

class OrderGoodsModel {
  String image;
  String name;
  GoodsSpec goodsSpec;
  int num;
  String price;

  OrderGoodsModel(
      {this.image, this.name, this.goodsSpec, this.num, this.price});

  OrderGoodsModel.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
