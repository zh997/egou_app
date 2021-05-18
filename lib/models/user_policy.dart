UserPolicyModel UserPolicyModelFromJson(json) => UserPolicyModel.fromJson(json);

class UserPolicyModel {
  String service;
  String privacy;
  String afterSale;

  UserPolicyModel({this.service, this.privacy, this.afterSale});

  UserPolicyModel.fromJson(Map<String, dynamic> json) {
    service = json['service'];
    privacy = json['privacy'];
    afterSale = json['after_sale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service'] = this.service;
    data['privacy'] = this.privacy;
    data['after_sale'] = this.afterSale;
    return data;
  }
}