import 'package:decimal/decimal.dart';
import 'package:egou_app/constant/app_pay_config.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:tobias/tobias.dart' as tobias;
import 'package:egou_app/models/pay_config.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  // 微信支付
  static Future<bool> initFluwx(WxPayConfigModel options, {Function success(r), Function fail(e)}) async {
    await fluwx.registerWxApi(
        appId: AppPayConfig.appId,
        doOnAndroid: true,
        doOnIOS: true,
        universalLink: AppPayConfig.universalLink);
    var result = await fluwx.isWeChatInstalled;
    if (result) {
      // 配置
       var wxpayRes = await fluwx.payWithWeChat(
        appId: options.appid,
        partnerId: options.partnerid,
        prepayId: options.prepayid,
        packageValue: options.package,
        nonceStr: options.noncestr,
        timeStamp: options.timestamp,
        sign: options.sign,
      );
      print(wxpayRes);
      // 监听支付结果
      fluwx.weChatResponseEventHandler.listen((event) async {
        print(event);
        // 支付成功
        if (event.errCode == 0) {
          if (success != null) success(event.errCode);
        } else {
          if (fail != null) fail(event.errCode);
        }
      });
    } else {
      toast('请先安装微信');
    }

    return result;
  }

  // 支付宝支付
  static Future<bool> initAlipay(String order, {Function success(r), Function fail(e)}) async {
    var result = await tobias.isAliPayInstalled();
    if (result) {
      final payResult = await tobias.aliPay(order);
      print(payResult);
      if (payResult["resultStatus"] == "9000") {
        if (success != null) success(payResult);
      } else {
        if (fail != null) fail(payResult);
      }
    } else {
      toast('请先安装支付宝');
    }
    return result;
  }

  static double add(double a, double b){
    return (Decimal.parse(a.toString()) + Decimal.parse(b.toString())).toDouble();
  }
  static double sub(double a, double b){
    return (Decimal.parse(a.toString()) - Decimal.parse(b.toString())).toDouble();
  }
  static double mul(double a, double b){
    return (Decimal.parse(a.toString()) * Decimal.parse(b.toString())).toDouble();
  }
  static double div(double a, double b){
    return (Decimal.parse(a.toString()) / Decimal.parse(b.toString())).toDouble();
  }

  static toast(msg, {Color backgroundColor, Color textColor}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: 16.0
    );
  }

  static const bool inProduction = const bool.fromEnvironment("dart.vm.product");

  static Color getColor(String s) {
    String rgbColor = '000000';
    if (s.isNotEmpty) {
      rgbColor = s.substring(1, 7);
    }
    return Color(int.parse(rgbColor, radix: 16) + 0xFF000000);
  }

  static bool isChinaPhoneLegal(String str) {
    return new RegExp('^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$').hasMatch(str);
  }

  static bool validate( BuildContext context, List formItems, bool isShowErrorText) {
    bool isPass = true;
    for(var i in formItems) {
      if (!(i is SizedBox)) {
        if (i.validate != null && validate is Function) {
          final String errorText = i.validate(i.controller.text);
          if (errorText.isNotEmpty) {
            // FocusScope.of(context).requestFocus(i.focusNode);
            isShowErrorText && i.key.currentState.setErrorText(errorText);
            isPass = false;
            break;
          } else {
            isShowErrorText && i.key.currentState.setErrorText('');
            isPass = true;
          }
        } else if(i.isRequired && !i.controller.text.isNotEmpty) {
          isShowErrorText && i.key.currentState.setErrorText(i.labelText);
          isPass = false;
        } else if(i.isRequired && i.controller.text.isNotEmpty) {
          isShowErrorText && i.key.currentState.setErrorText('');
          isPass = true;
        }
      }
    }
    return isPass;
  }

  static Map<String, dynamic> getFormValue(List formItems) {
    Map<String, dynamic> formData = new Map();
    for(var i in formItems) {
      if (!(i is SizedBox)) {
        formData[i.name] = i.controller.text;
      }
    }
    return formData;
  }
}



class PlatformUtils {
  static bool _isWeb() {
    return kIsWeb == true;
  }

  static bool _isAndroid() {
    return _isWeb() ? false : Platform.isAndroid;
  }

  static bool _isIOS() {
    return _isWeb() ? false : Platform.isIOS;
  }

  static bool _isMacOS() {
    return _isWeb() ? false : Platform.isMacOS;
  }

  static bool _isWindows() {
    return _isWeb() ? false : Platform.isWindows;
  }

  static bool _isFuchsia() {
    return _isWeb() ? false : Platform.isFuchsia;
  }

  static bool _isLinux() {
    return _isWeb() ? false : Platform.isLinux;
  }

  static bool get isWeb => _isWeb();

  static bool get isAndroid => _isAndroid();

  static bool get isIOS => _isIOS();

  static bool get isMacOS => _isMacOS();

  static bool get isWindows => _isWindows();

  static bool get isFuchsia => _isFuchsia();

  static bool get isLinux => _isLinux();
}

class MapUtil {

  /// 高德地图
  static Future<bool> gotoAMap(longitude, latitude) async {
    var url = '${Platform.isAndroid ? 'android' : 'ios'}amap://navi?sourceApplication=amap&lat=$latitude&lon=$longitude&dev=0&style=2';
    bool canLaunchUrl = await canLaunch(url);

    if (!canLaunchUrl) {
      Utils.toast('未检测到高德地图~');
      return false;
    }

    await launch(url);

    return true;
  }

  /// 腾讯地图
  static Future<bool> gotoTencentMap(longitude, latitude) async {
    var url = 'qqmap://map/routeplan?type=drive&fromcoord=CurrentLocation&tocoord=$latitude,$longitude&referer=IXHBZ-QIZE4-ZQ6UP-DJYEO-HC2K2-EZBXJ';
    bool canLaunchUrl = await canLaunch(url);

    if (!canLaunchUrl) {
      Utils.toast('未检测到腾讯地图~');
      return false;
    }

    await launch(url);

    return canLaunchUrl;
  }

  /// 百度地图
  static Future<bool> gotoBaiduMap(longitude, latitude) async {
    var url = 'baidumap://map/direction?destination=$latitude,$longitude&coord_type=bd09ll&mode=driving';

    bool canLaunchUrl = await canLaunch(url);

    if (!canLaunchUrl) {
      Utils.toast('未检测到百度地图~');
      return false;
    }

    await launch(url);

    return canLaunchUrl;
  }
}