
SmsLogin smsLoginModelFromJson(json) => SmsLogin.fromJson(json);

class SmsLogin {
  int id;
  String nickname;
  String avatar;
  int level;
  int disable;
  String distributionCode;
  String token;

  SmsLogin(
      {this.id,
        this.nickname,
        this.avatar,
        this.level,
        this.disable,
        this.distributionCode,
        this.token});

  SmsLogin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickname = json['nickname'];
    avatar = json['avatar'];
    level = json['level'];
    disable = json['disable'];
    distributionCode = json['distribution_code'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nickname'] = this.nickname;
    data['avatar'] = this.avatar;
    data['level'] = this.level;
    data['disable'] = this.disable;
    data['distribution_code'] = this.distributionCode;
    data['token'] = this.token;
    return data;
  }
}
