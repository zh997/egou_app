ConcatUsModel ConcatUsModelFromJson(json) => ConcatUsModel.fromJson(json);

class ConcatUsModel {
  String mailbox;
  int phone;
  String address;

  ConcatUsModel({this.mailbox, this.phone, this.address});

  ConcatUsModel.fromJson(Map<String, dynamic> json) {
    mailbox = json['mailbox'];
    phone = json['phone'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mailbox'] = this.mailbox;
    data['phone'] = this.phone;
    data['address'] = this.address;
    return data;
  }
}