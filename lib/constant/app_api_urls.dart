import 'package:egou_app/config/env_config.dart';

class AppApiUrls  {
  static String BASE_URL = EnvConfig.env.apiUrl;

  static String SEND_CODE = '/api/sms/send';
  static String ACCOUNT_LOGIN = '/api/account/login';
  static String SMS_LOGIN = '/api/account/smsLogin';
  static String ACCOUNT_REGISTER = '/api/account/register';

  static String UPLOAD_IMG = BASE_URL + '/api/file/formimage';
  static String APP_UPLOAD_IMG = '/api/file/formimage';
  static String ENTRY_ADD = '/api/Entry/add';
  static String AD_LISTS = '/api/ad/lists';
  static String GET_BESTLIST = '/api/goods/getBestList';
  static String GET_GOODS_CATEORY = '/api/goods_category/lists';
  static String GET_GOODS_DETAIL = '/api/goods/getGoodsDetail';
  static String GET_ADDRESS = '/api/user_address/lists';
  static String ADDRESS_NAME_TO_ID = '/api/user_address/handleregion';
  static String ADD_ADDRESS = '/api/user_address/add';
  static String UPDATE_ADDRESS = '/api/user_address/update';
  static String ORDER_BUY = '/api/order/buy';
  static String CART_ADD = '/api/cart/add';
  static String CART_LIST = '/api/cart/lists';
  static String CART_CHANGE = '/api/cart/change';
  static String CART_SELECTED = '/api/cart/selected';
  static String SHARE_POSETER = '/api/share/userPoster';
  static String CART_DEL = '/api/cart/del';
  static String DEL_ADDRESS = '/api/user_address/del';
  static String USER_CENTER = '/api/user/center';
  static String FORGET_LOGIN_PWD = '/api/login_password/forget';
  static String GIFT_DETAIL = '/api/gift/detail';
  static String ORDER_BUYGIFT = '/api/order/buyGift';
  static String ORDER_LISTS = '/api/order/lists';
  static String ORDER_DETAIL = '/api/order/detail';
  static String ORDER_CONFIRM = '/api/order/confirm';
  static String ORDER_DEL = '/api/order/del';
  static String ORDER_CANCEL = '/api/order/cancel';
  static String SHOP_CATEGORY_LISTS = '/api/shop_category/lists';
  static String SHOP_ENTRY_LISTS = '/api/Entry/lists';
  static String USER_ACCOUNTLOG = '/api/user/accountLog';
  static String ADD_COMMENT = '/api/goods_comment/addGoodsComment';
  static String USER_MYTEAM = '/api/User/myTeam';
  static String COLLECT_GOODS = '/api/collect/handleCollectGoods';
  static String GET_COLLECT_GOODS = '/api/collect/getCollectGoods';
  static String UPDATE_PAY_PWD = '/api/login_password/payForget';
  static String USER_ADD_BANKCARD = '/api/User/addCard';
  static String USER_BANKCARD_LIST = '/api/User/cardList';
  static String SHOP_SETTING_ABOUT = '/api/Shop_Setting/about';
  static String SHOP_SETTING_POLICY = '/api/Shop_Setting/policy';
  static String GOODS_GUESS_LIKE = '/api/goods/likeList';
  static String GOODS_GET_GOODSLIST = '/api/goods/getGoodsList';
  static String WX_PAYMENT_PREPAY = '/api/payment/prepay';
  static String CONVERSION_USER = '/api/Conversion/user';
  static String CONVERSION_MOVE = '/api/Conversion/move';
  static String CONVERSION_RECORD = '/api/Conversion/lists';
  static String WITHDRAW_APPLY = '/api/money_withdraw/apply';
  static String MONEY_WITHDRAS_RECORD = '/api/money_withdraw/records';
}
