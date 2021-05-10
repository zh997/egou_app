UserInfoModel UserInfoModelFromJson(json) => UserInfoModel.fromJson(json);

class UserInfoModel {
  int id;
  String sn;
  String nickname;
  String avatar;
  String level;
  String userMoney;
  int userIntegral;
  String totalOrderAmount;
  String totalRechargeAmount;
  int makerLevel;
  int waitPay;
  int waitDelivery;
  int waitTake;
  int waitComment;
  int afterSale;
  int coupon;
  int noticeNum;
  String nextLevelTips;
  String makerLevelStr;

  UserInfoModel(
      {this.id,
        this.sn,
        this.nickname,
        this.avatar,
        this.level,
        this.userMoney,
        this.userIntegral,
        this.totalOrderAmount,
        this.totalRechargeAmount,
        this.makerLevel,
        this.waitPay,
        this.waitDelivery,
        this.waitTake,
        this.waitComment,
        this.afterSale,
        this.coupon,
        this.noticeNum,
        this.nextLevelTips,
        this.makerLevelStr});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sn = json['sn'];
    nickname = json['nickname'];
    avatar = json['avatar'];
    level = json['level'];
    userMoney = json['user_money'];
    userIntegral = json['user_integral'];
    totalOrderAmount = json['total_order_amount'];
    totalRechargeAmount = json['total_recharge_amount'];
    makerLevel = json['maker_level'];
    waitPay = json['wait_pay'];
    waitDelivery = json['wait_delivery'];
    waitTake = json['wait_take'];
    waitComment = json['wait_comment'];
    afterSale = json['after_sale'];
    coupon = json['coupon'];
    noticeNum = json['notice_num'];
    nextLevelTips = json['next_level_tips'];
    makerLevelStr = json['maker_level_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sn'] = this.sn;
    data['nickname'] = this.nickname;
    data['avatar'] = this.avatar;
    data['level'] = this.level;
    data['user_money'] = this.userMoney;
    data['user_integral'] = this.userIntegral;
    data['total_order_amount'] = this.totalOrderAmount;
    data['total_recharge_amount'] = this.totalRechargeAmount;
    data['maker_level'] = this.makerLevel;
    data['wait_pay'] = this.waitPay;
    data['wait_delivery'] = this.waitDelivery;
    data['wait_take'] = this.waitTake;
    data['wait_comment'] = this.waitComment;
    data['after_sale'] = this.afterSale;
    data['coupon'] = this.coupon;
    data['notice_num'] = this.noticeNum;
    data['next_level_tips'] = this.nextLevelTips;
    data['maker_level_str'] = this.makerLevelStr;
    return data;
  }
}