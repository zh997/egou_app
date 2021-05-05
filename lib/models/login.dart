// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

LoginModel loginModelFromJson(json) => LoginModel.fromJson(json);

class LoginModel {
  String authToken;

  LoginModel({this.authToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auth_token'] = this.authToken;
    return data;
  }
}
