import 'package:egou_app/common/utils.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/address.dart';
import 'package:get/get.dart';

import 'state.dart';

class EditAddressLogic extends GetxController {
  final state = EditAddressState();

  Future onNameToId(Map<String, String> data) async {
    final RealResponseData response = await AddressService.nameToId(data);
    if(response.result){
      if (response.data.province == '') {
        return Utils.toast('省份不存在，请重新选择');
      }
      if ( response.data.city == '') {
        return Utils.toast('城市不存在，请重新选择');
      }
      if (response.data.district == '') {
        return Utils.toast('区县不存在，请重新选择');
      }
      state.AddressIds.value = response.data;
    }
  }

  void onChangeAddressIds(data) {
    state.AddressIds.value = data;
  }

  Future onAddAddress(Map<String, dynamic> data) async {
    final RealResponseData response = await AddressService.addAddress(data);
    if(response.result){
       Get.back();
    }
  }

  Future onUpdateAddress(Map<String, dynamic> data) async {
    final RealResponseData response = await AddressService.updateAddress(data);
    if(response.result){
      Get.back();
    }
  }

  Future onDelAddress(Map<String, dynamic> data) async {
    final RealResponseData response = await AddressService.delAddress(data);
    if(response.result){
      Get.back();
    }
  }
}
