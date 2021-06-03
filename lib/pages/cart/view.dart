import 'package:egou_app/common/routes.dart';
import 'package:egou_app/common/utils.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_strings.dart';
import 'package:egou_app/models/cart.dart';
import 'package:egou_app/pages/main/logic.dart';
import 'package:egou_app/pages/main/state.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'package:egou_app/middleware/app_middleware.dart';
import 'logic.dart';
import 'state.dart';

final double _padding_lr = ScreenUtil().setWidth(52);

class CartPage extends StatefulWidget {
  final PageController pageController;

  CartPage({Key key, this.pageController}):super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with RouteAware {
  final CartLogic logic = Get.put(CartLogic());
  final MainLogic mainLogic = Get.put(MainLogic());
  final CartState state = Get.find<CartLogic>().state;
  final MainState mainState = Get.find<MainLogic>().state;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    super.dispose();
    routeObserver.unsubscribe(this);
  }

  @override
  void didPopNext() async {
    logic.onGetCartList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: logic.onGetCartList() ,builder: (BuildContext context, AsyncSnapshot snapshot){
      if(snapshot.connectionState == ConnectionState.done) {
        return Obx((){
          final goodsList = state.cartList.value.lists != null? state.cartList.value.lists : [];
          final isAllSelected = state.selectedGoods.value.length == goodsList.length;
          final List<int> cart_ids = [];
          final List<int> selectCartIds = [];
          goodsList.forEach((element) {
            cart_ids.add(element.cartId);
            if (element.selected == 1 ) {
              selectCartIds.add(element.cartId);
            }
          });
          return Scaffold(
            appBar: CustomAppBar(title: '购物车', actions: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  logic.onChangeIsEditCart(state.isEditCart.value? false : true);
                },
                child: Container(
                  padding: EdgeInsets.only(right: 15),
                  alignment: Alignment.center,
                  child: Text(state.isEditCart.value ? AppStrings.STRING_CANCEL : AppStrings.STRING_6, style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                ) ,
              ),
            ]),
            body: Column(
              children: [
                // Container(
                //     padding: EdgeInsets.only(left: _padding_lr, right: _padding_lr, bottom: 10),
                //     color: Colors.white , child: Search('搜索商品')
                // ),
                goodsList.length == 0 ? Empty(text: '暂时还没有商品哦，快去添加吧~', btnText: '逛一逛', onTap: (){
                  mainLogic.onChangePageIndex(0);
                  widget.pageController.jumpToPage(0);
                },) : SizedBox(),
                goodsList.length > 0 ? Expanded(child: ListView(
                  padding: EdgeInsets.only(top: 10),
                  children: List.generate(goodsList.length, (index) => _CartItem(context, goodsList[index])),
                )) : SizedBox(),
                goodsList.length > 0 ? Container(
                    height: ScreenUtil().setWidth(200),
                    padding: EdgeInsets.fromLTRB(_padding_lr, 0, _padding_lr, 0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(top: BorderSide(width: 1, color: AppColors.COLOR_GRAY_DDDDDD))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: (){
                            logic.onCartSelected({
                              'cart_id': cart_ids,
                              'selected': isAllSelected ? 0 : 1
                            });
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              isAllSelected ? Image.asset(AppImages.ICON_6, width: ScreenUtil().setWidth(48), height: ScreenUtil().setWidth(48)) :
                              Image.asset(AppImages.ICON_5, width: ScreenUtil().setWidth(48), height: ScreenUtil().setWidth(48)),
                              Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('全选', style: TextStyle(
                                      fontSize:AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_333333
                                  ))
                              )
                            ],
                          ),
                        ),
                        state.isEditCart.value == false ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('合计: ', style: TextStyle(
                                fontSize:AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_333333
                            )),
                            Price(price: state.totalAmount.value.toString(),)
                          ],
                        ) : SizedBox(),
                        state.isEditCart.value == false ? RadiusButton('结算', width: 311, height: 130, onTap: (){
                          if (state.selectedGoods.value.length > 0) {
                            mainLogic.onSelectOrderGoods(state.selectedGoods.value);
                            Get.toNamed(RouteConfig.confirm_order + '?type=cart');
                          } else {
                            Utils.toast('请选择商品');
                          }
                        }): RadiusButton('删除', width: 311, height: 130, onTap: (){
                          if (state.selectedGoods.value.length > 0) {
                            AppAnimatedDialog.onShowAnimatedDialog(context, '确定删除${selectCartIds.length}件选中商品？', () async {
                              await logic.onCartDel({
                                'cart_id': selectCartIds
                              });
                              logic.onChangeIsEditCart(state.isEditCart.value? false : true);
                              Get.back(result: 'success');
                            });
                          } else {
                            Utils.toast('请选择商品');
                          }
                        })
                      ],
                    )
                )  : SizedBox(),
              ],
            ),
          );
        });
      }
      return SpinKit();
    });
  }

  Widget _CartItem(context, Lists item) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(_padding_lr, 10, _padding_lr, 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){
              logic.onCartSelected({
                'cart_id': [item.cartId],
                'selected': item.selected == 1 ? 0 : 1
              });
            },
            child: item.selected == 1 ? Image.asset(AppImages.ICON_6, width: ScreenUtil().setWidth(48), height: ScreenUtil().setWidth(48)) :
            Image.asset(AppImages.ICON_5, width: ScreenUtil().setWidth(48), height: ScreenUtil().setWidth(48)),
          ),
          Container(
            width:  ScreenUtil().setWidth(300),
            height:  ScreenUtil().setWidth(300),
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.COLOR_GRAY_F4F4F4, width: 3)
            ),
            child: Image.network(item.img, fit: BoxFit.cover),
          ),
          Expanded(child: SizedBox(
            height:  ScreenUtil().setWidth(300),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_48), maxLines: 2, overflow: TextOverflow.ellipsis,),
                Text(item.specValueStr, style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_41), maxLines: 1),
                // SizedBox(height: 5),
                // Container(color: AppColors.COLOR_PRIMARY_D22315, padding: EdgeInsets.fromLTRB(5, 2,5,2), child: Text('特例品', style: TextStyle(color: Colors.white, fontSize: AppFontsize.SIZE_32))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Price(price: item.price,),
                    Counter(leftTap: () {
                      if (item.goodsNum > 1) {
                        logic.onCartChange({
                          'cart_id': item.cartId,
                          'goods_num': item.goodsNum - 1
                        });
                      }
                    }, rightTap: (){
                      logic.onCartChange({
                        'cart_id': item.cartId,
                        'goods_num': item.goodsNum + 1
                      });
                    }, num: item.goodsNum,)
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}