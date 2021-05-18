import 'package:egou_app/models/gift_bag.dart';
import 'package:get/get.dart';

class BeGuestState {
  Rx<GiftBagDetailModel> giftBagDetail = GiftBagDetailModel().obs;
  BeGuestState() {
  }
}