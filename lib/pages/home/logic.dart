import 'package:get/get.dart';
import 'state.dart';

class HomeLogic extends GetxController {
  final state = HomeState();
  void onSwiperChange(int index) => state.current.value = index;
}
