import 'package:egou_app/pages/confirm_order/view.dart';
import 'package:egou_app/pages/goods_detail/view.dart';
import 'package:egou_app/pages/pay_mode/view.dart';
import 'package:egou_app/pages/pay_result/view.dart';
import 'package:egou_app/pages/shop_detail/view.dart';
import 'package:get/get.dart';
import 'package:egou_app/pages/guide/view.dart';
import 'package:egou_app/pages/home/view.dart';
import 'package:egou_app/pages/launch/view.dart';
import 'package:egou_app/pages/login/view.dart';
import 'package:egou_app/pages/main/view.dart';

class RouteConfig {
  static final String launch_page = '/';
  static final String login_page = '/login_page';
  static final String guide_page = '/guide_page';
  static final String main_page = '/main_page';
  static final String home_page = '/home_page';
  static final String shop_detail = '/shop_detail';
  static final String goods_detail = '/goods_detail';
  static final String confirm_order = '/confirm_order';
  static final String pay_mode = '/pay_mode';
  static final String pay_result = '/pay_result';

  static final List<GetPage> getPages = [
    GetPage(name: launch_page, page: () => LaunchPage()),
    GetPage(name: login_page, page: () => LoginPage()),
    GetPage(name: guide_page, page: () => GuidePage()),
    GetPage(name: main_page, page: () => MainPage()),
    GetPage(name: home_page, page: () => HomePage()),
    GetPage(name: shop_detail, page: () => ShopDetailPage()),
    GetPage(name: goods_detail, page: () => GoodsDetailPage()),
    GetPage(name: confirm_order, page: () => ConfirmOrderPage()),
    GetPage(name: pay_mode, page: () => PayModePage()),
    GetPage(name: pay_result, page: () => PayResultPage()),
  ];
}
