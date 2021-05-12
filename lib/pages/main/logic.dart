import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/address.dart';
import 'package:egou_app/models/order.dart';
import 'package:egou_app/services/address.dart';
import 'package:egou_app/services/user.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'state.dart';

class MainLogic extends GetxController {
  final state = MainState();
  void onSetShopType(int index) => state.shopType.value = index;
  void onChangePageIndex(int index) => state.pageIndex.value = index;
  void onSelectOrderGoods(List data){
    state.orderGoods.value = data;
  }

  Future onGetAddressList() async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await AddressService.addressList();
    if (response.result) {
      AddressListModel selectAddress = AddressListModel();
      response.data.forEach((item) {
        if(item.isDefault == 1) {
          selectAddress = item;
        }
      });
      print(selectAddress.id);
      print(response.data);
      if (selectAddress.id == null && response.data.length > 0) {
        selectAddress = response.data[0];
      }
      state.selectAddress.value = selectAddress;
      state.addressList.value = response.data;
    }
    EasyLoading.dismiss();
  }

  Future onGetUserInfo () async {
    final RealResponseData response = await UserService.getUserInfo();
    if (response.result) {
      state.userInfo.value = response.data;
    }
  }

  void onSelectAddress(AddressListModel address) {
    state.selectAddress.value = address;
  }
}
