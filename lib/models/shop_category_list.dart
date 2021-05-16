ShopCategoryListModel ShopCategoryListModelFromJson(json) => ShopCategoryListModel.fromJson(json);

class ShopCategoryListModel {
  int id;
  String name;
  int pid;
  String image;
  int level;
  int type;
  List<Null> sons;

  ShopCategoryListModel(
      {this.id,
        this.name,
        this.pid,
        this.image,
        this.level,
        this.type,
        this.sons});

  ShopCategoryListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pid = json['pid'];
    image = json['image'];
    level = json['level'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['pid'] = this.pid;
    data['image'] = this.image;
    data['level'] = this.level;
    data['type'] = this.type;
    return data;
  }
}
