import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class WithdrawalPage extends StatelessWidget {
  final WithdrawalLogic logic = Get.put(WithdrawalLogic());
  final WithdrawalState state = Get.find<WithdrawalLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),
          title: '余额提现',
          actions: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Get.toNamed(RouteConfig.withdrawal_record);
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(right: 15),
                child: Text('提现记录', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_48)),
              ),
            )
          ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Get.toNamed(RouteConfig.bank_card_list);
            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('到账银行卡', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                  Row(
                    children: [
                      Text('添加银行卡', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                      Image.asset(AppImages.ARROW_RIGHT_ICON, width: 8, height: 18)
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text('提现金额', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                SizedBox(height: 20),
                RowTextField(
                  title: '¥',
                  suffixIcon: Text('全部', style: TextStyle(fontSize: 15)),
                  key: GlobalKey(),
                  controller: TextEditingController(),
                  labelText: '请输入提现金额',
                  contentPaddingTop: 15,
                  labelTop: 15,
                  height: 80,
                ),
                SizedBox(height: 20),

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('可提现金额：￥8.66', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_48)),
                SizedBox(height: 20),
                RadiusButton('添加银行卡提现', width: 1000,onTap: (){
                  Get.toNamed(RouteConfig.bind_card);
                },),
                SizedBox(height: 20),
                Text('预计2小时到账', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_48)),
              ],
            ),
          )
        ],
      )
    );
  }
}
