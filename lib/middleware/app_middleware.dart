import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/observers/route_observer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zb_app/common/routes.dart';

class AppMiddleWare {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Function onInit() {
    print('----onInit-----');
  }

  static Function onReady() {
    print('-----onReady-----');
  }

  // 路由拦截中间件
  static Function RoutingCallback(Routing routing) {
    print('-------- ${routing} ----------');
    // Future.delayed(Duration(seconds: 3)).then((value){
    //    Get.toNamed(RouteConfig.login_page);
    // });
  }
}