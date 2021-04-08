import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class LaunchPage extends StatelessWidget {
  final LaunchLogic logic = Get.put(LaunchLogic());
  final LaunchState state = Get.find<LaunchLogic>().state;
  LaunchPage(){ logic.StartCountDown(); }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,  // 未定位的元素充满Stack空间
        children: [
          Image.network('https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1093264713,2279663012&fm=26&gp=0.jpg', fit: BoxFit.fill),
          Positioned(
            top: MediaQuery.of(context).padding.top + 30,
            right: 30,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0x7F757575)
              ),
              child: Obx(() => Text('${state.CountDownSeconds}s', style: TextStyle(fontSize: 18, color: Colors.white))),
            )
          )
        ],
      ),
    );
  }
}
