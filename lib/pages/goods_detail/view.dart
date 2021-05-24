import 'dart:ui';
import 'package:egou_app/models/goods_detail.dart';
import 'package:egou_app/models/order.dart';
import 'package:egou_app/pages/main/logic.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
  final MainLogic mainLogic = Get.put(MainLogic());
  final GoodsDetailState state = Get.find<GoodsDetailLogic>().state;
  Future _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = logic.onGetGoodsDetail();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx((){
            final bool isCollect = state.is_collect.value == 1;
            return Scaffold(
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
                        state.tabIndex.value == 0 ? Container(
                            color: Colors.white,
                            child: HtmlWidget(state.goodsDetail.value.content,textStyle: TextStyle(fontSize: 14),
                            )
                        ) : _Comment()
                      ],
                    ),
                  )),
                  Container(
                    height: ScreenUtil().setWidth(200),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(top: BorderSide(width: 1, color: AppColors.COLOR_GRAY_DDDDDD))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            logic.onCollectGoods({'is_collect': isCollect ? 0 : 1,
                              'goods_id': state.goodsDetail.value.id});
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(isCollect ? AppImages.ICON_22 : AppImages.ICON_21, width: ScreenUtil().setWidth(71), height: ScreenUtil().setWidth(71)),
                              Text('${isCollect ? '已' : ''}收藏', style: TextStyle(
                                  fontSize: AppFontsize.SIZE_32, color: AppColors.COLOR_BLACK_000000
                              ))
                            ],
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            mainLogic.onChangePageIndex(2);
                            Get.offAllNamed(RouteConfig.main_page + '?pageIndex=2');
                          },
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
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                onShowSheet('cart');
                              },
                              child: Container(
                                  width: ScreenUtil().setWidth(339),
                                  height: ScreenUtil().setWidth(138),
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
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                onShowSheet('pay');
                              },
                              child: Container(
                                  width: ScreenUtil().setWidth(339),
                                  height: ScreenUtil().setWidth(138),
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
          });
        }
        return SizedBox();
      });
  }

  void onShowSheet(String type) {
    showMaterialModalBottomSheet(
        context: context,
        duration: Duration(milliseconds: 200),
        builder: (BuildContext context) => Obx(() {
          final List<GoodsSpec> goodsSpec = state.goodsDetail.value.goodsSpec;
          final List<GoodsItem> goodsItem = state.goodsDetail.value.goodsItem;
          final List selectedGoodsSpec = state.selectedGoodsSpec.value;
          final List selectedGoodsSpecIds = state.selectedGoodsSpecIds.value;
          GoodsItem selectedGoodsItem = GoodsItem();
          if (selectedGoodsSpecIds.length == selectedGoodsSpec.length) {
            goodsItem.forEach((element) {
              if (element.specValueIds == selectedGoodsSpecIds.join(',')){
                selectedGoodsItem = element;
              }
            });
          }
          if (selectedGoodsItem.id != null && selectedGoodsItem.stock <= 0) {
            EasyLoading.showToast('库存不足');
          }
          return Container(
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
                                  child: Image.network(selectedGoodsItem.id != null ? selectedGoodsItem.image : state.goodsDetail.value.image, fit:BoxFit.cover),
                                ),
                                Price(price:selectedGoodsItem.id != null ? selectedGoodsItem.price : state.goodsDetail.value.price,)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(goodsSpec.length, (i) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  Text(goodsSpec[i].name, style: TextStyle(
                                      fontSize: AppFontsize.SIZE_48,
                                      color: AppColors.COLOR_BLACK_000000
                                  )),
                                  SizedBox(height: 20),
                                  Wrap(
                                    spacing: 10,
                                    runSpacing: 10,
                                    children: List.generate(goodsSpec[i].specValue.length, (index) =>  _specItem(goodsSpec[i], goodsSpec[i].specValue[index])),
                                  ),
                                ],
                              )) ,
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('购买数量', style: TextStyle(
                                    fontSize: AppFontsize.SIZE_48,
                                    color: AppColors.COLOR_BLACK_000000
                                )),
                                Obx(() => Counter(leftTap: (){
                                  if (selectedGoodsItem.id == null){
                                    EasyLoading.showToast('请先选择规格');
                                  } else {
                                    if (state.num.value > 1) {
                                      logic.onChangeNum(state.num.value - 1);
                                    }
                                  }

                                },rightTap: () {
                                  if (selectedGoodsItem.id == null){
                                    EasyLoading.showToast('请先选择规格');
                                  } else {
                                    if (state.num.value <  selectedGoodsItem.stock) {
                                      logic.onChangeNum(state.num.value + 1);
                                    }
                                  }
                                },num: state.num.value))
                              ],
                            )
                          ],
                        ) ,
                      )),
                      GestureDetector(
                        onTap: (){
                          bool isPass = true;
                          for (var i = selectedGoodsSpec.length - 1; i >= 0; i -- ) {
                            if (selectedGoodsSpec[i].specValue.length == 0) {
                              isPass = false;
                              EasyLoading.showToast('请选择${selectedGoodsSpec[i].name}');
                              continue;
                            }
                          }
                          if (isPass) {
                            final Map<String, dynamic> data = {};
                            data['item_id'] = selectedGoodsItem.id;
                            data['image'] = state.goodsDetail.value.image;
                            data['name'] = state.goodsDetail.value.name;
                            data['num'] = state.num.value;
                            data['price'] = selectedGoodsItem.price;
                            data['id'] = state.goodsDetail.value.id;
                            if (selectedGoodsItem.stock > 0) {
                              mainLogic.onSelectOrderGoods([OrderGoodsModelFromJson(data)]);
                              if (type == 'pay') {
                                Get.toNamed(RouteConfig.confirm_order);
                              } else if (type == 'cart'){
                                logic.onAddCart({
                                  'item_id':  selectedGoodsItem.id,
                                  'goods_num': state.num.value
                                });
                              }
                            } else {
                              EasyLoading.showToast('库存不足');
                            }
                          }
                        },
                        child: Container(
                          height: ScreenUtil().setWidth(282),
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border(top:BorderSide(color: AppColors.COLOR_GRAY_C9C9C9, width: 1))
                          ),
                          child: RadiusButton(type == 'cart' ? '加入购物车' : '立即购买'),
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
          );
        })
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
            behavior: HitTestBehavior.opaque,
            onTap: (){
              logic.onChangeTabIndex(0);
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
                    state.tabIndex.value == 0 ? Container(
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
              logic.onChangeTabIndex(1);
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
                      state.tabIndex.value == 1 ? Container(
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

  Widget _specItem(GoodsSpec goodsSpec, SpecValue specValue) {

    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          logic.onChangeSelectedGoodsSpec(goodsSpec.id, specValue);
        },
        child: Obx(() {
          final List selectedGoodsSpecIds = state.selectedGoodsSpecIds.value;
          return  Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                  border: selectedGoodsSpecIds.indexOf(specValue.id) != -1 ? Border.all(color:AppColors.COLOR_PRIMARY_D22315) : Border.all(color:AppColors.COLOR_GRAY_C9C9C9)
              ),
              child: Text(specValue.value, style: TextStyle(
                  color:  selectedGoodsSpecIds.indexOf(specValue.id) != -1 ?  AppColors.COLOR_PRIMARY_D22315 : AppColors.COLOR_BLACK_000000,
                  fontSize: AppFontsize.SIZE_42
              ))
          );
        })
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
