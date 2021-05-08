import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/address.dart';
import 'package:get/get.dart';

import 'state.dart';

class AddressLogic extends GetxController {
  final state = AddressState();
  @override
  void onInit() async {
    super.onInit();
    await onGetAddressList();
  }

  Future onGetAddressList() async {
    final RealResponseData response = await AddressService.addressList();
    if (response.result) {
       state.addressList.value = response.data;
    }
  }
}
