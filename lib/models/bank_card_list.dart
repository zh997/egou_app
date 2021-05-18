BankCardListModel BankCardListModelFromJson(json) => BankCardListModel.fromJson(json);

class BankCardListModel {
  int id;
  int userId;
  int type;
  String cardNumber;
  String backCardType;
  String phone;
  String cardHolder;
  int del;
  String createTime;
  String updateTime;
  int backType;
  String image;

  BankCardListModel(
      {this.id,
        this.userId,
        this.type,
        this.cardNumber,
        this.backCardType,
        this.phone,
        this.cardHolder,
        this.del,
        this.createTime,
        this.updateTime,
        this.backType,
        this.image});

  BankCardListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    cardNumber = json['card_number'];
    backCardType = json['back_card_type'];
    phone = json['phone'];
    cardHolder = json['card_holder'];
    del = json['del'];
    createTime = json['create_time'];
    updateTime = json['update_time'];
    image = json['image'];
    backType = json['back_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['card_number'] = this.cardNumber;
    data['back_card_type'] = this.backCardType;
    data['phone'] = this.phone;
    data['card_holder'] = this.cardHolder;
    data['del'] = this.del;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['image'] = this.image;
    data['back_type'] = this.backType;
    return data;
  }
}