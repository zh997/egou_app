SharePosterModel SharePosterModelFromJson(json) => SharePosterModel.fromJson(json);

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


class SharePosterModel {
  String url;

  SharePosterModel({this.url});

  SharePosterModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
