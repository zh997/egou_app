import 'package:egou_app/constant/app_enums.dart';
import 'package:egou_app/models/env_model.dart';

class EnvConfig {
  static EnvModel env = EnvModel(
    env: EnumEnv.local,
    apiUrl: 'https://shop.hlnsqz.cn',
    name: '开发环境'
  );
}