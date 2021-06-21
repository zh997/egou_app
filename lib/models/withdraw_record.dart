WithdrawRecordItemModel WithdrawRecordItemModelFromJson(json) => WithdrawRecordItemModel.fromJson(json);

class WithdrawRecordItemModel {
  int id;
  String sn;
  int userId;
  int cardId;
  String realName;
  String account;
  int type;
  String money;
  String leftMoney;
  String moneyQrCode;
  String poundage;
  String remark;
  int status;
  String createTime;
  Null updateTime;
  Null backCardType;
  Null backType;
  String desc;
  String statusText;

  WithdrawRecordItemModel(
      {this.id,
        this.sn,
        this.userId,
        this.cardId,
        this.realName,
        this.account,
        this.type,
        this.money,
        this.leftMoney,
        this.moneyQrCode,
        this.poundage,
        this.remark,
        this.status,
        this.createTime,
        this.updateTime,
        this.backCardType,
        this.backType,
        this.desc,
        this.statusText});

  WithdrawRecordItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sn = json['sn'];
    userId = json['user_id'];
    cardId = json['card_id'];
    realName = json['real_name'];
    account = json['account'];
    type = json['type'];
    money = json['money'];
    leftMoney = json['left_money'];
    moneyQrCode = json['money_qr_code'];
    poundage = json['poundage'];
    remark = json['remark'];
    status = json['status'];
    createTime = json['create_time'];
    updateTime = json['update_time'];
    backCardType = json['back_card_type'];
    backType = json['back_type'];
    desc = json['desc'];
    statusText = json['status_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sn'] = this.sn;
    data['user_id'] = this.userId;
    data['card_id'] = this.cardId;
    data['real_name'] = this.realName;
    data['account'] = this.account;
    data['type'] = this.type;
    data['money'] = this.money;
    data['left_money'] = this.leftMoney;
    data['money_qr_code'] = this.moneyQrCode;
    data['poundage'] = this.poundage;
    data['remark'] = this.remark;
    data['status'] = this.status;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['back_card_type'] = this.backCardType;
    data['back_type'] = this.backType;
    data['desc'] = this.desc;
    data['status_text'] = this.statusText;
    return data;
  }
}