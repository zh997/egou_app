import 'package:egou_app/middleware/app_middleware.dart';
import 'package:egou_app/pages/about_us/view.dart';
import 'package:egou_app/pages/address/view.dart';
import 'package:egou_app/pages/agreement/view.dart';
import 'package:egou_app/pages/balance/view.dart';
import 'package:egou_app/pages/bank_card_list/view.dart';
import 'package:egou_app/pages/be_guest/view.dart';
import 'package:egou_app/pages/bind_card/view.dart';
import 'package:egou_app/pages/concat_us/view.dart';
import 'package:egou_app/pages/confirm_order/view.dart';
import 'package:egou_app/pages/discount_pay/view.dart';
import 'package:egou_app/pages/discount_pay_record/view.dart';
import 'package:egou_app/pages/edit_address/view.dart';
import 'package:egou_app/pages/forget_pwd/view.dart';
import 'package:egou_app/pages/gift_confirm_order/view.dart';
import 'package:egou_app/pages/goods_detail/view.dart';
import 'package:egou_app/pages/make_qrcode/view.dart';
import 'package:egou_app/pages/merchant_list/view.dart';
import 'package:egou_app/pages/my_order/view.dart';
import 'package:egou_app/pages/my_shop/view.dart';
import 'package:egou_app/pages/my_store/view.dart';
import 'package:egou_app/pages/my_team/view.dart';
import 'package:egou_app/pages/order_detail/view.dart';
import 'package:egou_app/pages/pay_mode/view.dart';
import 'package:egou_app/pages/pay_result/view.dart';
import 'package:egou_app/pages/points_mall/view.dart';
import 'package:egou_app/pages/publish_comments/view.dart';
import 'package:egou_app/pages/pwd_update/view.dart';
import 'package:egou_app/pages/recharge/view.dart';
import 'package:egou_app/pages/register/view.dart';
import 'package:egou_app/pages/search/view.dart';
import 'package:egou_app/pages/setting_center/view.dart';
import 'package:egou_app/pages/share/view.dart';
import 'package:egou_app/pages/shop/view.dart';
import 'package:egou_app/pages/shop_detail/view.dart';
import 'package:egou_app/pages/shop_settled/view.dart';
import 'package:egou_app/pages/transformation/view.dart';
import 'package:egou_app/pages/transformation_record/view.dart';
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
  static final String publish_comments = '/publish_comments';
  static final String register_page = '/register_page';
  static final String order_detail = '/order_detail';
  static final String agreenment_page = '/agreenment_page';
  static final String search_page = '/search_page';
  static final String gift_confirm_order = '/gift_confirm_order';
  static final String transformation_page = '/transformation_page';
  static final String transformation_record_page = '/transformation_record_page';
  static final String discount_pay = '/discount_pay';
  static final String discount_pay_record = '/discount_pay_record';

  static final List<GetPage> getPages = [
    GetPage(name: guide_page, page: () => GuidePage()),
    GetPage(name: register_page, page: () => RegisterPage()),
    GetPage(name: home_page, page: () => HomePage()),
    GetPage(name: launch_page, page: () => LaunchPage(),  transition: Transition.fadeIn),
    GetPage(name: login_page, page: () => LoginPage(), transition: Transition.fade),
    GetPage(name: main_page, page: () => MainPage(), transition: Transition.fadeIn),
    GetPage(name: search_page, page: () => SearchPage(), transition: Transition.fadeIn),
    GetPage(name: goods_detail, page: () => GoodsDetailPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: shop_detail, page: () => ShopDetailPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: confirm_order, page: () => ConfirmOrderPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: pay_mode, page: () => PayModePage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: pay_result, page: () => PayResultPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: shop_settled, page: () => ShopSettledPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: my_order, page: () => MyOrderPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: recharge_page, page: () => RechargePage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: points_mall, page: () => PointsMallPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: my_team, page: () => MyTeamPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: share_page, page: () => SharePage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: my_store, page: () => MyStorePage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: my_shop, page: () => MyShopPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: about_us, page: () => AboutUsPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: address_page, page: () => AddressPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: concat_us, page: () => ConcatUsPage(),middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: setting_center, page: () => SettingCenterPage(),middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: edit_address, page: () => EditAddressPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: pwd_update, page: () => PwdUpdatePage() ),
    GetPage(name: be_guest, page: () => BeGuestPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: balance_page, page: () => BalancePage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: withdrawal_page, page: () => WithdrawalPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: bind_card, page: () => BindCardPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: withdrawal_record, page: () => WithDrawalRecordPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: bank_card_list, page: () => BankCardListPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: make_qrcode, page: () => MakeQrcodePage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: forget_pwd, page: () => ForgetPwdPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: merchant_list, page: () => MerchantListPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: shop_page, page: () => ShopPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: publish_comments, page: () => PublishCommentsPage(), middlewares: [RouteAuthMiddleware(priority: 1)] ),
    GetPage(name: order_detail, page: () => OrderDetailPage(), middlewares: [RouteAuthMiddleware(priority: 1)]),
    GetPage(name: agreenment_page, page: () => AgreementPage(), middlewares: [RouteAuthMiddleware(priority: 1)]),
    GetPage(name: gift_confirm_order, page: () => GiftConfirmOrderPage(), middlewares: [RouteAuthMiddleware(priority: 1)]),
    GetPage(name: transformation_page, page: () => TransformationPage(), middlewares: [RouteAuthMiddleware(priority: 1)]),
    GetPage(name: transformation_record_page, page: () => TransformationRecordPage(), middlewares: [RouteAuthMiddleware(priority: 1)]),
    GetPage(name: discount_pay, page: () => DiscountPayPage(), middlewares: [RouteAuthMiddleware(priority: 1)]),
    GetPage(name: discount_pay_record, page: () => DiscountPayRecordPage(), middlewares: [RouteAuthMiddleware(priority: 1)]),
  ];
}
