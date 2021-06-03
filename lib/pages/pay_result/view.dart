import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/goods_item.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';


class PayResultPage extends StatefulWidget {
  @override
  _PayResultPageState createState() => _PayResultPageState();
}

class _PayResultPageState extends State<PayResultPage> {
  final PayResultLogic logic = Get.put(PayResultLogic());
  final PayResultState state = Get.find<PayResultLogic>().state;
  Future _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = logic.onCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:_future,builder: (BuildContext context, AsyncSnapshot snapshot){
      if (snapshot.connectionState == ConnectionState.done) {
        return Scaffold(
          appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '支付结果'),
          body: CustomScrollView(
            slivers: [
              SliverList(delegate: SliverChildListDelegate([
                Container(
                  height: ScreenUtil().setWidth(400),
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.PAY_SUCCESS_ICON, width: ScreenUtil().setWidth(100), height:  ScreenUtil().setWidth(100)),
                      SizedBox(height: 10),
                      Text('支付成功', style: TextStyle(
                          fontSize: AppFontsize.SIZE_56, color: AppColors.COLOR_BLACK_333333
                      ))
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(AppSpace.SPACE_52),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('猜你喜欢', style: TextStyle(
                            fontSize: AppFontsize.SIZE_56,
                            color: AppColors.COLOR_BLACK_333333,
                            fontWeight: FontWeight.bold
                        )),
                      ],
                    )
                )
              ])),
              Obx((){
                final List goodsGuessLike = state.goodsGuessLike.value;
                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio:   ScreenUtil().setWidth(492) / ScreenUtil().setWidth(660),
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      if(index % 2 > 0) {
                        return Padding(
                            padding: EdgeInsets.only(right: AppSpace.SPACE_52),
                            child: GoodsItem(item: goodsGuessLike[index],)
                        );
                      } else {
                        return Padding(
                            padding: EdgeInsets.only(left: AppSpace.SPACE_52),
                            child: GoodsItem(item: goodsGuessLike[index])
                        );
                      }
                    },
                    childCount: goodsGuessLike.length,
                  ),
                );
              }),
              SliverList(delegate: SliverChildListDelegate([
                SizedBox(height: 20)
              ]))
            ],
          ),
        );
      }
      return SpinKit();
    });
  }
}