ShopEntryListModel ShopEntryListModelFromJson(json) => ShopEntryListModel.fromJson(json);

class ShopEntryListModel {
  int id;
  String name;
  int userId;
  String address;
  String phone;
  double longitude;
  double latitude;
  String businessContent;
  String shopPhoto;
  String otherImg;
  String createTime;
  int categoryId;
  List<String> shopPhotoList;
  List<String> otherImgList;

  ShopEntryListModel(
      {this.id,
        this.name,
        this.userId,
        this.address,
        this.phone,
        this.longitude,
        this.latitude,
        this.businessContent,
        this.shopPhoto,
        this.otherImg,
        this.createTime,
        this.categoryId,
        this.shopPhotoList,
        this.otherImgList});

  ShopEntryListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['user_id'];
    address = json['address'];
    phone = json['phone'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    businessContent = json['business_content'];
    shopPhoto = json['shop_photo'];
    otherImg = json['other_img'];
    createTime = json['create_time'];
    categoryId = json['category_id'];
    shopPhotoList = json['shop_photo_list'].cast<String>();
    otherImgList = json['other_img_list'].cast<String>();
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
    data['business_content'] = this.businessContent;
    data['shop_photo'] = this.shopPhoto;
    data['other_img'] = this.otherImg;
    data['create_time'] = this.createTime;
    data['category_id'] = this.categoryId;
    data['shop_photo_list'] = this.shopPhotoList;
    data['other_img_list'] = this.otherImgList;
    return data;
  }
}
