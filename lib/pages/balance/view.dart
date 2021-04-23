import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
        title:  '余额',
        backgroundColor: AppColors.COLOR_PRIMARY_D22315,
        textColor:Colors.white ,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: Container(
                  color: AppColors.COLOR_PRIMARY_D22315,
                  height: ScreenUtil().setWidth(666),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Price(price: '88888.00', color: Colors.white, mainAxisAlignment: MainAxisAlignment.center,),
                      SizedBox(height: 20,),
                      Container(
                        alignment: Alignment.center,
                        width: ScreenUtil().setWidth(446),
                        height: ScreenUtil().setWidth(140),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(AppRadius.RADIUS_20)
                        ),
                        child: Text('去提现', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315)),
                      )
                    ],
                  )
              )),
              SliverToBoxAdapter(child: Padding(padding: EdgeInsets.all(20),child:Text('收益记录', style: TextStyle(color: Colors.black, fontSize: AppFontsize.SIZE_56, fontWeight: FontWeight.bold))),),
              SliverPadding(padding: EdgeInsets.fromLTRB(15, 0,15, 15), sliver: SliverList(delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index){
                    return _balanceRecord();
                  },
                  childCount: 10
              )))
            ],
          ),
          // _AppBar(context)
        ],
      ),
    );
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

  Widget _balanceRecord() {
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
          Text('全球团队奖', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
          SizedBox(height: 15,),
          Row(
            children: [
              Text('金额',  style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_46)),
              SizedBox(width: 20,),
              Text('0.30',  style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_46, height: 1.5)),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Text('金额',  style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_46)),
              SizedBox(width: 20,),
              Text('2021-02-01 15:03:03',  style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_46, height: 1.5)),
            ],
          )
        ],
      ),
    );
  }
}
