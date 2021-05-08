GoodsDetailModel GoodsDetailModelFromJson(json) => GoodsDetailModel.fromJson(json);

class GoodsDetailModel {
  int id;
  String name;
  String image;
  String video;
  String remark;
  String content;
  int salesSum;
  int clickCount;
  String marketPrice;
  int stock;
  int isCollect;
  Activity activity;
  List<Like> like;
  String price;
  List<GoodsSpec> goodsSpec;
  List<GoodsItem> goodsItem;
  List<GoodsImage> goodsImage;

  GoodsDetailModel(
      {this.id,
        this.name,
        this.image,
        this.video,
        this.remark,
        this.content,
        this.salesSum,
        this.clickCount,
        this.marketPrice,
        this.stock,
        this.isCollect,
        this.activity,
        this.like,
        this.price,
        this.goodsSpec,
        this.goodsItem,
        this.goodsImage,});

  GoodsDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    video = json['video'];
    remark = json['remark'];
    content = json['content'];
    salesSum = json['sales_sum'];
    clickCount = json['click_count'];
    marketPrice = json['market_price'];
    stock = json['stock'];
    isCollect = json['is_collect'];
    activity = json['activity'] != null
        ? new Activity.fromJson(json['activity'])
        : null;
    if (json['like'] != null) {
      like = new List<Like>();
      json['like'].forEach((v) {
        like.add(new Like.fromJson(v));
      });
    }
    price = json['price'];
    if (json['goods_spec'] != null) {
      goodsSpec = new List<GoodsSpec>();
      json['goods_spec'].forEach((v) {
        goodsSpec.add(new GoodsSpec.fromJson(v));
      });
    }
    if (json['goods_item'] != null) {
      goodsItem = new List<GoodsItem>();
      json['goods_item'].forEach((v) {
        goodsItem.add(new GoodsItem.fromJson(v));
      });
    }
    if (json['goods_image'] != null) {
      goodsImage = new List<GoodsImage>();
      json['goods_image'].forEach((v) {
        goodsImage.add(new GoodsImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['video'] = this.video;
    data['remark'] = this.remark;
    data['content'] = this.content;
    data['sales_sum'] = this.salesSum;
    data['click_count'] = this.clickCount;
    data['market_price'] = this.marketPrice;
    data['stock'] = this.stock;
    data['is_collect'] = this.isCollect;
    if (this.activity != null) {
      data['activity'] = this.activity.toJson();
    }
    if (this.like != null) {
      data['like'] = this.like.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    if (this.goodsSpec != null) {
      data['goods_spec'] = this.goodsSpec.map((v) => v.toJson()).toList();
    }
    if (this.goodsItem != null) {
      data['goods_item'] = this.goodsItem.map((v) => v.toJson()).toList();
    }
    if (this.goodsImage != null) {
      data['goods_image'] = this.goodsImage.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Activity {
  String type;
  Info info;

  Activity({this.type, this.info});

  Activity.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    return data;
  }
}

class Info {
  int id;
  String startTime;
  String endTime;

  Info({this.id, this.startTime, this.endTime});

  Info.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}

class Like {
  int id;
  String name;
  String image;
  String price;
  String marketPrice;

  Like({this.id, this.name, this.image, this.price, this.marketPrice});

  Like.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    marketPrice = json['market_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['market_price'] = this.marketPrice;
    return data;
  }
}

class GoodsSpec {
  int id;
  int goodsId;
  String name;
  List<SpecValue> specValue;

  GoodsSpec({this.id, this.goodsId, this.name, this.specValue});

  GoodsSpec.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goodsId = json['goods_id'];
    name = json['name'];
    if (json['spec_value'] != null) {
      specValue = new List<SpecValue>();
      json['spec_value'].forEach((v) {
        specValue.add(new SpecValue.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goods_id'] = this.goodsId;
    data['name'] = this.name;
    if (this.specValue != null) {
      data['spec_value'] = this.specValue.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SpecValue {
  int id;
  int goodsId;
  int specId;
  String value;

  SpecValue({this.id, this.goodsId, this.specId, this.value});

  SpecValue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goodsId = json['goods_id'];
    specId = json['spec_id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goods_id'] = this.goodsId;
    data['spec_id'] = this.specId;
    data['value'] = this.value;
    return data;
  }
}

class GoodsItem {
  int id;
  int goodsId;
  String image;
  String specValueIds;
  String specValueStr;
  String marketPrice;
  String price;
  int stock;

  GoodsItem(
      {this.id,
        this.goodsId,
        this.image,
        this.specValueIds,
        this.specValueStr,
        this.marketPrice,
        this.price,
        this.stock});

  GoodsItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goodsId = json['goods_id'];
    image = json['image'];
    specValueIds = json['spec_value_ids'];
    specValueStr = json['spec_value_str'];
    marketPrice = json['market_price'];
    price = json['price'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goods_id'] = this.goodsId;
    data['image'] = this.image;
    data['spec_value_ids'] = this.specValueIds;
    data['spec_value_str'] = this.specValueStr;
    data['market_price'] = this.marketPrice;
    data['price'] = this.price;
    data['stock'] = this.stock;
    return data;
  }
}

class GoodsImage {
  int goodsId;
  String uri;

  GoodsImage({this.goodsId, this.uri});

  GoodsImage.fromJson(Map<String, dynamic> json) {
    goodsId = json['goods_id'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goods_id'] = this.goodsId;
    data['uri'] = this.uri;
    return data;
  }
}