import 'package:egou_app/common/routes.dart';
import 'package:egou_app/common/utils.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/models/shop_info.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class DiscountPayPage extends StatefulWidget {
  const DiscountPayPage({Key key}) : super(key: key);

  @override
  _DiscountPayPageState createState() => _DiscountPayPageState();
}

class _DiscountPayPageState extends State<DiscountPayPage> {
  final DiscountPayLogic logic = Get.put(DiscountPayLogic());
  final DiscountPayState state = Get.find<DiscountPayLogic>().state;
  TextEditingController _amountController = TextEditingController();

  void _onChanged(val){
    final ShopInfoModel shopInfo = state.shopInfo.value;
    final int _rate = shopInfo.proportion;
    if (val.isNotEmpty) {
      final _rateValue = Utils.div(double.parse(_rate.toString()), 100);
      logic.onChangeIncome(Utils.mul(double.parse(val), _rateValue).toString());
    } else {
      logic.onChangeIncome('0.00');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: logic.onShopInfo(), builder: (BuildContext context, AsyncSnapshot snapshot){
      if(snapshot.connectionState == ConnectionState.done) {
        return Scaffold(
          appBar: CustomAppBar(
            leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),
            title: '优惠买单',
            actions: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Get.toNamed(RouteConfig.discount_pay_record);
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 15),
                  child: Text('买单记录', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_48)),
                ),
              )
            ],
          ),
          body: SafeArea(
            child: Obx((){
              final ShopInfoModel shoInfo = state.shopInfo.value;
              return  ListView(
                children: [
                  SizedBox(height: 10,),
                  Container(
                    height: ScreenUtil().setWidth(491),
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: ScreenUtil().setWidth(240),
                          height: ScreenUtil().setWidth(240),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(240)),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(AppImages.APP_LOGO, fit: BoxFit.cover),
                        ),
                        SizedBox(height: ScreenUtil().setWidth(43),),
                        Text(shoInfo.name, style: TextStyle(color: Colors.black, fontSize: AppFontsize.SIZE_56))
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('订单金额', style: TextStyle(color: Colors.black, fontSize: AppFontsize.SIZE_40)),
                        SizedBox(height: 15,),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: AppColors.COLOR_GRAY_707070, width: ScreenUtil().setWidth(1)))
                          ),
                          child: Row(
                            children: [
                              Text('￥', style: TextStyle(color: Colors.black, fontSize: AppFontsize.SIZE_80, fontWeight: FontWeight.bold),),
                              SizedBox(width: 15,),
                              Expanded(child: TextField(
                                controller: _amountController,
                                onChanged: _onChanged,
                                style: TextStyle(color:  Colors.black, fontSize: AppFontsize.SIZE_80, fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                  labelText: '请询问店员后输入',
                                  border: InputBorder.none,
                                  alignLabelWithHint: true,
                                  isCollapsed: true,
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  labelStyle: TextStyle(color: AppColors.COLOR_GRAY_CCCCCC, fontSize: AppFontsize.SIZE_56, fontWeight: FontWeight.normal),
                                ),
                              ))
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Text('可获得', style: TextStyle(color: Colors.black, fontSize: AppFontsize.SIZE_40)),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                              margin: EdgeInsets.only(left: 5, right: 5),
                              color: AppColors.COLOR_GRAY_F7F7F7,
                              child: Text(state.income.value, style: TextStyle(color: Colors.black, fontSize: AppFontsize.SIZE_40)),
                            ),
                            Text('金马', style: TextStyle(color: Colors.black, fontSize: AppFontsize.SIZE_40)),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Text('（可免费兑换海量云仓爆品及本地爆品）', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_40)),
                        Container(
                          margin: EdgeInsets.only(top:  40, bottom: 20),
                          alignment: Alignment.center,
                          child:  RadiusButton('和店员已确认，立即买单', onTap: (){
                            logic.onOrderBuy(_amountController.text);
                          },),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        );
      }
      return SpinKit();
    });
  }
}
