CommentListModel CommentListModelFromJson(json) => CommentListModel.fromJson(json);

class CommentListModel {
  int id;
  int goodsComment;
  int serviceComment;
  int expressComment;
  String comment;
  int descriptionComment;
  dynamic reply;
  String createTime;
  String nickname;
  String avatar;
  String specValueStr;
  List<String> image;

  CommentListModel(
      {this.id,
        this.goodsComment,
        this.serviceComment,
        this.expressComment,
        this.comment,
        this.descriptionComment,
        this.reply,
        this.createTime,
        this.nickname,
        this.avatar,
        this.specValueStr,
        this.image});

  CommentListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goodsComment = json['goods_comment'];
    serviceComment = json['service_comment'];
    expressComment = json['express_comment'];
    comment = json['comment'];
    descriptionComment = json['description_comment'];
    reply = json['reply'];
    createTime = json['create_time'];
    nickname = json['nickname'];
    avatar = json['avatar'];
    specValueStr = json['spec_value_str'];
    image = json['image'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goods_comment'] = this.goodsComment;
    data['service_comment'] = this.serviceComment;
    data['express_comment'] = this.expressComment;
    data['comment'] = this.comment;
    data['description_comment'] = this.descriptionComment;
    data['reply'] = this.reply;
    data['create_time'] = this.createTime;
    data['nickname'] = this.nickname;
    data['avatar'] = this.avatar;
    data['spec_value_str'] = this.specValueStr;
    data['image'] = this.image;
    return data;
  }
}