import 'package:get/get.dart';

import 'state.dart';

class TransformationLogic extends GetxController {
  final state = TransformationState();
  void onChangeSelect(String index) {
    state.collection_type.value = index;
  }
}
