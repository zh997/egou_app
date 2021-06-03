import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:egou_app/models/user_policy.dart';

import 'logic.dart';
import 'state.dart';

class AgreementPage extends StatefulWidget {
  @override
  _AgreementPageState createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {
  final AgreementLogic logic = Get.put(AgreementLogic());
  final AgreementState state = Get.find<AgreementLogic>().state;
  Future _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = logic.onShopSettingPolicy();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _future,builder: (BuildContext context, AsyncSnapshot snapshot){
      if (snapshot.connectionState == ConnectionState.done){
        return Scaffold(
          appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '用户协议'),
          body: Obx(() {
            final UserPolicyModel userPolicy = state.userPolicy.value;
            return Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  Text('服务协议&用户协议', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48),),
                  SizedBox(height: 15,),
                  HtmlWidget(userPolicy.service,textStyle: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                  SizedBox(height: 30,),
                  Text('隐私协议', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48),),
                  SizedBox(height: 15,),
                  HtmlWidget(userPolicy.privacy,textStyle: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48),),
                  SizedBox(height: 30,),
                  Text('售后协议', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48),),
                  SizedBox(height: 15,),
                  HtmlWidget(userPolicy.afterSale, textStyle: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48),)
                ],
              ) ,
            );
          })
        );
      }
      return SpinKit();
    });

  }
}
