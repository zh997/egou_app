class SwiperItemModel {
  String url;
  String color;
  SwiperItemModel(Map<String, dynamic> json) {
    this.url = json['url'];
    this.color = json['color'];
  }
}

class ShopGridListItem {
  String icon;
  String text;
  ShopGridListItem(Map<String, String> json) {
    this.icon = json['icon'];
    this.text = json['text'];
  }
}