import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/address.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class AddressLogic extends GetxController {
  final state = AddressState();

  Future onGetAddressList() async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await AddressService.addressList();
    if (response.result) {
       state.addressList.value = response.data;
    }
    EasyLoading.dismiss();
  }
}
