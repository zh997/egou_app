import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/gift_bag.dart';
import 'package:get/get.dart';

import 'state.dart';

class BeGuestLogic extends GetxController {
  final state = BeGuestState();

  Future onGetGiftBagDetail() async{
     final RealResponseData response = await GiftBagService.giftDetail();
     if (response.result) {
        state.giftBagDetail.value = response.data;
     }
  }

}
