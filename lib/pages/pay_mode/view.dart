import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/pages/main/logic.dart';
import 'package:egou_app/pages/main/state.dart';
import 'package:egou_app/pages/points_mall/logic.dart';
import 'package:egou_app/pages/points_mall/state.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class PayModePage extends StatefulWidget {
  @override
  _PayModePageState createState() => _PayModePageState();
}

class _PayModePageState extends State<PayModePage> {
  final PayModeLogic logic = Get.put(PayModeLogic());
  final PayModeState state = Get.find<PayModeLogic>().state;
  final MainState mainState = Get.find<MainLogic>().state;

  final FocusNode _focusNode = FocusNode();
  bool isFocus = false;
  String pwd = '';

  @override
  void initState() {
    // TODO: implement initState
    _focusNode.addListener(() {
      if (_focusNode.hasFocus){
        setState(() {
          isFocus = true;
        });

      } else {
        setState(() {
          isFocus = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final int shopType = mainState.shopType.value;
      print(shopType);
      return Scaffold(
        appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '支付方式'),
        body: Column(
          children: [
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(AppSpace.SPACE_52, 0, AppSpace.SPACE_52, 0),
                    margin: EdgeInsets.only(top: AppSpace.SPACE_40),
                    height: ScreenUtil().setWidth(186),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('订单金额', style: TextStyle(
                            fontSize: AppFontsize.SIZE_50,
                            color: AppColors.COLOR_BLACK_000000
                        )),
                        Price()
                      ],
                    ) ,
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(AppSpace.SPACE_52, 0, AppSpace.SPACE_52, AppSpace.SPACE_52),
                    margin: EdgeInsets.only(top: AppSpace.SPACE_40),
                    child: Column(
                      children: [
                        _payModeItem(AppImages.PAY_MODE_ICON_1, '余额支付', num: '3658.00'),
                        shopType != 1 && shopType != 2 ? _payModeItem(AppImages.PAY_MODE_ICON_2, '金币支付', num: '3658.00') : SizedBox(),
                        shopType != 2 ?  _payModeItem(AppImages.PAY_MODE_ICON_3, '银币支付', num: '3658.00') : SizedBox(),
                        _payModeItem(AppImages.PAY_MODE_ICON_4, '微信支付' ),
                        _payModeItem(AppImages.PAY_MODE_ICON_5, '支付宝支付'),
                        SizedBox(height: 20),
                        Container(
                          alignment: Alignment.center,
                          width: ScreenUtil().setWidth(895),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: AppColors.COLOR_PRIMARY_D22315),
                              borderRadius: BorderRadius.circular(AppRadius.RADIUS_20)
                          ),
                          child: Stack(
                            alignment: const FractionalOffset(0.5, 0.5),
                            children: [
                              !isFocus && !pwd.isNotEmpty ? Text('请填写6-20位交易密码',
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(60),
                                      color: AppColors.COLOR_PRIMARY_D22315,
                                      height: ScreenUtil().setHeight(4)
                                  )
                              ): Text(''),
                              TextFormField(
                                focusNode: _focusNode,
                                onChanged: (String val) {setState(() {
                                  pwd = val;
                                });},
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                cursorColor: AppColors.COLOR_PRIMARY_D22315,
                                style: TextStyle(fontSize: ScreenUtil().setSp(60), color: AppColors.COLOR_BLACK_333333),
                                obscureText: true,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                  hasFloatingPlaceholder: false,
                                  focusColor:  AppColors.COLOR_PRIMARY_D22315,
                                  border: InputBorder.none,
                                  // labelText:  '请填写6-20位交易密码',
                                  // labelStyle: TextStyle(fontSize: ScreenUtil().setSp(60), color: AppColors.COLOR_PRIMARY_D22315,  height: ScreenUtil().setHeight(0))
                                ),
                                keyboardType: TextInputType.text,
                              )
                            ],
                          ),
                        )
                      ],
                    ) ,
                  )
                ],
              ),
            )),
            Container(
                height: ScreenUtil().setWidth(250),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(top: BorderSide(width: 1, color: AppColors.COLOR_GRAY_DDDDDD))
                ),
                child: RadiusButton('结算', onTap: (){Get.toNamed(RouteConfig.pay_result);})
            )
          ],
        ),
      );
    });
  }

  Widget _payModeItem(icon, text, {num}) {
    return Container(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(
                width: 1,
                color: AppColors.COLOR_GRAY_EEEEEE
            ))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(icon, width: ScreenUtil().setWidth(74), height: ScreenUtil().setWidth(74)),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(text, style:TextStyle(
                      fontSize: AppFontsize.SIZE_50, color: AppColors.COLOR_BLACK_000000
                  )),
                ),
                num != null ? Row(
                  children: [
                    Text('当前余额: ', style:TextStyle(
                        fontSize: AppFontsize.SIZE_42, color: AppColors.COLOR_GRAY_9E9E9E
                    )),
                    Text(num, style:TextStyle(
                        fontSize: AppFontsize.SIZE_42, color: AppColors.COLOR_PRIMARY_D22315
                    )),
                    Text('元', style:TextStyle(
                        fontSize: AppFontsize.SIZE_42, color: AppColors.COLOR_GRAY_9E9E9E
                    ))
                  ],
                ): Text(''),
              ],
            ),
            Image.asset(AppImages.ICON_5, width: ScreenUtil().setWidth(52), height: ScreenUtil().setWidth(52)),
          ],
        )
    );
  }
}
