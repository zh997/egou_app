import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class RechargePage extends StatelessWidget {
  final RechargeLogic logic = Get.put(RechargeLogic());
  final RechargeState state = Get.find<RechargeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '会员充值'),
      body: Column(
        children: [
          Expanded(child: ListView(
            children: [
              SizedBox(height: 20),
              Center(
                child: Text('选择充值金额', style: TextStyle(
                    color: AppColors.COLOR_BLACK_000000,
                    fontSize: AppFontsize.SIZE_56
                ))
              ),
              SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: [
                  _Item('50'),
                  _Item('100'),
                  _Item('500'),
                  _Item('1000'),
                  _Item('2500'),
                  _Item('3000'),
                  _Item('3500'),
                  _Item('4000')
                ],
              ),
              SizedBox(height: 20),
            ],
          )),
          Container(
              height: ScreenUtil().setWidth(250),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(width: 1, color: AppColors.COLOR_GRAY_DDDDDD))
              ),
              child: RadiusButton('支付', onTap: (){Get.toNamed(RouteConfig.pay_result);})
          )
        ],
      ),
    );
  }


  Widget _Item(price) {
    return Container(
      width: ScreenUtil().setWidth(448),
      height: ScreenUtil().setWidth(327),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.RADIUS_30),
        boxShadow: [BoxShadow(color: AppColors.COLOR_GRAY_E7E8E8, blurRadius: 10.0, spreadRadius: 0)],
      ),
      child: Price(color: AppColors.COLOR_BLACK_000000, size: AppFontsize.SIZE_88, price: price, unitSize: AppFontsize.SIZE_56),
    );
  }
}
