import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/models/bank_card_list.dart';
import 'package:egou_app/pages/main/logic.dart';
import 'package:egou_app/pages/main/state.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/app_text_field.dart';
import 'package:egou_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class WithdrawalPage extends StatelessWidget {
  final WithdrawalLogic logic = Get.put(WithdrawalLogic());
  final WithdrawalState state = Get.find<WithdrawalLogic>().state;
  final MainState mainState = Get.find<MainLogic>().state;

  TextEditingController _moneyController = TextEditingController();

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
      body: Obx(() {
        final BankCardListModel selectCard = state.selectCard.value;
        final UserInfoModel userinfo = mainState.userInfo.value;
        return ListView(
          children: [
            SizedBox(height: 10),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Get.toNamed(RouteConfig.bank_card_list + '?isSelect=1');
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
                        Text(selectCard.id != null ? selectCard.cardNumber : '添加银行卡', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
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
                    suffixIcon: InkWell(
                      onTap: (){
                        _moneyController.text = userinfo.userMoney;
                      },
                      child: Text('全部', style: TextStyle(fontSize: 15)),
                    ),
                    key: GlobalKey(),
                    controller: _moneyController,
                    labelText: '请输入提现金额',
                    contentPaddingTop: ScreenUtil().setWidth(30),
                    labelTop: ScreenUtil().setWidth(55),
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
                  Text('可提现金额：￥${userinfo.userMoney}', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_48)),
                  SizedBox(height: 20),
                  RadiusButton('确认提现', width: 1000,onTap: (){
                    final Map<String, dynamic> data = {};
                    data['money'] = _moneyController.text;
                    data['card_id'] = selectCard.id;
                    logic.onApplyWithdraw(data);
                  },),
                  SizedBox(height: 20),
                  Text('预计2小时到账', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_48)),
                ],
              ),
            )
          ],
        );
      })
    );
  }
}
