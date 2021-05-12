import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/models/gift_bag.dart';
import 'package:egou_app/models/global.dart';
import 'package:get/get.dart';

class BeGuestState {
  Rx<GiftBagDetailModel> giftBagDetail = GiftBagDetailModel().obs;
  BeGuestState() {
  }
}