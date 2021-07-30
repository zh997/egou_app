import 'package:egou_app/config/env_config.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/models/third_pay.dart';
import 'package:egou_app/pages/pay_mode/logic.dart';
import 'package:egou_app/pages/pay_mode/state.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

import 'logic.dart';
import 'state.dart';

class PayMiddlePage extends StatefulWidget {
  const PayMiddlePage({Key key}) : super(key: key);

  @override
  _PayMiddlePageState createState() => _PayMiddlePageState();
}

class _PayMiddlePageState extends State<PayMiddlePage> {
  final PayMiddleLogic logic = Get.put(PayMiddleLogic());
  final PayMiddleState state = Get.find<PayMiddleLogic>().state;
  final PayModeState payModelstate = Get.find<PayModeLogic>().state;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '第三方支付'),
      body: Obx((){
        ThirdPayModel thirdPayModel = payModelstate.thirdPayModel.value;
        String url = EnvConfig.env.apiUrl + '/index/index/payform' + "?charset=${thirdPayModel.data.charset}&signType=${thirdPayModel.data.signType}&data=${thirdPayModel.data.data}&sign=${thirdPayModel.data.sign}";
        print(url);
        return  WebView(
          initialUrl: url,
          //JS执行模式 是否允许JS执行
          javascriptMode: JavascriptMode.unrestricted,
        );
      }) ,
    );
  }
}
