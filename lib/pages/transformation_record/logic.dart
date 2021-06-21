import 'package:get/get.dart';
import 'package:egou_app/services/transform.dart';
import 'package:egou_app/http/response_data.dart';
import 'state.dart';

class TransformationRecordLogic extends GetxController {
  final state = TransformationRecordState();

  // 互转记录
  Future onGetConversionRecord() async {
    final RealResponseData response = await TransformService.ConversionRecord(1);
    if (response.result) {
      state.conversionRecord.value = response.data;
      state.hasMore.value = response.more;
      state.page.value = 1;
    }
  }

  Future onLoadMore() async {
    if (state.hasMore.value > 0) {
      final page = state.page.value + 1;
      final RealResponseData response = await TransformService.ConversionRecord(page);
      final List list = [];
      list.addAll(state.conversionRecord.value);
      list.addAll(response.data);
      state.conversionRecord.value = list;
      state.hasMore.value = response.more;
      state.page.value = page;
    }
  }
}
