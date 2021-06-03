import 'dart:math';

import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/constant/app_enums.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/models/bank_card_list.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';


class BankCardListPage extends StatefulWidget {
  @override
  _BankCardListPageState createState() => _BankCardListPageState();
}

class _BankCardListPageState extends State<BankCardListPage> {
  final BankCardListLogic logic = Get.put(BankCardListLogic());
  final BankCardListState state = Get.find<BankCardListLogic>().state;
  
  Future _future;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = logic.onGetBankCardList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _future, builder: (BuildContext context, AsyncSnapshot snapshot){
      if (snapshot.connectionState == ConnectionState.done) {
        return Scaffold(
          appBar: CustomAppBar(
            leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),
            title: '绑定收款码/银行卡',
          ),
          body: SafeArea(
            child: Obx((){
              final List bankCardList = state.bankCardList.value;
              BankCardListModel wechatBankCardTypeItem = BankCardListModel();
              BankCardListModel aliBankCardTypeItem = BankCardListModel();
              bankCardList.forEach((element) {
                if (element.type == CardListType.wachat) {
                  wechatBankCardTypeItem = element;
                }
                if (element.type == CardListType.ali) {
                  aliBankCardTypeItem = element;
                }
              });
              return Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Expanded(child: EasyRefresh.custom(
                      header: MaterialHeader(),
                      footer: MaterialFooter(enableInfiniteLoad: false),
                      onRefresh: () async => await logic.onGetBankCardList() ,
                      onLoad:  () async => await logic.onLoadMore(),
                      slivers: <Widget>[
                        SliverList(delegate: SliverChildListDelegate([
                          _CardItem(AppImages.CARD_LOGO_3, '微信号', wechatBankCardTypeItem.cardNumber, qrcode: wechatBankCardTypeItem.image, onTap: () {
                            logic.onSelectedBankCard(wechatBankCardTypeItem);
                            Get.toNamed(RouteConfig.make_qrcode+'?type=${CardListType.wachat}');
                          }),
                          _CardItem(AppImages.CARD_LOGO_4, '支付宝账号', aliBankCardTypeItem.cardNumber, qrcode:  aliBankCardTypeItem.image, onTap: () {
                            logic.onSelectedBankCard(aliBankCardTypeItem);
                            Get.toNamed(RouteConfig.make_qrcode+'?type=${CardListType.ali}');
                          }),
                        ])),
                        SliverList(
                          delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                            BankCardTypeItem bankCardTypeItem = BankCardTypeItem();
                            BankCardTypeList.forEach((element) {
                              if(element.type ==  bankCardList[index].backType) {
                                bankCardTypeItem = element;
                              }
                            });
                            return _CardItem(AppImages.CARD_LOGO_2,  bankCardList[index].backCardType, bankCardList[index].cardNumber, cardType: bankCardTypeItem.text, onTap: (){
                              logic.onSelectedBankCard( bankCardList[index]);
                              Get.toNamed(RouteConfig.bind_card);
                            });
                          }, childCount:bankCardList.length),
                        ),
                        SliverToBoxAdapter(child:   _AddCardBtn(),)
                      ],
                    ) )
                  ],
                ) ,
              );
            }),
          ),
        );
      }
      return SpinKit();
    });
  }


  Widget _CardItem(String icon, String title,String subtitle, { String qrcode, String cardType, Function onTap }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap != null ? onTap : (){},
      child: Container(
        padding: EdgeInsets.all(AppSpace.SPACE_50),
        margin: EdgeInsets.only(bottom: AppSpace.SPACE_50),
        height: ScreenUtil().setWidth(344),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.RADIUS_30),
          boxShadow: [BoxShadow(color: AppColors.COLOR_GRAY_E7E8E8, blurRadius: 10.0, spreadRadius: 0)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(icon, width: ScreenUtil().setWidth(150), height: ScreenUtil().setWidth(150)),
                SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        title != null ? Text(title, style: TextStyle(color: Colors.black, fontSize: AppFontsize.SIZE_50)): SizedBox(),
                        SizedBox(width: 20,),
                        cardType != null ? Text(cardType, style: TextStyle(color:AppColors.COLOR_GRAY_9E9E9E, fontSize: AppFontsize.SIZE_42)) : SizedBox()
                      ],
                    ),
                    SizedBox(height: 15),
                    subtitle !=null? Text(subtitle, style: TextStyle(color: Colors.black, fontSize: AppFontsize.SIZE_56)):SizedBox(),
                  ],
                )
              ],
            ),
            Row(
              children: [
                qrcode != null ?   Image.network(qrcode, width: ScreenUtil().setWidth(150), height: ScreenUtil().setWidth(150)) : SizedBox(),
                Icon(Icons.keyboard_arrow_right_sharp, size: 30, color: AppColors.COLOR_GRAY_999999)
              ],
            )
          ],
        ),
      ),
    );
  }


  Widget _AddCardBtn() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Get.toNamed(RouteConfig.bind_card);
      },
      child:Container(
        padding: EdgeInsets.all(AppSpace.SPACE_50),
        margin: EdgeInsets.only(bottom: AppSpace.SPACE_50),
        height: ScreenUtil().setWidth(200),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.RADIUS_30),
          boxShadow: [BoxShadow(color: AppColors.COLOR_GRAY_E7E8E8, blurRadius: 10.0, spreadRadius: 0)],
        ),
        child: Row(
          children: [
            Image.asset(AppImages.ADD_CARD_ICON, width: ScreenUtil().setWidth(56), height: ScreenUtil().setWidth(56),),
            SizedBox(width: 20,),
            Text('添加银行卡', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_40)),
          ],
        ),
      ) ,
    );
  }
}