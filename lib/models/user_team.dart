UserTeamListModel UserTeamListModelFromJson(json) => UserTeamListModel.fromJson(json);


class UserTeamListModel {
  int firstCount;
  List<UserList> list;
  int page;
  int size;
  int count;
  User user;
  int more;

  UserTeamListModel(
      {this.firstCount,
        this.list,
        this.page,
        this.size,
        this.count,
        this.user,
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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
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
  String userMoney;
  int userIntegral;
  String totalOrderAmount;
  String totalRechargeAmount;
  String account;
  String password;
  String payPassword;
  String salt;
  int firstLeader;
  int secondLeader;
  int thirdLeader;
  int isDistribution;
  int freezeDistribution;
  String distributionH5QrCode;
  String distributionMnpQrCode;
  String distributionAppQrCode;
  String distributionCode;
  String createTime;
  String updateTime;
  int loginTime;
  String loginIp;
  int disable;
  int del;
  int userGrowth;
  int earnings;
  String payPasswrod;
  int makerLevel;
  int activeId;
  String name;
  String rebate;
  int userCount;
  int extensionCount;
  int subId;
  int subLevelCount;
  String levelLogo;
  String dailySalesRebate;
  String monthlySalesRebate;
  String annualSalesRebate;
  String annualSalesQuota;
  int delTime;
  int parentid;
  int sameLevelCount;
  int teamCount;
  int hasGradations;
  String indirectReward;
  String levelName;

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
        this.payPasswrod,
        this.makerLevel,
        this.activeId,
        this.name,
        this.rebate,
        this.userCount,
        this.extensionCount,
        this.subId,
        this.subLevelCount,
        this.levelLogo,
        this.dailySalesRebate,
        this.monthlySalesRebate,
        this.annualSalesRebate,
        this.annualSalesQuota,
        this.delTime,
        this.parentid,
        this.sameLevelCount,
        this.teamCount,
        this.hasGradations,
        this.indirectReward,
        this.levelName});

  UserList.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? json['id'] : 0;
    sn = json['sn'];
    root = json['root'];
    nickname = json['nickname'];
    avatar = json['avatar'];
    mobile = json['mobile'];
    level = json['level'];
    groupId = json['group_id'] != null ? json['group_id'] : 0;
    sex = json['sex'];
    userMoney = json['user_money'];
    userIntegral = json['user_integral'];
    totalOrderAmount = json['total_order_amount'];
    totalRechargeAmount = json['total_recharge_amount'];
    account = json['account'];
    password =  json['password'] !=null ? json['password'] : '';
    payPassword = json['pay_password'] != null ? json['pay_password'] : '';
    salt = json['salt'];
    firstLeader = json['first_leader'];
    secondLeader = json['second_leader'];
    thirdLeader = json['third_leader'];
    isDistribution = json['is_distribution'];
    freezeDistribution = json['freeze_distribution'];
    distributionH5QrCode = json['distribution_h5_qr_code'];
    distributionMnpQrCode = json['distribution_mnp_qr_code'];
    distributionAppQrCode = json['distribution_app_qr_code'];
    distributionCode = json['distribution_code'];
    loginTime = json['login_time'];
    loginIp = json['login_ip'];
    disable = json['disable'];
    del = json['del'];
    userGrowth = json['user_growth'];
    earnings = json['earnings'];
    payPasswrod = json['pay_passwrod'];
    makerLevel = json['maker_level'];
    activeId = json['active_id'] != null ? json['active_id'] : 0;
    name = json['name'] != null ? json['name'] : '';
    userCount = json['user_count'] != null ? json['user_count'] : 0;
    parentid = json['parentid'];
    sameLevelCount = json['same_level_count'];
    teamCount = json['team_count'];
    levelName = json['level_name'];
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
    data['is_distribution'] = this.isDistribution;
    data['freeze_distribution'] = this.freezeDistribution;
    data['distribution_h5_qr_code'] = this.distributionH5QrCode;
    data['distribution_mnp_qr_code'] = this.distributionMnpQrCode;
    data['distribution_app_qr_code'] = this.distributionAppQrCode;
    data['distribution_code'] = this.distributionCode;
    data['login_time'] = this.loginTime;
    data['login_ip'] = this.loginIp;
    data['disable'] = this.disable;
    data['del'] = this.del;
    data['user_growth'] = this.userGrowth;
    data['earnings'] = this.earnings;
    data['pay_passwrod'] = this.payPasswrod;
    data['maker_level'] = this.makerLevel;
    data['active_id'] = this.activeId;
    data['name'] = this.name;
    data['user_count'] = this.userCount;
    data['parentid'] = this.parentid;
    data['same_level_count'] = this.sameLevelCount;
    data['team_count'] = this.teamCount;
    data['level_name'] = this.levelName;
    return data;
  }
}

class User {
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
  String mobile;

  User(
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
        this.mobile,
        this.makerLevelStr});

  User.fromJson(Map<String, dynamic> json) {
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
    mobile = json['mobile'];
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
    data['mobile'] = this.mobile;
    return data;
  }
}
