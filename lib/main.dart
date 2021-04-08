import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egou_app/common/routes.dart';
import 'package:egou_app/middleware/app_middleware.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1125, 2346),
      allowFontScaling: true,
      builder: () => GetMaterialApp(
        title: 'egou app',
        builder: (context, child){
          return EasyLoading.init()(context, Scaffold(
              // Global GestureDetector that will dismiss the keyboard
              body: GestureDetector(
              onTap: () {
                hideKeyboard(context);
              },
              child:  child,
          )));
        },
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        onInit: AppMiddleWare.onInit,
        onReady: AppMiddleWare.onReady(),
        routingCallback: AppMiddleWare.RoutingCallback,
        defaultTransition: Transition.fade,
        getPages: RouteConfig.getPages,
      ),
    );
  }
}

// 点击空白区域隐藏软键盘
void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus.unfocus();
  }
}


