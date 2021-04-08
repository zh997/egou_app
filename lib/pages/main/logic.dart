import 'package:get/get.dart';
import 'state.dart';

class MainLogic extends GetxController {
  final state = MainState();
  void onChangeTabBar(int index) => state.current.value = index;
}
