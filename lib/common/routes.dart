import 'package:get/get.dart';
import 'package:zb_app/pages/guide/view.dart';
import 'package:zb_app/pages/home/view.dart';
import 'package:zb_app/pages/launch/view.dart';
import 'package:zb_app/pages/login/view.dart';
import 'package:zb_app/pages/main/view.dart';

class RouteConfig {
  static final String launch_page = '/';
  static final String login_page = '/login_page';
  static final String guide_page = '/guide_page';
  static final String main_page = '/main_page';
  static final String home_page = '/home_page';

  static final List<GetPage> getPages = [
    GetPage(name: launch_page, page: () => LaunchPage()),
    GetPage(name: login_page, page: () => LoginPage()),
    GetPage(name: guide_page, page: () => GuidePage()),
    GetPage(name: main_page, page: () => MainPage()),
    GetPage(name: home_page, page: () => HomePage()),
  ];
}