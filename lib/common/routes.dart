import 'package:egou_app/pages/about_us/view.dart';
import 'package:egou_app/pages/address/view.dart';
import 'package:egou_app/pages/balance/view.dart';
import 'package:egou_app/pages/bank_card_list/view.dart';
import 'package:egou_app/pages/be_guest/view.dart';
import 'package:egou_app/pages/bind_card/view.dart';
import 'package:egou_app/pages/concat_us/view.dart';
import 'package:egou_app/pages/confirm_order/view.dart';
import 'package:egou_app/pages/edit_address/view.dart';
import 'package:egou_app/pages/forget_pwd/view.dart';
import 'package:egou_app/pages/goods_detail/view.dart';
import 'package:egou_app/pages/make_qrcode/view.dart';
import 'package:egou_app/pages/merchant_list/view.dart';
import 'package:egou_app/pages/my_order/view.dart';
import 'package:egou_app/pages/my_shop/view.dart';
import 'package:egou_app/pages/my_store/view.dart';
import 'package:egou_app/pages/my_team/view.dart';
import 'package:egou_app/pages/pay_mode/view.dart';
import 'package:egou_app/pages/pay_result/view.dart';
import 'package:egou_app/pages/points_mall/view.dart';
import 'package:egou_app/pages/pwd_update/view.dart';
import 'package:egou_app/pages/recharge/view.dart';
import 'package:egou_app/pages/setting_center/view.dart';
import 'package:egou_app/pages/share/view.dart';
import 'package:egou_app/pages/shop/view.dart';
import 'package:egou_app/pages/shop_detail/view.dart';
import 'package:egou_app/pages/shop_settled/view.dart';
import 'package:egou_app/pages/with_drawal_record/view.dart';
import 'package:egou_app/pages/withdrawal/view.dart';
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
  static final String shop_page = '/shop_page';
  static final String shop_detail = '/shop_detail';
  static final String goods_detail = '/goods_detail';
  static final String confirm_order = '/confirm_order';
  static final String pay_mode = '/pay_mode';
  static final String pay_result = '/pay_result';
  static final String shop_settled = '/shop_settled';
  static final String my_order = '/my_order';
  static final String recharge_page = '/recharge_page';
  static final String points_mall = '/points_mall';
  static final String my_team = '/my_team';
  static final String share_page = '/share_page';
  static final String my_store = '/my_store';
  static final String my_shop = '/my_shop';
  static final String about_us = '/about_us';
  static final String address_page = '/address_page';
  static final String concat_us = '/concat_us';
  static final String setting_center = '/setting_center';
  static final String edit_address = '/edit_address';
  static final String pwd_update = '/pwd_update';
  static final String be_guest = '/be_guest';
  static final String balance_page = '/balance_page';
  static final String withdrawal_page = '/withdrawal_page';
  static final String bind_card = '/bind_card';
  static final String withdrawal_record = '/withdrawal_record';
  static final String bank_card_list = '/bank_card_list';
  static final String make_qrcode = '/make_qrcode';
  static final String forget_pwd = '/forget_pwd';
  static final String merchant_list = '/merchant_list';

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
    GetPage(name: shop_settled, page: () => ShopSettledPage()),
    GetPage(name: my_order, page: () => MyOrderPage()),
    GetPage(name: recharge_page, page: () => RechargePage()),
    GetPage(name: points_mall, page: () => PointsMallPage()),
    GetPage(name: my_team, page: () => MyTeamPage()),
    GetPage(name: share_page, page: () => SharePage()),
    GetPage(name: my_store, page: () => MyStorePage()),
    GetPage(name: my_shop, page: () => MyShopPage()),
    GetPage(name: about_us, page: () => AboutUsPage()),
    GetPage(name: address_page, page: () => AddressPage()),
    GetPage(name: concat_us, page: () => ConcatUsPage()),
    GetPage(name: setting_center, page: () => SettingCenterPage()),
    GetPage(name: edit_address, page: () => EditAddressPage()),
    GetPage(name: pwd_update, page: () => PwdUpdatePage()),
    GetPage(name: be_guest, page: () => BeGuestPage()),
    GetPage(name: balance_page, page: () => BalancePage()),
    GetPage(name: withdrawal_page, page: () => WithdrawalPage()),
    GetPage(name: bind_card, page: () => BindCardPage()),
    GetPage(name: withdrawal_record, page: () => WithDrawalRecordPage()),
    GetPage(name: bank_card_list, page: () => BankCardListPage()),
    GetPage(name: make_qrcode, page: () => MakeQrcodePage()),
    GetPage(name: forget_pwd, page: () => ForgetPwdPage()),
    GetPage(name: merchant_list, page: () => MerchantListPage()),
    GetPage(name: shop_page, page: () => ShopPage()),

  ];
}
