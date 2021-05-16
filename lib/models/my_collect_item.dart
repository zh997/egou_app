MyCollectItemModel MyCollectItemModelFromJson(json) => MyCollectItemModel.fromJson(json);

class MyCollectItemModel {
  int id;
  String name;
  String image;
  String price;

  MyCollectItemModel({this.id, this.name, this.image, this.price});

  MyCollectItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    return data;
  }
}
