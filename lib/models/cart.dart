CartListGoodsModel CartListGoodsModelFromJson(json) => CartListGoodsModel.fromJson(json);

class CartListGoodsModel {
  List<Lists> lists;
  double totalAmount;
  int totalNum;

  CartListGoodsModel({this.lists, this.totalAmount, this.totalNum});

  CartListGoodsModel.fromJson(Map<String, dynamic> json) {
    if (json['lists'] != null) {
      lists = new List<Lists>();
      json['lists'].forEach((v) {
        lists.add(new Lists.fromJson(v));
      });
    }
    totalAmount = double.parse(json['total_amount'].toString());
    totalNum = json['total_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lists != null) {
      data['lists'] = this.lists.map((v) => v.toJson()).toList();
    }
    data['total_amount'] = this.totalAmount;
    data['total_num'] = this.totalNum;
    return data;
  }
}

class Lists {
  String name;
  int goodsId;
  int gStatus;
  int gDel;
  String specValueStr;
  String price;
  int goodsNum;
  int selected;
  int cartId;
  int itemId;
  String img;
  int cartStatus;

  Lists(
      {this.name,
        this.goodsId,
        this.gStatus,
        this.gDel,
        this.specValueStr,
        this.price,
        this.goodsNum,
        this.selected,
        this.cartId,
        this.itemId,
        this.img,
        this.cartStatus});

  Lists.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    goodsId = json['goods_id'];
    gStatus = json['g_status'];
    gDel = json['g_del'];
    specValueStr = json['spec_value_str'];
    price = json['price'];
    goodsNum = json['goods_num'];
    selected = json['selected'];
    cartId = json['cart_id'];
    itemId = json['item_id'];
    img = json['img'];
    cartStatus = json['cart_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['goods_id'] = this.goodsId;
    data['g_status'] = this.gStatus;
    data['g_del'] = this.gDel;
    data['spec_value_str'] = this.specValueStr;
    data['price'] = this.price;
    data['goods_num'] = this.goodsNum;
    data['selected'] = this.selected;
    data['cart_id'] = this.cartId;
    data['item_id'] = this.itemId;
    data['img'] = this.img;
    data['cart_status'] = this.cartStatus;
    return data;
  }
}
