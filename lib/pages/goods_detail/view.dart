import 'dart:ui';

import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'logic.dart';
import 'state.dart';

class GoodsDetailPage extends StatelessWidget {
  final GoodsDetailLogic logic = Get.put(GoodsDetailLogic());
  final GoodsDetailState state = Get.find<GoodsDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '商品名称'),
      body: Column(
        children: [
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                DetailSwiper(state.BannerList.value),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(AppSpace.SPACE_52),
                  child: Column(
                    children: [
                      Text('商品介绍商品介绍商商品介绍商品介绍商商品介绍商品介绍商商品介绍商品介绍商', style: TextStyle(
                          fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_333333
                      )),
                      SizedBox(height:15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Price(),
                          Text('已售: 208', style: TextStyle(
                              fontSize: AppFontsize.SIZE_41,
                              color: AppColors.COLOR_BLACK_333333
                          ))
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(AppSpace.SPACE_52),
                  margin: EdgeInsets.only(top: AppSpace.SPACE_35),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right:AppSpace.SPACE_52),
                            child: Text('服务', style: TextStyle(
                                fontSize: AppFontsize.SIZE_46,
                                color: AppColors.COLOR_GRAY_999999
                            )),
                          ),
                          Row(
                            children: [
                              _dot(),
                              Text('假一赔十', style: TextStyle(
                                  fontSize: AppFontsize.SIZE_46,
                                  color: AppColors.COLOR_BLACK_222222
                              )),
                              _dot(),
                              Text('极速退款', style: TextStyle(
                                  fontSize: AppFontsize.SIZE_46,
                                  color: AppColors.COLOR_BLACK_222222
                              ))
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right:AppSpace.SPACE_52),
                            child: Text('运费', style: TextStyle(
                                fontSize: AppFontsize.SIZE_46,
                                color: AppColors.COLOR_GRAY_999999
                            )),
                          ),
                          Row(
                            children: [
                              Text('¥ 0.00', style: TextStyle(
                                  fontSize: AppFontsize.SIZE_46,
                                  color: AppColors.COLOR_BLACK_222222
                              ))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                _goodsTab(),
                Container(
                  height: 500,
                  color: Colors.white,
                  child:  Image.network(AppImages.GOODS_IMG_1, fit: BoxFit.cover)
                )
              ],
            ),
          )),
          Container(
            height: ScreenUtil().setWidth(250),
            decoration: BoxDecoration(
                color: Colors.white,
              border: Border(top: BorderSide(width: 1, color: AppColors.COLOR_GRAY_DDDDDD))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 GestureDetector(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Image.asset(AppImages.ICON_21, width: ScreenUtil().setWidth(71), height: ScreenUtil().setWidth(71)),
                       Text('收藏', style: TextStyle(
                         fontSize: AppFontsize.SIZE_32, color: AppColors.COLOR_BLACK_000000
                       ))
                     ],
                   ),
                 ),
                  GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.ICON_23, width: ScreenUtil().setWidth(71), height: ScreenUtil().setWidth(71)),
                        Text('购物车', style: TextStyle(
                            fontSize: AppFontsize.SIZE_32, color: AppColors.COLOR_BLACK_000000
                        ))
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showMaterialModalBottomSheet(
                            context: context,
                            duration: Duration(milliseconds: 200),
                            builder: (BuildContext context) => Container(
                              height: 500,
                              color: Colors.white,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Column(
                                    children: [
                                      Expanded(child: SingleChildScrollView(
                                        padding: EdgeInsets.all(AppSpace.SPACE_40),
                                        child:  Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                  width: ScreenUtil().setWidth(366),
                                                  height: ScreenUtil().setWidth(366),
                                                  margin: EdgeInsets.only(right: 20),
                                                  child: Image.network(AppImages.GOODS_IMG_1, fit:BoxFit.cover),
                                                ),
                                                Price()
                                              ],
                                            ),
                                            SizedBox(height: 20),
                                            Text('尺码', style: TextStyle(
                                                fontSize: AppFontsize.SIZE_48,
                                                color: AppColors.COLOR_BLACK_000000
                                            )),
                                            SizedBox(height: 20),
                                            Wrap(
                                              spacing: 10,
                                              runSpacing: 10,
                                              children: [
                                                _specItem(),
                                                _specItem(),
                                                _specItem(),
                                                _specItem(),
                                                _specItem(),
                                                _specItem(),
                                                _specItem(),
                                                _specItem(),
                                                _specItem(),
                                              ],
                                            ),
                                            SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('购买数量', style: TextStyle(
                                                    fontSize: AppFontsize.SIZE_48,
                                                    color: AppColors.COLOR_BLACK_000000
                                                )),
                                                Counter()
                                              ],
                                            )
                                          ],
                                        ) ,
                                      )),
                                      GestureDetector(
                                        onTap: (){
                                          Get.toNamed(RouteConfig.confirm_order);
                                        },
                                        child: Container(
                                          height: ScreenUtil().setWidth(282),
                                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border: Border(top:BorderSide(color: AppColors.COLOR_GRAY_C9C9C9, width: 1))
                                          ),
                                          child: RadiusButton('立即购买'),
                                        ),
                                      )
                                    ],
                                  ),
                                  Positioned(
                                    top: 15,
                                    right: 15,
                                    child: GestureDetector(
                                      onTap: () {Get.back(result: 'success');},
                                      child: Icon(Icons.close, color: AppColors.COLOR_GRAY_707070,),
                                    )
                                  )
                                ],
                              )
                            )
                          );
                        },
                        child: Container(
                          width: ScreenUtil().setWidth(339),
                          height: ScreenUtil().setWidth(158),
                            alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.COLOR_BLACK_000000,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(AppRadius.RADIUS_8),bottomLeft: Radius.circular(AppRadius.RADIUS_8) )
                          ),
                          child: Text('加入购物车', style: TextStyle(
                            fontSize: AppFontsize.SIZE_48,
                            color: Colors.white
                          ))
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(RouteConfig.confirm_order);
                        },
                        child: Container(
                            width: ScreenUtil().setWidth(339),
                            height: ScreenUtil().setWidth(158),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColors.COLOR_PRIMARY_D22315,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(AppRadius.RADIUS_8),bottomRight: Radius.circular(AppRadius.RADIUS_8) )
                            ),
                            child: Text('立即购买', style: TextStyle(
                                fontSize: AppFontsize.SIZE_48,
                                color: Colors.white
                            ))
                        ),
                      )
                    ],
                  )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _dot() {
    return Container(
      width: ScreenUtil().setWidth(13),
      height: ScreenUtil().setWidth(13),
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      decoration: BoxDecoration(
        color: AppColors.COLOR_BLACK_222222,
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(13))
      ),
    );
  }

  Widget _goodsTab() {
    return Container(
      margin: EdgeInsets.only(top: AppSpace.SPACE_35),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(width: 1, color: AppColors.COLOR_GRAY_EAEAEA))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                  children: [
                    Text('商品介绍', style: TextStyle(
                        fontSize: AppFontsize.SIZE_54,
                        color: AppColors.COLOR_BLACK_222222
                    )),
                    SizedBox(height: 10),
                    Container(
                      width: ScreenUtil().setWidth(102),
                      height: ScreenUtil().setWidth(10),
                      decoration: BoxDecoration(
                          color: AppColors.COLOR_PRIMARY_D22315,
                          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10))
                      ),
                    )
                  ]
              ) ,
            ),
          ),
          GestureDetector(
            child:Padding(
              padding: EdgeInsets.all(15),
                child: Column(
                    children: [
                      Text('评价', style: TextStyle(
                          fontSize: AppFontsize.SIZE_54,
                          color: AppColors.COLOR_BLACK_222222
                      )),
                    ]
                )
              ),
          )
        ],
      ),
    );
  }

  Widget _specItem() {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
            border: Border.all(color:AppColors.COLOR_GRAY_C9C9C9)
          ),
         child: Text('英码1', style: TextStyle(
           color: AppColors.COLOR_BLACK_000000,
           fontSize: AppFontsize.SIZE_42
         ))
      )
    );
  }
}

class GoodsDetailRichText extends InlineSpan{
  @override
  void build(ParagraphBuilder builder, {double textScaleFactor = 1.0, List<PlaceholderDimensions> dimensions}) {
    // TODO: implement build
  }

  @override
  int codeUnitAtVisitor(int index, Accumulator offset) {
    // TODO: implement codeUnitAtVisitor
    throw UnimplementedError();
  }

  @override
  RenderComparison compareTo(InlineSpan other) {
    // TODO: implement compareTo
    throw UnimplementedError();
  }

  @override
  void computeSemanticsInformation(List<InlineSpanSemanticsInformation> collector) {
    // TODO: implement computeSemanticsInformation
  }

  @override
  void computeToPlainText(StringBuffer buffer, {bool includeSemanticsLabels = true, bool includePlaceholders = true}) {
    // TODO: implement computeToPlainText
  }

  @override
  InlineSpan getSpanForPositionVisitor(TextPosition position, Accumulator offset) {
    // TODO: implement getSpanForPositionVisitor
    throw UnimplementedError();
  }

  @override
  bool visitChildren(visitor) {
    // TODO: implement visitChildren
    throw UnimplementedError();
  }

}
