OrderPayWayModel OrderPayWayModelFromJson(json) => OrderPayWayModel.fromJson(json);

class OrderPayWayModel {
  List<Pay> pay;

  OrderPayWayModel({this.pay});

  OrderPayWayModel.fromJson(Map<String, dynamic> json) {
    if (json['pay'] != null) {
      pay = new List<Pay>();
      json['pay'].forEach((v) {
        pay.add(new Pay.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pay != null) {
      data['pay'] = this.pay.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pay {
  int payWay;
  String name;
  String key;
  String money;

  Pay({this.payWay, this.name, this.key, this.money});

  Pay.fromJson(Map<String, dynamic> json) {
    payWay = json['pay_way'];
    name = json['name'];
    key = json['key'];
    money = json['money'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pay_way'] = this.payWay;
    data['name'] = this.name;
    data['key'] = this.key;
    data['money'] = this.money;
    return data;
  }
}