import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/address.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class EditAddressLogic extends GetxController {
  final state = EditAddressState();

  Future onNameToId(Map<String, String> data) async {
    final RealResponseData response = await AddressService.nameToId(data);
    if(response.result){
      if (response.data.province == '') {
        return EasyLoading.showError('省份不存在，请重新选择');
      }
      if ( response.data.city == '') {
        return EasyLoading.showError('城市不存在，请重新选择');
      }
      if (response.data.district == '') {
        return EasyLoading.showError('区县不存在，请重新选择');
      }
      state.AddressIds.value = response.data;
    }
  }

  void onChangeAddressIds(data) {
    state.AddressIds.value = data;
  }

  Future onAddAddress(Map<String, dynamic> data) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await AddressService.addAddress(data);
    if(response.result){
       Get.back();
    }
    EasyLoading.showSuccess('添加成功！');
  }

  Future onUpdateAddress(Map<String, dynamic> data) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await AddressService.updateAddress(data);
    if(response.result){
      Get.back();
    }
    EasyLoading.showSuccess('修改成功！');
  }

  Future onDelAddress(Map<String, dynamic> data) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await AddressService.delAddress(data);
    if(response.result){
      Get.back();
    }
  }
}
