import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/models/my_collect_item.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

enum ButtonType {border, primary}

class MyStorePage extends StatefulWidget {
  @override
  _MyStorePageState createState() => _MyStorePageState();
}

class _MyStorePageState extends State<MyStorePage> {
  final MyStoreLogic logic = Get.put(MyStoreLogic());
  final MyStoreState state = Get.find<MyStoreLogic>().state;
  Future _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = logic.onGetCollectGoods();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _future,builder: (BuildContext context, AsyncSnapshot snapshot){
      if (snapshot.connectionState == ConnectionState.done) {
        return Obx((){
          final List collectGoods = state.collectGoods.value;
          return Scaffold(
              appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '我的收藏'),
              body: SafeArea(
                  child: Column(
                    children: [
                      collectGoods.length > 0 ? Expanded(child: EasyRefresh.custom(
                        header: BallPulseHeader(color: AppColors.COLOR_PRIMARY_D22315),
                        footer: BallPulseFooter(color: AppColors.COLOR_PRIMARY_D22315),
                        onRefresh: () async => await logic.onGetCollectGoods(),
                        onLoad: () async => await logic.onLoadMore(),
                        slivers: [
                          SliverToBoxAdapter(child:  SizedBox(height: 15),),
                          SliverToBoxAdapter(child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${collectGoods.length}件商品', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                                Divider(),
                              ],
                            ),
                          ),),
                          SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                            return _storeItem(collectGoods[index]);
                          }, childCount: collectGoods.length))
                        ],
                      )) : Empty(text: '列表是空的', btnText: '去逛逛',onTap: () {
                        Get.offAllNamed(RouteConfig.main_page);},)
                    ],
                  )
              )
          );
        });
      }
      return SizedBox();
    });
  }


  Widget _storeItem(MyCollectItemModel item) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 0, 15, 15) ,
      child: Row(
        children: [
          Container(
            width:  ScreenUtil().setWidth(350),
            height:  ScreenUtil().setWidth(350),
            margin: EdgeInsets.only( right: 10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.COLOR_GRAY_F4F4F4, width: 3)
            ),
            child: Image.network(item.image, fit: BoxFit.cover),
          ),
          Expanded(child: Container(
            height:  ScreenUtil().setWidth(350),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_48), maxLines: 2, overflow: TextOverflow.ellipsis,),
                // SizedBox(height: 3),
                // Text('996人收藏', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_36), maxLines: 1),
                Price(price: item.price),
                Row(
                    children: [
                      _CircleButton(ButtonType.border, '加入购物车', () {
                        Get.toNamed(RouteConfig.goods_detail + '?id=' + item.id.toString());
                      }),
                      SizedBox(width: 10),
                      _CircleButton(ButtonType.primary, '立即购买', (){
                        Get.toNamed(RouteConfig.goods_detail + '?id=' + item.id.toString());
                      })
                    ]
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _CircleButton(type, text,Function onTap) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(286),
        height: ScreenUtil().setWidth(92),
        decoration: BoxDecoration(
          color: type == ButtonType.primary ? AppColors.COLOR_PRIMARY_D22315 : Colors.transparent,
          border: Border.all(color: AppColors.COLOR_PRIMARY_D22315, width: 1),
          borderRadius: BorderRadius.circular(92),
        ),
        child: Text(text, style: TextStyle(color: type == ButtonType.primary ? Colors.white : AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_44)),
      ),
    );
  }
}
