GiftBagDetailModel GiftBagDetailModelFromJson(json) => GiftBagDetailModel.fromJson(json);

class GiftBagDetailModel {
  int id;
  String name;
  String price;
  String instructions;
  String content;
  String image;
  int type;
  int hasOpen;
  int hasGradations;
  int giftLevel;


  GiftBagDetailModel(
      {this.id,
        this.name,
        this.price,
        this.instructions,
        this.content,
        this.image,
        this.type,
        this.hasOpen,
        this.hasGradations,
        this.giftLevel});

  GiftBagDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    instructions = json['instructions'];
    content = json['content'];
    image = json['image'];
    type = json['type'];
    hasOpen = json['has_open'];
    hasGradations = json['has_gradations'];
    giftLevel = json['gift_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['instructions'] = this.instructions;
    data['content'] = this.content;
    data['image'] = this.image;
    data['type'] = this.type;
    data['has_open'] = this.hasOpen;
    data['has_gradations'] = this.hasGradations;
    data['gift_level'] = this.giftLevel;
    return data;
  }
}