import 'package:egou_app/config/env_config.dart';
import 'package:egou_app/constant/app_enums.dart';
import 'package:egou_app/models/env_model.dart';
import 'package:flutter/material.dart';
import '../main.dart';


void main() {
  EnvConfig.env = EnvModel(
    env: EnumEnv.dev,
    apiUrl: 'https://shop.hlnsqz.cn',
    name: '开发环境'
  );
  runApp(MyApp());
  configLoading();
}
