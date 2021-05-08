HomeBannerModel HomeBannerModelFromJson(json) => HomeBannerModel.fromJson(json);
GoodsListModel GoodsListModelFromJson(json) => GoodsListModel.fromJson(json);
GoodsCategoryModel GoodsCategoryModelFromJson(json) => GoodsCategoryModel.fromJson(json);


class HomeBannerModel {
  String image;
  String link;
  int linkType;
  List params;
  int isTab;

  HomeBannerModel({this.image, this.link, this.linkType, this.params, this.isTab});

  HomeBannerModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    link = json['link'];
    linkType = json['link_type'];
    if (json['params'] != null) {
      params = new List<Params>();
      json['params'].forEach((v) {
        params.add(new Params.fromJson(v));
      });
    }

    isTab = json['is_tab'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['link'] = this.link;
    data['link_type'] = this.linkType;
    if (this.params != null) {
      data['sons'] = this.params.map((v) => v.toJson()).toList();
    }
    data['is_tab'] = this.isTab;
    return data;
  }
}

class GoodsCategoryModel {
  int id;
  String name;
  int type;
  List<Sons> sons;

  GoodsCategoryModel({this.id, this.name, this.type, this.sons});

  GoodsCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    if (json['sons'] != null) {
      sons = new List<Sons>();
      json['sons'].forEach((v) {
        sons.add(new Sons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    if (this.sons != null) {
      data['sons'] = this.sons.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sons {
  int id;
  String name;
  String image;
  int type;

  Sons({this.id, this.name, this.image, this.type});

  Sons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['type'] = this.type;
    return data;
  }
}

class GoodsListModel {
  int id;
  String name;
  String image;
  String price;
  String marketPrice;
  int salesVolume;

  GoodsListModel(
      {this.id, this.name, this.image, this.price, this.marketPrice, this.salesVolume});

  GoodsListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    marketPrice = json['market_price'];
    salesVolume = json['sales_volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['market_price'] = this.marketPrice;
    data['sales_volumn'] = this.salesVolume;
    return data;
  }
}


class Params {
  String id;

  Params({this.id});

  Params.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
