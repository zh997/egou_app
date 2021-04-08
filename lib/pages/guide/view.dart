import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class GuidePage extends StatelessWidget {
  final GuideLogic logic = Get.put(GuideLogic());
  final GuideState state = Get.find<GuideLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
