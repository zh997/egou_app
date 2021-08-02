ThirdPayModel ThirdPayModelFromJson(json) => ThirdPayModel.fromJson(json);


class ThirdPayModel {
  Data data;
  String url;
  String method;

  ThirdPayModel({this.data, this.url, this.method});

  ThirdPayModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    url = json['url'];
    method = json['method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['url'] = this.url;
    data['method'] = this.method;
    return data;
  }
}

class Data {
  String charset;
  String signType;
  String data;
  String sign;

  Data({this.charset, this.signType, this.data, this.sign});

  Data.fromJson(Map<String, dynamic> json) {
    charset = json['charset'];
    signType = json['signType'];
    data = json['data'];
    sign = json['sign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['charset'] = this.charset;
    data['signType'] = this.signType;
    data['data'] = this.data;
    data['sign'] = this.sign;
    return data;
  }
}