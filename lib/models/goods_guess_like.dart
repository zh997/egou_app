GoodsGuessLikeModel GoodsGuessLikeModelFromJson(json) => GoodsGuessLikeModel.fromJson(json);

class GoodsGuessLikeModel {
  int id;
  String name;
  String image;
  String price;
  String marketPrice;
  int salesSum;
  int virtualSalesSum;
  int salesVolume;

  GoodsGuessLikeModel(
      {this.id,
        this.name,
        this.image,
        this.price,
        this.marketPrice,
        this.salesSum,
        this.virtualSalesSum,
        this.salesVolume});

  GoodsGuessLikeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    marketPrice = json['market_price'];
    salesSum = json['sales_sum'];
    virtualSalesSum = json['virtual_sales_sum'];
    salesVolume = json['sales_volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['market_price'] = this.marketPrice;
    data['sales_sum'] = this.salesSum;
    data['virtual_sales_sum'] = this.virtualSalesSum;
    data['sales_volume'] = this.salesVolume;
    return data;
  }
}