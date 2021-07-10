CommentCategoryModel CommentCategoryModelFromJson(json) => CommentCategoryModel.fromJson(json);

class CommentCategoryModel {
  List<Comment> comment;
  String percent;

  CommentCategoryModel({this.comment, this.percent});

  CommentCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['comment'] != null) {
      comment = new List<Comment>();
      json['comment'].forEach((v) {
        comment.add(new Comment.fromJson(v));
      });
    }
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comment != null) {
      data['comment'] = this.comment.map((v) => v.toJson()).toList();
    }
    data['percent'] = this.percent;
    return data;
  }
}

class Comment {
  String name;
  int id;
  int count;

  Comment({this.name, this.id, this.count});

  Comment.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['count'] = this.count;
    return data;
  }
}