AlipayConfigModel AlipayConfigModelFromJson(json) => AlipayConfigModel.fromJson(json);

class AlipayConfigModel {
  String appid;
  String outTradeNo;
  String subject;
  String body;
  String totalAmount;
  String rsaPublicKey;
  String rsaPrivateKey;
  String dataStr;

  AlipayConfigModel(
      {this.appid,
        this.outTradeNo,
        this.subject,
        this.body,
        this.totalAmount,
        this.rsaPublicKey,
        this.rsaPrivateKey,
        this.dataStr});

  AlipayConfigModel.fromJson(Map<String, dynamic> json) {
    appid = json['appid'];
    outTradeNo = json['out_trade_no'];
    subject = json['subject'];
    body = json['body'];
    totalAmount = json['total_amount'];
    rsaPublicKey = json['rsa_public_key'];
    rsaPrivateKey = json['rsa_private_key'];
    dataStr = json['data_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appid'] = this.appid;
    data['out_trade_no'] = this.outTradeNo;
    data['subject'] = this.subject;
    data['body'] = this.body;
    data['total_amount'] = this.totalAmount;
    data['rsa_public_key'] = this.rsaPublicKey;
    data['rsa_private_key'] = this.rsaPrivateKey;
    data['data_str'] = this.dataStr;
    return data;
  }
}