ShopOrderInfoModel ShopOrderInfoModelFromJson(json) => ShopOrderInfoModel.fromJson(json);

class ShopOrderInfoModel {
  Amount amount;
  Count count;

  ShopOrderInfoModel({this.amount, this.count});

  ShopOrderInfoModel.fromJson(Map<String, dynamic> json) {
    amount =
    json['amount'] != null ? new Amount.fromJson(json['amount']) : null;
    count = json['count'] != null ? new Count.fromJson(json['count']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.amount != null) {
      data['amount'] = this.amount.toJson();
    }
    if (this.count != null) {
      data['count'] = this.count.toJson();
    }
    return data;
  }
}

class Amount {
  String oneDay;
  String yesterday;
  String sevenDay;
  String thirtyDay;
  String all;

  Amount(
      {this.oneDay, this.yesterday, this.sevenDay, this.thirtyDay, this.all});

  Amount.fromJson(Map<String, dynamic> json) {
    oneDay = json['one_day'];
    yesterday = json['yesterday'];
    sevenDay = json['seven_day'];
    thirtyDay = json['thirty_day'];
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['one_day'] = this.oneDay;
    data['yesterday'] = this.yesterday;
    data['seven_day'] = this.sevenDay;
    data['thirty_day'] = this.thirtyDay;
    data['all'] = this.all;
    return data;
  }
}

class Count {
  int oneDay;
  int yesterday;
  int sevenDay;
  int thirtyDay;
  int all;

  Count({this.oneDay, this.yesterday, this.sevenDay, this.thirtyDay, this.all});

  Count.fromJson(Map<String, dynamic> json) {
    oneDay = json['one_day'];
    yesterday = json['yesterday'];
    sevenDay = json['seven_day'];
    thirtyDay = json['thirty_day'];
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['one_day'] = this.oneDay;
    data['yesterday'] = this.yesterday;
    data['seven_day'] = this.sevenDay;
    data['thirty_day'] = this.thirtyDay;
    data['all'] = this.all;
    return data;
  }
}