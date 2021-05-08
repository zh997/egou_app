import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/address.dart';
import 'package:get/get.dart';

import 'state.dart';

class EditAddressLogic extends GetxController {
  final state = EditAddressState();

  Future onNameToId(Map<String, String> data) async {
    final RealResponseData response = await AddressService.nameToId(data);
    if(response.result){
      state.AddressIds.value = response.data;
    }
  }
}
