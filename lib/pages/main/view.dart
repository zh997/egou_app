import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/pages/bill/view.dart';
import 'package:egou_app/pages/cart/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:egou_app/pages/home/view.dart';
import 'logic.dart';
import 'state.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final MainLogic logic = Get.put(MainLogic());
  final MainState state = Get.find<MainLogic>().state;
  int pageIndex = 0;
  PageController pageController;

  @override
  void initState() {
    // TODO: implement setState
    pageController = PageController(initialPage: pageIndex);
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
            BillPage(),
            CartPage(),
            Text('购物车'),
            Text('个人中心')
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: pageIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.COLOR_PRIMARY_1,
          unselectedItemColor:  AppColors.COLOR_BLACK_2,
          selectedFontSize: 12.0,
          onTap: (int index) {
            setState(() {
              pageIndex = index;
            });
            pageController.jumpToPage(index);
          },
          items: [
            _BottomNavigationBarItem(AppImages.TABBAR_HOME_ICON, AppImages.TABBAR_HOME_SELECTED_ICON, '首页'),
            _BottomNavigationBarItem(AppImages.TABBAR_BILL_ICON, AppImages.TABBAR_BILL_SELECTED_ICON, '报单区'),
            _BottomNavigationBarItem(AppImages.TABBAR_CART_ICON, AppImages.TABBAR_CART_SELECTED_ICON, '购物车'),
            _BottomNavigationBarItem(AppImages.TABBAR_SHOP_ICON, AppImages.TABBAR_SHOP_SELECTED_ICON, '商家'),
            _BottomNavigationBarItem(AppImages.TABBAR_MY_ICON, AppImages.TABBAR_MY_SELECTED_ICON, '我的')
          ],
        )
    );
  }

  BottomNavigationBarItem _BottomNavigationBarItem(icon, activeIcon, label) {
    return BottomNavigationBarItem(
        icon: Image.asset(icon, width: ScreenUtil().setWidth(69) , height: ScreenUtil().setWidth(69)),
        activeIcon:  Image.asset(activeIcon, width: ScreenUtil().setWidth(69) , height: ScreenUtil().setWidth(69)),
        label: label,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }
}