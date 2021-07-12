import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/models/user.dart';
import 'package:egou_app/models/user_account_log.dart';
import 'package:egou_app/pages/main/logic.dart';
import 'package:egou_app/pages/main/state.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/constant/app_enums.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';



class BalancePage extends StatefulWidget {
  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  final BalanceLogic logic = Get.put(BalanceLogic());
  final BalanceState state = Get.find<BalanceLogic>().state;
  final MainState mainState = Get.find<MainLogic>().state;
  String type = Get.parameters['type'];

  Map<String, dynamic> getTitle(type) {
    if (type == balanceType.balance.toString()) {
      return {
        'text': '余额',
        'source': 1
      };
    }
    if (type == balanceType.goldcoin.toString()) {
      return {
        'text': '金牛',
        'source': 5
      };
    }
    if (type == balanceType.silvercoin.toString()) {
      return {
        'text': '金马',
        'source': 2
      };
    }
  }

  bool isShowWithDrawalBtn() {
    if (type == balanceType.balance.toString()) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: logic.onGetAccountLog({'source': getTitle(type)['source']}),builder: (BuildContext context, AsyncSnapshot snapshot){
      if (snapshot.connectionState == ConnectionState.done) {
        return Obx(() {
          final List accounLogList = state.accounLogList.value;
          final UserInfoModel userinfo = mainState.userInfo.value;
          String amount = '0.00';
          bool isShowUnit = true;
          String logTitle = '';
          if (getTitle(type)['source'] == 1) {
            amount = userinfo.userMoney;
            logTitle = '余额明细';
          }
          if (getTitle(type)['source'] == 5) {
            amount = userinfo.userIntegral.toString();
            isShowUnit = false;
            logTitle = '收益记录';
          }
          if (getTitle(type)['source'] == 2) {
            amount = userinfo.gold.toString();
            isShowUnit = false;
            logTitle = '收益记录';
          }
          return Scaffold(
            appBar: CustomAppBar(
              leading: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
              title:  getTitle(type)['text'],
              backgroundColor: AppColors.COLOR_PRIMARY_D22315,
              textColor:Colors.white ,
            ),
            body:  EasyRefresh.custom(
              header: BallPulseHeader(color: AppColors.COLOR_PRIMARY_D22315),
              footer: BallPulseFooter(color: AppColors.COLOR_PRIMARY_D22315),
              onRefresh: () async => await logic.onGetAccountLog({'source': getTitle(type)['source']}),
              onLoad: () async => await logic.onLoadMore({'source': getTitle(type)['source']}),
              slivers: [
                SliverToBoxAdapter(child: Container(
                    color: AppColors.COLOR_PRIMARY_D22315,
                    height: ScreenUtil().setWidth(500),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Price(isShowUnit: isShowUnit, price: amount, color: Colors.white, mainAxisAlignment: MainAxisAlignment.center,size: AppFontsize.SIZE_67, unitSize: 15,),
                        SizedBox(height: 20,),
                        isShowWithDrawalBtn() ? GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Get.toNamed(RouteConfig.withdrawal_page);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: ScreenUtil().setWidth(446),
                            height: ScreenUtil().setWidth(140),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(AppRadius.RADIUS_20)
                            ),
                            child: Text('去提现', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315)),
                          ),
                        ): SizedBox()
                      ],
                    )
                )),
                SliverToBoxAdapter(child: Padding(padding: EdgeInsets.all(20),child:Text(logTitle, style: TextStyle(color: Colors.black, fontSize: AppFontsize.SIZE_56, fontWeight: FontWeight.bold))),),
                SliverPadding(padding: EdgeInsets.fromLTRB(15, 0,15, 15), sliver: SliverList(delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index){
                      return _balanceRecord(accounLogList[index]);
                    },
                    childCount: accounLogList.length
                )))
              ],
            )
          );
        });
      }
      return SpinKit();
    });
  }

  Widget _AppBar(context) {
    return Positioned(
        top: 0,
        left: 0,
        height: kToolbarHeight + MediaQuery.of(context).padding.top,
        width: MediaQuery.of(context).size.width,
        child: CustomAppBar(
          leading: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
          title:  '余额',
          backgroundColor: AppColors.COLOR_PRIMARY_D22315,
          textColor: AppColors.COLOR_BLACK_333333 ,
        )
    );
  }

  Widget _balanceRecord(UserAccountLogListModel item) {
    print(item);
    return Container(
      height: ScreenUtil().setWidth(353),
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color:Colors.white
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.sourceType, style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
          SizedBox(height: 15,),
          Row(
            children: [
              Text(getTitle(type)['text'],  style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_46)),
              SizedBox(width: 20,),
              Text(item.changeAmount,  style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_46, height: 1.5)),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Text('创建时间',  style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_46)),
              SizedBox(width: 20,),
              Text(item.createTime,  style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_46, height: 1.5)),
            ],
          )
        ],
      ),
    );
  }
}
