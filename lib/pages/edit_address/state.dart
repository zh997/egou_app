import 'package:get/get.dart';
import 'package:egou_app/models/address.dart';

class EditAddressState {
  Rx<AddressNameToIdModel> AddressIds = AddressNameToIdModel().obs;
  EditAddressState() {
    ///Initialize variables
  }
}
