import 'dart:ui';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
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


class GoodsDetailPage extends StatefulWidget {
  @override
  _GoodsDetailPageState createState() => _GoodsDetailPageState();
}

class _GoodsDetailPageState extends State<GoodsDetailPage> {
  final GoodsDetailLogic logic = Get.put(GoodsDetailLogic());
  final GoodsDetailState state = Get.find<GoodsDetailLogic>().state;

  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333), title: state.goodsDetail.value.name),
      body: Column(
        children: [
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                DetailSwiper(state.goodsDetail.value.goodsImage),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(AppSpace.SPACE_52),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(state.goodsDetail.value.name, style: TextStyle(
                          fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_333333
                      )),
                      SizedBox(height:15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Price(price: state.goodsDetail.value.price,),
                          Text('已售: ${state.goodsDetail.value.salesSum}', style: TextStyle(
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
                tabIndex == 0 ? Container(
                    color: Colors.white,
                    child: HtmlWidget(state.goodsDetail.value.content,textStyle: TextStyle(fontSize: 14),
                    )
                ) : _Comment()
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
    ));
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
            behavior: HitTestBehavior.opaque,
            onTap: (){
              setState(() {
                this.tabIndex = 0;
              });
            },
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                  children: [
                    Text('商品介绍', style: TextStyle(
                        fontSize: AppFontsize.SIZE_54,
                        color: AppColors.COLOR_BLACK_222222
                    )),
                    SizedBox(height: 10),
                    tabIndex == 0 ? Container(
                      width: ScreenUtil().setWidth(102),
                      height: ScreenUtil().setWidth(10),
                      decoration: BoxDecoration(
                          color: AppColors.COLOR_PRIMARY_D22315,
                          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10))
                      ),
                    ): SizedBox()
                  ]
              ) ,
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){
              setState(() {
                this.tabIndex = 1;
              });
            },
            child:Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                    children: [
                      Text('评价', style: TextStyle(
                          fontSize: AppFontsize.SIZE_54,
                          color: AppColors.COLOR_BLACK_222222
                      )),
                      SizedBox(height: 10),
                      tabIndex == 1 ? Container(
                        width: ScreenUtil().setWidth(102),
                        height: ScreenUtil().setWidth(10),
                        decoration: BoxDecoration(
                            color: AppColors.COLOR_PRIMARY_D22315,
                            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10))
                        ),
                      ): SizedBox()
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


  Widget _Comment() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      alignment: Alignment.center,
      child: Column(
        children: [
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                decoration: BoxDecoration(
                  border:Border.all(width: 1, color: AppColors.COLOR_PRIMARY_D22315),
                  borderRadius: BorderRadius.circular(AppRadius.RADIUS_8)
                ),
                child: Text('性价比高(4)', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_44)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                decoration: BoxDecoration(
                    border:Border.all(width: 1, color: AppColors.COLOR_PRIMARY_D22315),
                    borderRadius: BorderRadius.circular(AppRadius.RADIUS_8)
                ),
                child: Text('质量超好(4)', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_44)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                decoration: BoxDecoration(
                    border:Border.all(width: 1, color: AppColors.COLOR_PRIMARY_D22315),
                    borderRadius: BorderRadius.circular(AppRadius.RADIUS_8)
                ),
                child: Text('手感不多(8)', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_44)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                decoration: BoxDecoration(
                    border:Border.all(width: 1, color: AppColors.COLOR_PRIMARY_D22315),
                    borderRadius: BorderRadius.circular(AppRadius.RADIUS_8)
                ),
                child: Text('性价比高(7)', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_44)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                decoration: BoxDecoration(
                    border:Border.all(width: 1, color: AppColors.COLOR_PRIMARY_D22315),
                    borderRadius: BorderRadius.circular(AppRadius.RADIUS_8)
                ),
                child: Text('性价比高(4)', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_44)),
              )
            ],
          ),
          SizedBox(height: 15),
          Divider(height: 1, color: AppColors.COLOR_GRAY_DDDDDD,),
          SizedBox(height: 15),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: ScreenUtil().setWidth(128),
                            height: ScreenUtil().setWidth(128),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular( ScreenUtil().setWidth(128)),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(AppImages.APP_LOGO, fit: BoxFit.cover)
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('麻**夜', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                            Text('9天前 | 尺码：英码4', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_40))
                          ],
                        )
                      ],
                    ),
                    Text('浏览12次', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_40)),
                  ],
                ),
                SizedBox(height: 10),
                Text('物美价廉物美价廉物美价廉物美价廉物美价廉物美价廉物美价廉', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                SizedBox(height: 10),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    Image.network(AppImages.GOODS_IMG_1, width: ScreenUtil().setWidth(330), height:  ScreenUtil().setWidth(330),),
                    Image.network(AppImages.GOODS_IMG_1, width: ScreenUtil().setWidth(330), height:  ScreenUtil().setWidth(330),),
                    Image.network(AppImages.GOODS_IMG_1, width: ScreenUtil().setWidth(330), height:  ScreenUtil().setWidth(330),)
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: ScreenUtil().setWidth(128),
                            height: ScreenUtil().setWidth(128),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular( ScreenUtil().setWidth(128)),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(AppImages.APP_LOGO, fit: BoxFit.cover)
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('麻**夜', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                            Text('9天前 | 尺码：英码4', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_40))
                          ],
                        )
                      ],
                    ),
                    Text('浏览12次', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_40)),
                  ],
                ),
                SizedBox(height: 10),
                Text('物美价廉物美价廉物美价廉物美价廉物美价廉物美价廉物美价廉', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                SizedBox(height: 10),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    Image.network(AppImages.GOODS_IMG_1, width: ScreenUtil().setWidth(330), height:  ScreenUtil().setWidth(330),),
                    Image.network(AppImages.GOODS_IMG_1, width: ScreenUtil().setWidth(330), height:  ScreenUtil().setWidth(330),),
                    Image.network(AppImages.GOODS_IMG_1, width: ScreenUtil().setWidth(330), height:  ScreenUtil().setWidth(330),)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
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
