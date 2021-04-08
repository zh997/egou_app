import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:zb_app/common/utils.dart';
import 'package:zb_app/pages/home/view.dart';
import 'logic.dart';
import 'state.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainLogic logic = Get.put(MainLogic());
  final MainState state = Get.find<MainLogic>().state;
  PageController pageController;

  @override
  void initState() {
    // TODO: implement setState
    print(state.current.value);
    pageController = PageController(initialPage: state.current.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            HomePage(),
            Text('采选'),
            Text('新品'),
            Text('购物车'),
            Text('个人中心')
          ],
        ),
        bottomNavigationBar: Obx(() => _BottomAppBar(state.TabBarList, state.current.value, logic, pageController))
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }
}

class _BottomAppBar extends StatelessWidget{
  final List<TabbarItem> list;
  final int current;
  final MainLogic logic;
  final PageController pageController;
  _BottomAppBar(this.list, this.current, this.logic, this.pageController);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StyleProvider(style: ConverStyle(), child:
          ConvexAppBar.badge({
            3: '10',
          },
          elevation: 0,
          height: 48,
          top: -18,
          badgeColor: Color(0xFFEEB023),
          badgeBorderRadius: 20,
          badgePadding: EdgeInsets.all(3),
          badgeMargin: EdgeInsets.only(bottom: 20, left: 20),
          backgroundColor: Colors.white,
          color: Utils.getColor('#5A5B5F'),
          activeColor: Utils.getColor('#EEB023'),
          initialActiveIndex: current,
          style: TabStyle.fixed,
          items: List.generate(list.length, (index) => TabItem(
              icon: current == index ? Image.asset(list[index].selected_icon) :  Image.asset(list[index].icon),
              title: list[index].text
          )),
          onTap: (index) {
            logic.onChangeTabBar(index);
            pageController.jumpToPage(index);
          },
        )
      );
  }
}

class ConverStyle extends StyleHook{
  @override
  // TODO: implement activeIconMargin
  double get activeIconMargin => 0;

  @override
  // TODO: implement activeIconSize
  double get activeIconSize => 45;

  @override
  // TODO: implement iconSize
  double get iconSize => 25;

  @override
  TextStyle textStyle(Color color) {
    // TODO: implement textStyle
    return TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w500);
  }

}
