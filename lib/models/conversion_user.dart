ConversionUserModel ConversionUserModelFromJson(json) => ConversionUserModel.fromJson(json);

class ConversionUserModel {
  int conversionRate;
  UserInfo userInfo;

  ConversionUserModel({this.conversionRate, this.userInfo});

  ConversionUserModel.fromJson(Map<String, dynamic> json) {
    conversionRate = json['conversion_rate'];
    userInfo = json['user_info'] != null
        ? new UserInfo.fromJson(json['user_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['conversion_rate'] = this.conversionRate;
    if (this.userInfo != null) {
      data['user_info'] = this.userInfo.toJson();
    }
    return data;
  }
}

class UserInfo {
  int id;
  String gold;
  String userMoney;
  String userIntegral;

  UserInfo({this.id, this.gold, this.userMoney, this.userIntegral});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gold = json['gold'];
    userMoney = json['user_money'];
    userIntegral = json['user_integral'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['gold'] = this.gold;
    data['user_money'] = this.userMoney;
    data['user_integral'] = this.userIntegral;
    return data;
  }
}