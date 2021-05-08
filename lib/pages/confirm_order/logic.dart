import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/address.dart';
import 'package:egou_app/services/address.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class ConfirmOrderLogic extends GetxController {
  final state = ConfirmOrderState();

  Future onGetAddressList() async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await AddressService.addressList();
    if (response.result) {
      response.data.forEach((item) => {
        if(item.isDefault == 1) {
          state.selectAddress.value = item
        }
      });
    }
    EasyLoading.dismiss();
  }

  void onSelectAddress(AddressListModel address) {
    state.selectAddress.value = address;
  }
}
