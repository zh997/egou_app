ShopInfoModel ShopInfoModelFromJson(json) => ShopInfoModel.fromJson(json);
ShopCodeModel ShopCodeModelFromJson(json) => ShopCodeModel.fromJson(json);


class ShopCodeModel {
  String url;

  ShopCodeModel({this.url});

  ShopCodeModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

class ShopInfoModel {
  int id;
  String name;
  int userId;
  String address;
  String phone;
  int longitude;
  int latitude;
  int collectionType;
  dynamic collectionNumber;
  String businessContent;
  int auditStatus;
  String shopPhoto;
  String otherImg;
  int adminId;
  String createTime;
  String updateTime;
  String auditTime;
  dynamic type;
  String reasons;
  int categoryId;
  int del;
  dynamic delTime;
  List<String> shopPhotoArr;
  int proportion;

  ShopInfoModel(
      {this.id,
        this.name,
        this.userId,
        this.address,
        this.phone,
        this.longitude,
        this.latitude,
        this.collectionType,
        this.collectionNumber,
        this.businessContent,
        this.auditStatus,
        this.shopPhoto,
        this.otherImg,
        this.adminId,
        this.createTime,
        this.updateTime,
        this.auditTime,
        this.type,
        this.reasons,
        this.categoryId,
        this.del,
        this.delTime,
        this.shopPhotoArr,
        this.proportion});

  ShopInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['user_id'];
    address = json['address'];
    phone = json['phone'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    collectionType = json['collection_type'];
    collectionNumber = json['collection_number'];
    businessContent = json['business_content'];
    auditStatus = json['audit_status'];
    shopPhoto = json['shop_photo'];
    otherImg = json['other_img'];
    adminId = json['admin_id'];
    createTime = json['create_time'];
    updateTime = json['update_time'];
    auditTime = json['audit_time'];
    type = json['type'];
    reasons = json['reasons'];
    categoryId = json['category_id'];
    del = json['del'];
    delTime = json['del_time'];
    shopPhotoArr = json['shop_photo_arr'].cast<String>();
    proportion = json['proportion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['collection_type'] = this.collectionType;
    data['collection_number'] = this.collectionNumber;
    data['business_content'] = this.businessContent;
    data['audit_status'] = this.auditStatus;
    data['shop_photo'] = this.shopPhoto;
    data['other_img'] = this.otherImg;
    data['admin_id'] = this.adminId;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['audit_time'] = this.auditTime;
    data['type'] = this.type;
    data['reasons'] = this.reasons;
    data['category_id'] = this.categoryId;
    data['del'] = this.del;
    data['del_time'] = this.delTime;
    data['shop_photo_arr'] = this.shopPhotoArr;
    data['proportion'] = this.proportion;
    return data;
  }
}