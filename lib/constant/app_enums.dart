import 'package:egou_app/constant/app_images.dart';

enum balanceType {balance, goldcoin, silvercoin}

/**
 * 发送标识 短信登录：ZCYZ-注册验证；ZHMM-找回密码;YZMDL-验证码登录; BGSJHM-更换手机号
 * **/
enum sendMsgKey {YZMDL, ZHMM, BGSJHM, ZCYZ}

/***
 * 订单类型;all-全部；pay-待付款；delivery-待收货；finish-已完成；close-已关闭
 * **/
final OrderTabValueItems = [
  OrderTabValue(status: 'all', name: '全部订单'),
  OrderTabValue(status: 'pay', name: '待付款'),
  OrderTabValue(status: 'delivery', name: '待收货'),
  OrderTabValue(status: 'finish', name: '已完成'),
  OrderTabValue(status: 'close', name: '已关闭'),
];
class OrderTabValue {
  final String status;
  final String name;

  OrderTabValue({this.status, this.name});
}

/**
 * 订单状态;0-待付款;1-待发货;2-待收货;3-已完成;4-已关闭,
 * **/
final List<OrderStatus> OrderStatusItems = [
  OrderStatus(status: 0, text: '待付款', icon: AppImages.ORDER_WAIT),
  OrderStatus(status: 1, text: '待发货', icon: AppImages.ORDER_WAIT),
  OrderStatus(status: 2, text: '待收货', icon: AppImages.ORDER_WAIT),
  OrderStatus(status: 3, text: '已完成', icon: AppImages.ORDER_SUCCESS),
  OrderStatus(status: 4, text: '已关闭', icon: AppImages.ORDER_SUCCESS),
];
class OrderStatusEnums {
  static int wait_pay = 0;
  static int wait_send = 1;
  static int wait_receiving = 2;
  static int finish = 3;
  static int close = 4 ;
}
class OrderStatus {
  final int status;
  final String text;
  final String icon;

  OrderStatus({this.status, this.text, this.icon});
}


/**
 * 商城类型:0-社区商城; 1-场景商城;
 * */
class MallType{
  static int community_mall = 0;
  static int scene_mall = 1;
}

/****
 * 卡片列表类型: 0微信 1支付宝 2 银行卡
 * */

class CardListType {
  static int wachat = 0;
  static int ali = 1;
  static int bank = 2;
}

/****
 * 银行卡类型: 1储蓄卡、2信用卡 3其他
 * */

final BankCardTypeList = [
  BankCardTypeItem(type: 1, text: '储蓄卡'),
  BankCardTypeItem(type: 2, text: '信用卡'),
  BankCardTypeItem(type: 3, text: '其他')
];

class BankCardTypeItem{
  final int type;
  final String text;

  BankCardTypeItem({this.type, this.text});

}

/**
 * 支付方式
 */
class PayMode {
  static int wechat = 1;
  static int alipay = 2;
  static int balance = 3;
}
