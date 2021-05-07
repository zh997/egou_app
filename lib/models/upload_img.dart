UploadImg uploadImgModelFromJson(json) => UploadImg.fromJson(json);

class UploadImg {
  String url;
  String baseUrl;
  String name;

  UploadImg({this.url, this.baseUrl, this.name});

  UploadImg.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    baseUrl = json['base_url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['base_url'] = this.baseUrl;
    data['name'] = this.name;
    return data;
  }
}
