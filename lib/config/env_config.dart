import 'package:egou_app/constant/app_enums.dart';
import 'package:egou_app/models/env_model.dart';

class EnvConfig {
  static EnvModel env = EnvModel(
      env: EnumEnv.release,
      apiUrl: 'https://nmmhbstl.com',
      name: '发布环境'
  );
}