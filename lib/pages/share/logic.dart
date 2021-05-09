import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/common.dart';
import 'package:get/get.dart';

import 'state.dart';

class ShareLogic extends GetxController {
  final state = ShareState();
  Future onGeSharePosterUrl () async  {
    final RealResponseData response = await CommonService.sharePoster();
    if (response.result) {
      state.url.value = response.data.url;
    }
  }
}
