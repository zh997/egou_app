UserTeamListModel UserTeamListModelFromJson(json) => UserTeamListModel.fromJson(json);


class UserTeamListModel {
  int firstCount;
  List<UserList> list;
  int page;
  int size;
  int count;
  int teamCount;
  User user;
  int mySumPrice;
  int more;

  UserTeamListModel(
      {this.firstCount,
        this.list,
        this.page,
        this.size,
        this.count,
        this.teamCount,
        this.user,
        this.mySumPrice,
        this.more});

  UserTeamListModel.fromJson(Map<String, dynamic> json) {
    firstCount = json['first_count'];
    if (json['list'] != null) {
      list = new List<UserList>();
      json['list'].forEach((v) {
        list.add(new UserList.fromJson(v));
      });
    }
    page = json['page'];
    size = json['size'];
    count = json['count'];
    teamCount = json['team_count'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    mySumPrice = json['my_sum_price'];
    more = json['more'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_count'] = this.firstCount;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['size'] = this.size;
    data['count'] = this.count;
    data['team_count'] = this.teamCount;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['my_sum_price'] = this.mySumPrice;
    data['more'] = this.more;
    return data;
  }
}

class UserList {
  int id;
  String sn;
  int root;
  String nickname;
  String avatar;
  String mobile;
  int level;
  int groupId;
  int sex;
  int birthday;
  String userMoney;
  String userIntegral;
  String totalOrderAmount;
  String totalRechargeAmount;
  String account;
  String password;
  String payPassword;
  String salt;
  int firstLeader;
  int secondLeader;
  int thirdLeader;
  String ancestorRelation;
  int isDistribution;
  int freezeDistribution;
  String distributionH5QrCode;
  String distributionMnpQrCode;
  String distributionAppQrCode;
  Null distributionCode;
  int createTime;
  int updateTime;
  int loginTime;
  String loginIp;
  int disable;
  int del;
  int userGrowth;
  int earnings;
  int makerLevel;
  String gold;
  String levelName;
  String sumPrice;

  UserList(
      {this.id,
        this.sn,
        this.root,
        this.nickname,
        this.avatar,
        this.mobile,
        this.level,
        this.groupId,
        this.sex,
        this.birthday,
        this.userMoney,
        this.userIntegral,
        this.totalOrderAmount,
        this.totalRechargeAmount,
        this.account,
        this.password,
        this.payPassword,
        this.salt,
        this.firstLeader,
        this.secondLeader,
        this.thirdLeader,
        this.ancestorRelation,
        this.isDistribution,
        this.freezeDistribution,
        this.distributionH5QrCode,
        this.distributionMnpQrCode,
        this.distributionAppQrCode,
        this.distributionCode,
        this.createTime,
        this.updateTime,
        this.loginTime,
        this.loginIp,
        this.disable,
        this.del,
        this.userGrowth,
        this.earnings,
        this.makerLevel,
        this.gold,
        this.levelName,
        this.sumPrice});

  UserList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sn = json['sn'];
    root = json['root'];
    nickname = json['nickname'];
    avatar = json['avatar'];
    mobile = json['mobile'];
    level = json['level'];
    groupId = json['group_id'];
    sex = json['sex'];
    birthday = json['birthday'];
    userMoney = json['user_money'];
    userIntegral = json['user_integral'];
    totalOrderAmount = json['total_order_amount'];
    totalRechargeAmount = json['total_recharge_amount'];
    account = json['account'];
    password = json['password'];
    payPassword = json['pay_password'];
    salt = json['salt'];
    firstLeader = json['first_leader'];
    secondLeader = json['second_leader'];
    thirdLeader = json['third_leader'];
    ancestorRelation = json['ancestor_relation'];
    isDistribution = json['is_distribution'];
    freezeDistribution = json['freeze_distribution'];
    distributionH5QrCode = json['distribution_h5_qr_code'];
    distributionMnpQrCode = json['distribution_mnp_qr_code'];
    distributionAppQrCode = json['distribution_app_qr_code'];
    distributionCode = json['distribution_code'];
    createTime = json['create_time'];
    updateTime = json['update_time'];
    loginTime = json['login_time'];
    loginIp = json['login_ip'];
    disable = json['disable'];
    del = json['del'];
    userGrowth = json['user_growth'];
    earnings = json['earnings'];
    makerLevel = json['maker_level'];
    gold = json['gold'];
    levelName = json['level_name'];
    sumPrice = json['sum_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sn'] = this.sn;
    data['root'] = this.root;
    data['nickname'] = this.nickname;
    data['avatar'] = this.avatar;
    data['mobile'] = this.mobile;
    data['level'] = this.level;
    data['group_id'] = this.groupId;
    data['sex'] = this.sex;
    data['birthday'] = this.birthday;
    data['user_money'] = this.userMoney;
    data['user_integral'] = this.userIntegral;
    data['total_order_amount'] = this.totalOrderAmount;
    data['total_recharge_amount'] = this.totalRechargeAmount;
    data['account'] = this.account;
    data['password'] = this.password;
    data['pay_password'] = this.payPassword;
    data['salt'] = this.salt;
    data['first_leader'] = this.firstLeader;
    data['second_leader'] = this.secondLeader;
    data['third_leader'] = this.thirdLeader;
    data['ancestor_relation'] = this.ancestorRelation;
    data['is_distribution'] = this.isDistribution;
    data['freeze_distribution'] = this.freezeDistribution;
    data['distribution_h5_qr_code'] = this.distributionH5QrCode;
    data['distribution_mnp_qr_code'] = this.distributionMnpQrCode;
    data['distribution_app_qr_code'] = this.distributionAppQrCode;
    data['distribution_code'] = this.distributionCode;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['login_time'] = this.loginTime;
    data['login_ip'] = this.loginIp;
    data['disable'] = this.disable;
    data['del'] = this.del;
    data['user_growth'] = this.userGrowth;
    data['earnings'] = this.earnings;
    data['maker_level'] = this.makerLevel;
    data['gold'] = this.gold;
    data['level_name'] = this.levelName;
    data['sum_price'] = this.sumPrice;
    return data;
  }
}

class User {
  int id;
  String sn;
  String nickname;
  String avatar;
  String mobile;
  String level;
  String userMoney;
  String userIntegral;
  String totalOrderAmount;
  String totalRechargeAmount;
  int makerLevel;
  String gold;
  int waitPay;
  int waitDelivery;
  int waitTake;
  int waitComment;
  int afterSale;
  int coupon;
  int noticeNum;
  String nextLevelTips;
  String makerLevelStr;

  User(
      {this.id,
        this.sn,
        this.nickname,
        this.avatar,
        this.mobile,
        this.level,
        this.userMoney,
        this.userIntegral,
        this.totalOrderAmount,
        this.totalRechargeAmount,
        this.makerLevel,
        this.gold,
        this.waitPay,
        this.waitDelivery,
        this.waitTake,
        this.waitComment,
        this.afterSale,
        this.coupon,
        this.noticeNum,
        this.nextLevelTips,
        this.makerLevelStr});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sn = json['sn'];
    nickname = json['nickname'];
    avatar = json['avatar'];
    mobile = json['mobile'];
    level = json['level'];
    userMoney = json['user_money'];
    userIntegral = json['user_integral'];
    totalOrderAmount = json['total_order_amount'];
    totalRechargeAmount = json['total_recharge_amount'];
    makerLevel = json['maker_level'];
    gold = json['gold'];
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
    data['mobile'] = this.mobile;
    data['level'] = this.level;
    data['user_money'] = this.userMoney;
    data['user_integral'] = this.userIntegral;
    data['total_order_amount'] = this.totalOrderAmount;
    data['total_recharge_amount'] = this.totalRechargeAmount;
    data['maker_level'] = this.makerLevel;
    data['gold'] = this.gold;
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
