PayResultModel PayResultModelFromJson(json) => PayResultModel.fromJson(json);

class PayResultModel {
  String msg;
  int payStatus;

  PayResultModel({this.msg, this.payStatus});

  PayResultModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    payStatus = json['pay_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['pay_status'] = this.payStatus;
    return data;
  }
}