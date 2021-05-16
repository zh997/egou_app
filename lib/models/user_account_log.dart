UserAccountLogListModel UserAccountLogListModelFromJson(json) => UserAccountLogListModel.fromJson(json);

class UserAccountLogListModel {
  int id;
  String changeAmount;
  String sourceType;
  int changeType;
  String createTime;

  UserAccountLogListModel(
      {this.id,
        this.changeAmount,
        this.sourceType,
        this.changeType,
        this.createTime});

  UserAccountLogListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    changeAmount = json['change_amount'];
    sourceType = json['source_type'];
    changeType = json['change_type'];
    createTime = json['create_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['change_amount'] = this.changeAmount;
    data['source_type'] = this.sourceType;
    data['change_type'] = this.changeType;
    data['create_time'] = this.createTime;
    return data;
  }
}
