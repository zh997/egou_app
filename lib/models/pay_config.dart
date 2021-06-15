WxPayConfigModel WxPayConfigModelFromJson(json) => WxPayConfigModel.fromJson(json);

class WxPayConfigModel {
  String appid;
  String partnerid;
  String prepayid;
  String noncestr;
  int timestamp;
  String package;
  String sign;

  WxPayConfigModel(
      {this.appid,
        this.partnerid,
        this.prepayid,
        this.noncestr,
        this.timestamp,
        this.package,
        this.sign});

  WxPayConfigModel.fromJson(Map<String, dynamic> json) {
    appid = json['appid'];
    partnerid = json['partnerid'];
    prepayid = json['prepayid'];
    noncestr = json['noncestr'];
    timestamp = json['timestamp'];
    package = json['package'];
    sign = json['sign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appid'] = this.appid;
    data['partnerid'] = this.partnerid;
    data['prepayid'] = this.prepayid;
    data['noncestr'] = this.noncestr;
    data['timestamp'] = this.timestamp;
    data['package'] = this.package;
    data['sign'] = this.sign;
    return data;
  }
}
