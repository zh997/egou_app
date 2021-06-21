ConversionRecordItemModel ConversionRecordItemModelFromJson(json) => ConversionRecordItemModel.fromJson(json);

class ConversionRecordItemModel {
  int id;
  String changeAmount;
  String sourceType;
  int changeType;
  String createTime;
  String remark;
  String charges;
  int sourceId;
  String sourceSn;

  ConversionRecordItemModel(
      {this.id,
        this.changeAmount,
        this.sourceType,
        this.changeType,
        this.createTime,
        this.remark,
        this.charges,
        this.sourceId,
        this.sourceSn});

  ConversionRecordItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    changeAmount = json['change_amount'];
    sourceType = json['source_type'];
    changeType = json['change_type'];
    createTime = json['create_time'];
    remark = json['remark'];
    charges = json['charges'];
    sourceId = json['source_id'];
    sourceSn = json['source_sn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['change_amount'] = this.changeAmount;
    data['source_type'] = this.sourceType;
    data['change_type'] = this.changeType;
    data['create_time'] = this.createTime;
    data['remark'] = this.remark;
    data['charges'] = this.charges;
    data['source_id'] = this.sourceId;
    data['source_sn'] = this.sourceSn;
    return data;
  }
}