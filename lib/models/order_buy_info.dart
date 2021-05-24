OrderBuyInfoModel OrderBuyInfoModelFromJson(json) => OrderBuyInfoModel.fromJson(json);

class OrderBuyInfoModel {
  int orderType;
  List<GoodsLists> goodsLists;
  int couponId;
  int totalNum;
  int totalGoodsPrice;
  int totalAmount;
  int orderAmount;
  Address address;
  int discountAmount;
  int shippingPrice;
  String remark;
  int payWay;
  String userMoney;

  OrderBuyInfoModel(
      {this.orderType,
        this.goodsLists,
        this.couponId,
        this.totalNum,
        this.totalGoodsPrice,
        this.totalAmount,
        this.orderAmount,
        this.address,
        this.discountAmount,
        this.shippingPrice,
        this.remark,
        this.payWay,
        this.userMoney});

  OrderBuyInfoModel.fromJson(Map<String, dynamic> json) {
    orderType = json['order_type'];
    if (json['goods_lists'] != null) {
      goodsLists = new List<GoodsLists>();
      json['goods_lists'].forEach((v) {
        goodsLists.add(new GoodsLists.fromJson(v));
      });
    }
    couponId = json['coupon_id'];
    totalNum = json['total_num'];
    totalGoodsPrice = json['total_goods_price'];
    totalAmount = json['total_amount'];
    orderAmount = json['order_amount'];
    address =
    json['address'] != null && json['address'] is Map ? new Address.fromJson(json['address']) : null;
    discountAmount = json['discount_amount'];
    shippingPrice = json['shipping_price'];
    remark = json['remark'];
    payWay = json['pay_way'];
    userMoney = json['user_money'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_type'] = this.orderType;
    if (this.goodsLists != null) {
      data['goods_lists'] = this.goodsLists.map((v) => v.toJson()).toList();
    }
    data['coupon_id'] = this.couponId;
    data['total_num'] = this.totalNum;
    data['total_goods_price'] = this.totalGoodsPrice;
    data['total_amount'] = this.totalAmount;
    data['order_amount'] = this.orderAmount;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['discount_amount'] = this.discountAmount;
    data['shipping_price'] = this.shippingPrice;
    data['remark'] = this.remark;
    data['pay_way'] = this.payWay;
    data['user_money'] = this.userMoney;
    return data;
  }
}

class GoodsLists {
  int itemId;
  int goodsId;
  String goodsName;
  int status;
  int del;
  String image;
  int stock;
  int freeShippingType;
  String freeShipping;
  int freeShippingTemplateId;
  String specImage;
  String specValueStr;
  String specValueIds;
  String goodsPrice;
  String volume;
  String weight;
  int thirdCategoryId;
  int goodsNum;
  String imageStr;
  int discountPrice;

  GoodsLists(
      {this.itemId,
        this.goodsId,
        this.goodsName,
        this.status,
        this.del,
        this.image,
        this.stock,
        this.freeShippingType,
        this.freeShipping,
        this.freeShippingTemplateId,
        this.specImage,
        this.specValueStr,
        this.specValueIds,
        this.goodsPrice,
        this.volume,
        this.weight,
        this.thirdCategoryId,
        this.goodsNum,
        this.imageStr,
        this.discountPrice});

  GoodsLists.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    goodsId = json['goods_id'];
    goodsName = json['goods_name'];
    status = json['status'];
    del = json['del'];
    image = json['image'];
    stock = json['stock'];
    freeShippingType = json['free_shipping_type'];
    freeShipping = json['free_shipping'];
    freeShippingTemplateId = json['free_shipping_template_id'];
    specImage = json['spec_image'];
    specValueStr = json['spec_value_str'];
    specValueIds = json['spec_value_ids'];
    goodsPrice = json['goods_price'];
    volume = json['volume'];
    weight = json['weight'];
    thirdCategoryId = json['third_category_id'];
    goodsNum = json['goods_num'];
    imageStr = json['image_str'];
    discountPrice = json['discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['goods_id'] = this.goodsId;
    data['goods_name'] = this.goodsName;
    data['status'] = this.status;
    data['del'] = this.del;
    data['image'] = this.image;
    data['stock'] = this.stock;
    data['free_shipping_type'] = this.freeShippingType;
    data['free_shipping'] = this.freeShipping;
    data['free_shipping_template_id'] = this.freeShippingTemplateId;
    data['spec_image'] = this.specImage;
    data['spec_value_str'] = this.specValueStr;
    data['spec_value_ids'] = this.specValueIds;
    data['goods_price'] = this.goodsPrice;
    data['volume'] = this.volume;
    data['weight'] = this.weight;
    data['third_category_id'] = this.thirdCategoryId;
    data['goods_num'] = this.goodsNum;
    data['image_str'] = this.imageStr;
    data['discount_price'] = this.discountPrice;
    return data;
  }
}

class Address {
  int id;
  String contact;
  String telephone;
  int provinceId;
  int cityId;
  int districtId;
  String address;
  int isDefault;
  String province;
  String city;
  String district;

  Address(
      {this.id,
        this.contact,
        this.telephone,
        this.provinceId,
        this.cityId,
        this.districtId,
        this.address,
        this.isDefault,
        this.province,
        this.city,
        this.district});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contact = json['contact'];
    telephone = json['telephone'];
    provinceId = json['province_id'];
    cityId = json['city_id'];
    districtId = json['district_id'];
    address = json['address'];
    isDefault = json['is_default'];
    province = json['province'];
    city = json['city'];
    district = json['district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contact'] = this.contact;
    data['telephone'] = this.telephone;
    data['province_id'] = this.provinceId;
    data['city_id'] = this.cityId;
    data['district_id'] = this.districtId;
    data['address'] = this.address;
    data['is_default'] = this.isDefault;
    data['province'] = this.province;
    data['city'] = this.city;
    data['district'] = this.district;
    return data;
  }
}