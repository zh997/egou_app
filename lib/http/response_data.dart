import 'package:flutter/cupertino.dart';

class DioResponseData<T> {
  int code;
  T data;
  bool result;
  String message;
  DioResponseData(this.code, this.data, this.result, this.message);
}


class ResponseData<T>{
  String msg;
  T data;
  int code;

  ResponseData({this.msg, this.data, this.code});

  ResponseData.fromJson(Map<String, dynamic> json, { fromJson }) {
    print('----------------------');
    print(json);
    print('----------------------');
    msg = json['msg'];
    if (fromJson != null && json['code'] == 1) {
      data = json['data'] != null ? fromJson(json['data']) : null;
    }
    code = json['code'];
  }
}


class RealResponseData<T> {
  final bool result;
  final T data;
  RealResponseData({@required this.result, @required this.data});
}
