import 'package:get/get.dart';

class MainState {
  RxList<TabbarItem> TabBarList;
  RxInt current;
  MainState() {
    ///Initialize variables
    TabBarList = [
      TabbarItem('static/images/d1-1.png', 'static/images/d1-2.png', '首页'),
      TabbarItem('static/images/d2-1.png', 'static/images/d2-2.png', '采选'),
      TabbarItem('static/images/new.png', 'static/images/new.png', '新品'),
      TabbarItem('static/images/d3-1.png', 'static/images/d3-2.png', '购物车'),
      TabbarItem('static/images/d4-1.png', 'static/images/d4-2.png', '个人中心')
    ].obs;
    current = 0.obs;
  }
}

class TabbarItem {
  String icon;
  String selected_icon;
  String text;

  TabbarItem(this.icon, this.selected_icon, this.text);
}
