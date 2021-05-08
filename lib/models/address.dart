AddressListModel AddressListModelFromJson(json) => AddressListModel.fromJson(json);
AddressNameToIdModel AddressNameToIdModelFromJson(json) => AddressNameToIdModel.fromJson(json);

class AddressListModel {
  int id;
  String contact;
  String telephone;
  int provinceId;
  int cityId;
  int districtId;
  String address;
  int isDefault;
  String province;
  String city;
  String district;

  AddressListModel(
      {this.id,
        this.contact,
        this.telephone,
        this.provinceId,
        this.cityId,
        this.districtId,
        this.address,
        this.isDefault,
        this.province,
        this.city,
        this.district});

  AddressListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contact = json['contact'];
    telephone = json['telephone'];
    provinceId = json['province_id'];
    cityId = json['city_id'];
    districtId = json['district_id'];
    address = json['address'];
    isDefault = json['is_default'];
    province = json['province'];
    city = json['city'];
    district = json['district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contact'] = this.contact;
    data['telephone'] = this.telephone;
    data['province_id'] = this.provinceId;
    data['city_id'] = this.cityId;
    data['district_id'] = this.districtId;
    data['address'] = this.address;
    data['is_default'] = this.isDefault;
    data['province'] = this.province;
    data['city'] = this.city;
    data['district'] = this.district;
    return data;
  }
}



class AddressNameToIdModel {
  int province;
  int city;
  int district;

  AddressNameToIdModel({this.province, this.city, this.district});

  AddressNameToIdModel.fromJson(Map<String, dynamic> json) {
    province = json['province'];
    city = json['city'];
    district = json['district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['province'] = this.province;
    data['city'] = this.city;
    data['district'] = this.district;
    return data;
  }
}