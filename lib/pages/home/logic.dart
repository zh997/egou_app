import 'package:get/get.dart';
import 'state.dart';

class HomeLogic extends GetxController {
  double opacity = 0;
  final int APPBAR_SCROLL_OFFSET = 100;
  final state = HomeState();
  void updateAppBarOpacity (double offset) {
     opacity = offset / APPBAR_SCROLL_OFFSET;
     if (opacity <= 0) {
       opacity = 0;
     } else if (opacity >=1 ) {
       opacity = 1;
     }
     state.appBarOpacity.value = opacity;
  }
  void onSwiperChange(int index) {
    state.current.value = index;
  }
}
